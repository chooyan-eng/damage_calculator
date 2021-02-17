import 'package:damage_calculator/util/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'calculator_controller.freezed.dart';

@freezed
abstract class CalculatorState with _$CalculatorState {
  // ignore: unused_element
  const CalculatorState._();

  const factory CalculatorState({
    @Default(true) bool showingDetail,
    @Default(100) int atkBase,
    @Default(31) int atkIndividual,
    @Default(0) int atkEffort,
    @Default(1.0) double atkNature,
    @Default(0) int atkActual,
    @Default(100) int defBase,
    @Default(31) int defIndividual,
    @Default(0) int defEffort,
    @Default(1.0) double defNature,
    @Default(0) int defActual,
    @Default(100) int power,
    @Default(0) int maxDamage,
    @Default(0) int minDamage,
    @Default([]) List<DamageScaleFactor> atkScaleFactorList,
    @Default([]) List<DamageScaleFactor> defScaleFactorList,
    DamageScaleFactor atkRank,
    DamageScaleFactor defRank,
  }) = _CalculatorState;

  double get totalAtkScaleFactor => atkScaleFactorList
      .where((element) => element.isEnabled)
      .map<double>((element) => element.scaleFactor)
      .fold(1.0, (total, scaleFactor) => total * scaleFactor);

  double get totalDefScaleFactor => defScaleFactorList
      .where((element) => element.isEnabled)
      .map<double>((element) => element.scaleFactor)
      .fold(1.0, (total, scaleFactor) => total * scaleFactor);
}

@freezed
abstract class DamageScaleFactor with _$DamageScaleFactor {
  const factory DamageScaleFactor(
    String label,
    double scaleFactor, {
    @Default(false) bool isEnabled,
  }) = _DamageScaleFactor;
}

class CalculatorController extends StateNotifier<CalculatorState> {
  static const natureValues = <double>[0.9, 1.0, 1.1];
  static const rankList = <DamageScaleFactor>[
    const DamageScaleFactor('+6', 4),
    const DamageScaleFactor('+5', 3.5),
    const DamageScaleFactor('+4', 3),
    const DamageScaleFactor('+3', 2.5),
    const DamageScaleFactor('+2', 2),
    const DamageScaleFactor('+1', 1.5),
    const DamageScaleFactor('0', 1.0),
    const DamageScaleFactor('-1', 2 / 3),
    const DamageScaleFactor('-2', 1 / 2),
    const DamageScaleFactor('-3', 2 / 5),
    const DamageScaleFactor('-4', 1 / 3),
    const DamageScaleFactor('-5', 2 / 7),
    const DamageScaleFactor('-6', 1 / 4),
  ];

  final atkActualController = TextEditingController()..text = '0';
  final defActualController = TextEditingController()..text = '0';
  final powerController = TextEditingController()..text = '100';

  CalculatorController() : super(const CalculatorState());

  void init() {
    state = state.copyWith(
      atkRank: rankList[6],
      defRank: rankList[6],
      atkScaleFactorList: <DamageScaleFactor>[
        const DamageScaleFactor('一致', 1.5),
        const DamageScaleFactor('弱点', 2.0),
        const DamageScaleFactor('4倍弱点', 4.0),
        const DamageScaleFactor('拘り', 1.5),
        const DamageScaleFactor('玉', 1.3),
        const DamageScaleFactor('1.1', 1.1),
        const DamageScaleFactor('1.2', 1.2),
        const DamageScaleFactor('1.5', 1.5),
        const DamageScaleFactor('2.0', 2.0),
      ],
      defScaleFactorList: <DamageScaleFactor>[
        const DamageScaleFactor('耐性', 2),
        const DamageScaleFactor('1/4耐性', 4),
        const DamageScaleFactor('チョッキ', 1.5),
        const DamageScaleFactor('きせき', 1.5),
        const DamageScaleFactor('2 / 3', 1.5),
        const DamageScaleFactor('1 / 2', 2),
      ],
    );

    updateStatus();
  }

  void toggleShowingDetail() {
    state = state.copyWith(
      showingDetail: !state.showingDetail,
    );
  }

  void updateStatus({
    int atkBase,
    int atkIndividual,
    int atkEffort,
    double atkNature,
    int atkActual,
    int defBase,
    int defIndividual,
    int defEffort,
    double defNature,
    int defActual,
  }) {
    state = state.copyWith(
      atkBase: atkBase ?? state.atkBase,
      atkIndividual: atkIndividual ?? state.atkIndividual,
      atkEffort: atkEffort ?? state.atkEffort,
      atkNature: atkNature ?? state.atkNature,
      defBase: defBase ?? state.defBase,
      defIndividual: defIndividual ?? state.defIndividual,
      defEffort: defEffort ?? state.defEffort,
      defNature: defNature ?? state.defNature,
    );

    final calculatedAtkActual = atkActual ??
        Calculator.toActualStatus(
          state.atkBase,
          individual: state.atkIndividual,
          effort: state.atkEffort,
          nature: state.atkNature,
        );

    final calculatedDefActual = defActual ??
        Calculator.toActualStatus(
          state.defBase,
          individual: state.defIndividual,
          effort: state.defEffort,
          nature: state.defNature,
        );

    state = state.copyWith(
      atkActual: calculatedAtkActual,
      defActual: calculatedDefActual,
    );

    if (atkActual == null) {
      atkActualController.text = state.atkActual.toString();
    }

    if (defActual == null) {
      defActualController.text = state.defActual.toString();
    }

    updateDamage();
  }

  void updateDamageScaleFactor({
    DamageScaleFactor atkScaleFactor,
    DamageScaleFactor defScaleFactor,
  }) {
    final atkIndex = state.atkScaleFactorList.indexOf(atkScaleFactor);
    final defIndex = state.defScaleFactorList.indexOf(defScaleFactor);

    if (atkIndex > -1) {
      state.atkScaleFactorList[atkIndex] =
          state.atkScaleFactorList[atkIndex].copyWith(
        isEnabled: !state.atkScaleFactorList[atkIndex].isEnabled,
      );
    }

    if (defIndex > -1) {
      state.defScaleFactorList[defIndex] =
          state.defScaleFactorList[defIndex].copyWith(
        isEnabled: !state.defScaleFactorList[defIndex].isEnabled,
      );
    }

    state = state.copyWith();

    updateDamage();
  }

  void updateRank({
    DamageScaleFactor atkRank,
    DamageScaleFactor defRank,
  }) {
    state = state.copyWith(
      atkRank: atkRank ?? state.atkRank,
      defRank: defRank ?? state.defRank,
    );
    updateDamage();
  }

  void updateDamage({int power}) {
    final damages = Calculator.toDamage(
      (state.atkActual * state.atkRank.scaleFactor).toInt(),
      (state.defActual * state.totalDefScaleFactor * state.defRank.scaleFactor)
          .toInt(),
      power ?? state.power,
      scaleFactor: state.totalAtkScaleFactor,
    );
    state = state.copyWith(
      power: power ?? state.power,
      minDamage: damages[0],
      maxDamage: damages[1],
    );
  }
}
