import 'package:damage_calculator/state/calculator_controller.dart';
import 'package:damage_calculator/view/widget/text_styles.dart';
import 'package:damage_calculator/view/widget/status_input.dart';
import 'package:damage_calculator/view/widget/value_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calculatorProvider = StateNotifierProvider<CalculatorController>(
  (_) => CalculatorController(),
);

class CalculatorPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final controller = watch<CalculatorController>(calculatorProvider);
    final state = watch<CalculatorState>(calculatorProvider.state);

    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onPanDown: (_) => FocusScope.of(context).unfocus(),
          child: SizedBox(
            child: Column(
              children: [
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    '${state.minDamage} - ${state.maxDamage}',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Divider(height: 1),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: OutlinedButton(
                            onPressed: () => controller.toggleShowingDetail(),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '実数値計算機を${state.showingDetail ? "隠す" : "表示"}',
                                ),
                                const SizedBox(width: 8),
                                Icon(
                                  state.showingDetail
                                      ? Icons.keyboard_arrow_down
                                      : Icons.keyboard_arrow_right,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (state.showingDetail)
                          Container(
                            padding: const EdgeInsets.all(16),
                            color: Colors.green.shade50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('種族値', style: TextStyles.label),
                                Row(
                                  children: [
                                    Expanded(
                                      child: StatusInput(
                                        value: state.atkBase,
                                        onChanged: (value) => controller
                                            .updateStatus(atkBase: value),
                                      ),
                                    ),
                                    const SizedBox(width: 32),
                                    Expanded(
                                      child: StatusInput(
                                        value: state.defBase,
                                        onChanged: (value) => controller
                                            .updateStatus(defBase: value),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 40),
                                Text('個体値', style: TextStyles.label),
                                Row(
                                  children: [
                                    Expanded(
                                      child: StatusInput(
                                        value: state.atkIndividual,
                                        onChanged: (value) => controller
                                            .updateStatus(atkIndividual: value),
                                      ),
                                    ),
                                    const SizedBox(width: 32),
                                    Expanded(
                                      child: StatusInput(
                                        value: state.defIndividual,
                                        onChanged: (value) => controller
                                            .updateStatus(defIndividual: value),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 40),
                                Text('努力値', style: TextStyles.label),
                                Row(
                                  children: [
                                    Expanded(
                                      child: StatusInput(
                                        selections: [0, 4, 252],
                                        value: state.atkEffort,
                                        onChanged: (value) => controller
                                            .updateStatus(atkEffort: value),
                                      ),
                                    ),
                                    const SizedBox(width: 32),
                                    Expanded(
                                      child: StatusInput(
                                        selections: [0, 4, 252],
                                        value: state.defEffort,
                                        onChanged: (value) => controller
                                            .updateStatus(defEffort: value),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 40),
                                Text('性格補正', style: TextStyles.label),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: ToggleButtons(
                                          isSelected: CalculatorController
                                              .natureValues
                                              .map((value) =>
                                                  value == state.atkNature)
                                              .toList(),
                                          onPressed: (value) =>
                                              controller.updateStatus(
                                                  atkNature:
                                                      CalculatorController
                                                          .natureValues[value]),
                                          children: CalculatorController
                                              .natureValues
                                              .map<Widget>((value) {
                                            return Text('$value');
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 32),
                                    Expanded(
                                      child: Center(
                                        child: ToggleButtons(
                                          isSelected: CalculatorController
                                              .natureValues
                                              .map((value) =>
                                                  value == state.defNature)
                                              .toList(),
                                          onPressed: (value) =>
                                              controller.updateStatus(
                                                  defNature:
                                                      CalculatorController
                                                          .natureValues[value]),
                                          children: CalculatorController
                                              .natureValues
                                              .map<Widget>((value) {
                                            return Text('$value');
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('実数値', style: TextStyles.label),
                              Row(
                                children: [
                                  Expanded(
                                    child: ValueInput(
                                      controller:
                                          controller.atkActualController,
                                      onChanged: (value) => controller
                                          .updateStatus(atkActual: value),
                                    ),
                                  ),
                                  const SizedBox(width: 32),
                                  Expanded(
                                    child: ValueInput(
                                      controller:
                                          controller.defActualController,
                                      onChanged: (value) => controller
                                          .updateStatus(defActual: value),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 40),
                              Text('いりょく', style: TextStyles.label),
                              Row(
                                children: [
                                  Expanded(
                                    child: ValueInput(
                                      controller: controller.powerController,
                                      onChanged: (value) =>
                                          controller.updateDamage(power: value),
                                    ),
                                  ),
                                  const SizedBox(width: 32),
                                  Expanded(child: SizedBox.shrink()),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
