import 'package:damage_calculator/util/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'calculator_controller.freezed.dart';
part 'calculator_controller.g.dart';

@freezed
abstract class CalculatorState with _$CalculatorState {
  // ignore: unused_element
  const CalculatorState._();

  const factory CalculatorState({
    @Default(true) bool showingDetail,
    StatusParams atk,
    StatusParams def,
    @Default(100) int power,
    @Default(0) int maxDamage,
    @Default(0) int minDamage,
    @Default([]) List<DamageScaleFactor> atkScaleFactorList,
    @Default([]) List<DamageScaleFactor> defScaleFactorList,
    DamageScaleFactor atkRank,
    DamageScaleFactor defRank,
    StatusParams hp,
  }) = _CalculatorState;

  double get totalAtkScaleFactor => atkScaleFactorList
      .where((element) => element.isEnabled)
      .map<double>((element) => element.scaleFactor)
      .fold(1.0, (total, scaleFactor) => total * scaleFactor);

  double get totalDefScaleFactor => defScaleFactorList
      .where((element) => element.isEnabled)
      .map<double>((element) => element.scaleFactor)
      .fold(1.0, (total, scaleFactor) => total * scaleFactor);

  factory CalculatorState.fromJson(Map<String, dynamic> json) =>
      _$CalculatorStateFromJson(json);
}

@freezed
abstract class StatusParams with _$StatusParams {
  // ignore: unused_element
  const StatusParams._();

  const factory StatusParams({
    @Default('') String name,
    @Default(100) int base,
    @Default(31) int individual,
    @Default(0) int effort,
    @Default(1.0) double nature,
  }) = _StatusParams;

  factory StatusParams.fromJson(Map<String, dynamic> json) =>
      _$StatusParamsFromJson(json);

  int get actualStatus => Calculator.toActualStatus(
        base,
        effort: effort,
        individual: individual,
        nature: nature,
      );

  int get actualHp => Calculator.toActualHp(
        base,
        effort: effort,
        individual: individual,
      );
}

@freezed
abstract class DamageScaleFactor with _$DamageScaleFactor {
  const factory DamageScaleFactor(
    String label,
    double scaleFactor, {
    @Default(false) bool isEnabled,
  }) = _DamageScaleFactor;

  factory DamageScaleFactor.fromJson(Map<String, dynamic> json) =>
      _$DamageScaleFactorFromJson(json);
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

  final atkActualController = TextEditingController();
  final defActualController = TextEditingController();

  CalculatorController() : super(const CalculatorState());

  void init() {
    state = state.copyWith(
      atk: const StatusParams(),
      def: const StatusParams(),
      hp: const StatusParams(),
      atkRank: rankList[6],
      defRank: rankList[6],
      atkScaleFactorList: <DamageScaleFactor>[
        const DamageScaleFactor('一致', 1.5),
        const DamageScaleFactor('弱点', 2.0),
        const DamageScaleFactor('4倍弱点', 4.0),
        const DamageScaleFactor('拘り', 1.5),
        const DamageScaleFactor('珠', 1.3),
        const DamageScaleFactor('天候', 1.5),
        const DamageScaleFactor('フィールド', 1.3),
        const DamageScaleFactor('1.1', 1.1),
        const DamageScaleFactor('1.2', 1.2),
        const DamageScaleFactor('1.3', 1.2),
        const DamageScaleFactor('1.5', 1.5),
        const DamageScaleFactor('2.0', 2.0),
      ],
      defScaleFactorList: <DamageScaleFactor>[
        const DamageScaleFactor('耐性', 2),
        const DamageScaleFactor('1/4耐性', 4),
        const DamageScaleFactor('チョッキ', 1.5),
        const DamageScaleFactor('きせき', 1.5),
        const DamageScaleFactor('壁', 2),
        const DamageScaleFactor('天候', 2),
        const DamageScaleFactor('フィールド', 2),
        const DamageScaleFactor('2 / 3', 1.5),
        const DamageScaleFactor('1 / 2', 2),
      ],
    );

    updateStatus();
    updateHp();
  }

  void toggleShowingDetail() {
    state = state.copyWith(showingDetail: !state.showingDetail);
  }

  void updateStatus({
    String atkName,
    int atkBase,
    int atkIndividual,
    int atkEffort,
    double atkNature,
    int atkActual,
    String defName,
    int defBase,
    int defIndividual,
    int defEffort,
    double defNature,
    int defActual,
  }) {
    state = state.copyWith(
      atk: state.atk.copyWith(
        name: atkName ?? state.atk.name,
        base: atkBase ?? state.atk.base,
        individual: atkIndividual ?? state.atk.individual,
        effort: atkEffort ?? state.atk.effort,
        nature: atkNature ?? state.atk.nature,
      ),
      def: state.def.copyWith(
        name: defName ?? state.def.name,
        base: defBase ?? state.def.base,
        individual: defIndividual ?? state.def.individual,
        effort: defEffort ?? state.def.effort,
        nature: defNature ?? state.def.nature,
      ),
    );

    if (atkActual == null) {
      atkActualController.text = state.atk.actualStatus.toString();
    }

    if (defActual == null) {
      defActualController.text = state.def.actualStatus.toString();
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
      (state.atk.actualStatus * state.atkRank.scaleFactor).toInt(),
      (state.def.actualStatus *
              state.totalDefScaleFactor *
              state.defRank.scaleFactor)
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

  void updateHp({
    int hpBase,
    int hpIndividual,
    int hpEffort,
  }) {
    state = state.copyWith(
      hp: state.hp.copyWith(
        base: hpBase ?? state.hp.base,
        individual: hpIndividual ?? state.hp.individual,
        effort: hpEffort ?? state.hp.effort,
      ),
    );
  }
}
