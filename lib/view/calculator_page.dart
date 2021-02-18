import 'package:damage_calculator/state/calculator_controller.dart';
import 'package:damage_calculator/view/widget/string_input.dart';
import 'package:damage_calculator/view/widget/text_styles.dart';
import 'package:damage_calculator/view/widget/status_input.dart';
import 'package:damage_calculator/view/widget/value_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calculatorProvider = StateNotifierProvider<CalculatorController>(
  (_) => CalculatorController()..init(),
);

class CalculatorPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final controller = context.read(calculatorProvider);
    final state = watch<CalculatorState>(calculatorProvider.state);

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onPanDown: (_) => FocusScope.of(context).unfocus(),
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
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 16),
                                Text('名前', style: TextStyles.label),
                                Row(
                                  children: [
                                    Expanded(
                                      child: StringInput(
                                        onChanged: (value) => controller
                                            .updateStatus(atkName: value),
                                      ),
                                    ),
                                    const SizedBox(width: 32),
                                    Expanded(
                                      child: StringInput(
                                        onChanged: (value) => controller
                                            .updateStatus(defName: value),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                OutlinedButton(
                                  onPressed: () =>
                                      controller.toggleShowingDetail(),
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
                              ],
                            ),
                          ),
                          if (state.showingDetail)
                            _buildActualCalculator(state, controller),
                          _buildConcreteValueArea(controller, state),
                          const SizedBox(height: 240),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: _buildHpSheet(context, state, controller),
          ),
        ],
      ),
    );
  }

  Container _buildHpSheet(BuildContext context, CalculatorState state,
      CalculatorController controller) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: DraggableScrollableSheet(
        initialChildSize: 0.5,
        maxChildSize: 1.0,
        minChildSize: 0.3,
        builder: (context, scrollController) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onPanDown: (_) => FocusScope.of(context).unfocus(),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    color: Colors.blue,
                  ),
                  height: 24,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      'H P',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    controller: scrollController,
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              '${state.hp.actualHp}',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [2, 4, 8, 10, 16, 32]
                                .map<Widget>(
                                  (ratio) => Expanded(
                                    child: Column(
                                      children: [
                                        Text('1 / $ratio',
                                            style: TextStyles.label),
                                        const SizedBox(height: 8),
                                        Text('${state.hp.actualHp ~/ ratio}',
                                            style: TextStyles.damage),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          const SizedBox(height: 32),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('種族値', style: TextStyles.label),
                                    StatusInput(
                                      value: state.hp.base,
                                      onChanged: (value) =>
                                          controller.updateHp(hpBase: value),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('個体値', style: TextStyles.label),
                                    StatusInput(
                                      value: state.hp.individual,
                                      onChanged: (value) => controller.updateHp(
                                          hpIndividual: value),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('努力値', style: TextStyles.label),
                                    StatusInput(
                                      value: state.hp.effort,
                                      selections: [0, 4, 252],
                                      onChanged: (value) =>
                                          controller.updateHp(hpEffort: value),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 120),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Padding _buildConcreteValueArea(
    CalculatorController controller,
    CalculatorState state,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('実数値', style: TextStyles.label),
          Row(
            children: [
              Expanded(
                child: ValueInput(
                  controller: controller.atkActualController,
                  onChanged: (value) => controller.updateStatus(
                    atkActual: value,
                    defActual: state.def.actualHp,
                  ),
                ),
              ),
              const SizedBox(width: 32),
              Expanded(
                child: ValueInput(
                  controller: controller.defActualController,
                  onChanged: (value) => controller.updateStatus(
                      defActual: value, atkActual: state.atk.actualHp),
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
                  value: state.power.toString(),
                  onChanged: (value) => controller.updateDamage(power: value),
                ),
              ),
              const SizedBox(width: 32),
              Expanded(child: SizedBox.shrink()),
            ],
          ),
          const SizedBox(height: 40),
          Text('ダメージ補正', style: TextStyles.label),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Wrap(
                  spacing: 4,
                  children: state.atkScaleFactorList
                      .map<FilterChip>(
                        (element) => FilterChip(
                          onSelected: (value) {
                            controller.updateDamageScaleFactor(
                              atkScaleFactor: element,
                            );
                          },
                          label: Text(
                            element.label,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                          selected: element.isEnabled,
                          selectedColor: Colors.blue,
                          showCheckmark: false,
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(width: 32),
              Expanded(
                child: Wrap(
                  spacing: 4,
                  children: state.defScaleFactorList
                      .map<FilterChip>(
                        (element) => FilterChip(
                          onSelected: (value) {
                            controller.updateDamageScaleFactor(
                              defScaleFactor: element,
                            );
                          },
                          label: Text(
                            element.label,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                          selected: element.isEnabled,
                          selectedColor: Colors.blue,
                          showCheckmark: false,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text('ランク補正', style: TextStyles.label),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: DropdownButton<DamageScaleFactor>(
                    value: state.atkRank,
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.blue),
                    underline: Container(
                      height: 2,
                      color: Colors.blue,
                    ),
                    onChanged: (DamageScaleFactor newValue) =>
                        controller.updateRank(atkRank: newValue),
                    items: CalculatorController.rankList
                        .map<DropdownMenuItem<DamageScaleFactor>>(
                            (DamageScaleFactor value) {
                      return DropdownMenuItem<DamageScaleFactor>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Text(value.label),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(width: 32),
              Expanded(
                child: Center(
                  child: DropdownButton<DamageScaleFactor>(
                    value: state.defRank,
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.blue),
                    underline: Container(
                      height: 2,
                      color: Colors.blue,
                    ),
                    onChanged: (DamageScaleFactor newValue) =>
                        controller.updateRank(defRank: newValue),
                    items: CalculatorController.rankList
                        .map<DropdownMenuItem<DamageScaleFactor>>(
                      (DamageScaleFactor value) {
                        return DropdownMenuItem<DamageScaleFactor>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Text(value.label),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildActualCalculator(
    CalculatorState state,
    CalculatorController controller,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.green.shade50,
      child: Row(
        children: [
          Expanded(
            child: _VerticalStatusInput(
              baseLabel: '種族値',
              individualLabel: '個体値',
              effortLabel: '努力値',
              natureLabel: '性格補正',
              baseValue: state.atk.base,
              individualValue: state.atk.individual,
              effortValue: state.atk.effort,
              natureValue: state.atk.nature,
              onBaseChange: (value) => controller.updateStatus(atkBase: value),
              onIndividualChange: (value) =>
                  controller.updateStatus(atkIndividual: value),
              onEffortChange: (value) =>
                  controller.updateStatus(atkEffort: value),
              onNatureChange: (value) =>
                  controller.updateStatus(atkNature: value),
            ),
          ),
          const SizedBox(width: 32),
          Expanded(
            child: _VerticalStatusInput(
              baseValue: state.def.base,
              individualValue: state.def.individual,
              effortValue: state.def.effort,
              natureValue: state.def.nature,
              onBaseChange: (value) => controller.updateStatus(defBase: value),
              onIndividualChange: (value) =>
                  controller.updateStatus(defIndividual: value),
              onEffortChange: (value) =>
                  controller.updateStatus(defEffort: value),
              onNatureChange: (value) =>
                  controller.updateStatus(defNature: value),
            ),
          ),
        ],
      ),
    );
  }
}

class _VerticalStatusInput extends StatelessWidget {
  final String baseLabel;
  final String individualLabel;
  final String effortLabel;
  final String natureLabel;
  final int baseValue;
  final int individualValue;
  final int effortValue;
  final double natureValue;
  final ValueChanged<int> onBaseChange;
  final ValueChanged<int> onIndividualChange;
  final ValueChanged<int> onEffortChange;
  final ValueChanged<double> onNatureChange;

  const _VerticalStatusInput({
    Key key,
    this.baseLabel = '',
    this.individualLabel = '',
    this.effortLabel = '',
    this.natureLabel = '',
    this.baseValue,
    this.individualValue,
    this.effortValue,
    this.natureValue,
    this.onBaseChange,
    this.onIndividualChange,
    this.onEffortChange,
    this.onNatureChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(baseLabel, style: TextStyles.label),
        StatusInput(
          value: baseValue,
          onChanged: onBaseChange,
        ),
        const SizedBox(height: 40),
        Text(individualLabel, style: TextStyles.label),
        StatusInput(
          value: individualValue,
          onChanged: onIndividualChange,
        ),
        const SizedBox(height: 40),
        Text(effortLabel, style: TextStyles.label),
        StatusInput(
          selections: [0, 4, 252],
          value: effortValue,
          onChanged: onEffortChange,
        ),
        const SizedBox(height: 40),
        Text(natureLabel, style: TextStyles.label),
        const SizedBox(height: 8),
        Center(
          child: ToggleButtons(
            isSelected: CalculatorController.natureValues
                .map((value) => value == natureValue)
                .toList(),
            onPressed: (index) =>
                onNatureChange(CalculatorController.natureValues[index]),
            children: CalculatorController.natureValues
                .map<Widget>((value) => Text('$value'))
                .toList(),
          ),
        ),
      ],
    );
  }
}
