import 'package:damage_calculator/util/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'calculator_controller.freezed.dart';

@freezed
abstract class CalculatorState with _$CalculatorState {
  const factory CalculatorState({
    @Default(true) bool showingDetail,
    @Default(0) int atkBase,
    @Default(31) int atkIndividual,
    @Default(0) int atkEffort,
    @Default(1.0) double atkNature,
    @Default(0) int atkActual,
    @Default(0) int defBase,
    @Default(31) int defIndividual,
    @Default(0) int defEffort,
    @Default(1.0) double defNature,
    @Default(0) int defActual,
    @Default(100) int power,
    @Default(0) int maxDamage,
    @Default(0) int minDamage,
  }) = _CalculatorState;
}

class CalculatorController extends StateNotifier<CalculatorState> {
  static const natureValues = <double>[0.9, 1.0, 1.1];

  final atkActualController = TextEditingController()..text = '0';
  final defActualController = TextEditingController()..text = '0';
  final powerController = TextEditingController()..text = '100';

  CalculatorController() : super(const CalculatorState());

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

    final calculatedDefActual = Calculator.toActualStatus(
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

  void updateDamage({int power}) {
    final damages = Calculator.toDamage(
      state.atkActual,
      state.defActual,
      power ?? state.power,
    );
    state = state.copyWith(
      power: power ?? state.power,
      minDamage: damages[0],
      maxDamage: damages[1],
    );
  }
}
