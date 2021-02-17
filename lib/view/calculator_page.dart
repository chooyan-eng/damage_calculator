import 'package:damage_calculator/state/calculator_controller.dart';
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
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      'HP',
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
                              '${state.hpActual}',
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
                                        Text('${state.hpActual ~/ ratio}',
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
                                      value: state.hpBase,
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
                                      value: state.hpIndividual,
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
                                      value: state.hpEffort,
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
                    defActual: state.defActual,
                  ),
                ),
              ),
              const SizedBox(width: 32),
              Expanded(
                child: ValueInput(
                  controller: controller.defActualController,
                  onChanged: (value) => controller.updateStatus(
                      defActual: value, atkActual: state.atkActual),
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
                    }).toList(),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('種族値', style: TextStyles.label),
          Row(
            children: [
              Expanded(
                child: StatusInput(
                  value: state.atkBase,
                  onChanged: (value) => controller.updateStatus(atkBase: value),
                ),
              ),
              const SizedBox(width: 32),
              Expanded(
                child: StatusInput(
                  value: state.defBase,
                  onChanged: (value) => controller.updateStatus(defBase: value),
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
                  onChanged: (value) =>
                      controller.updateStatus(atkIndividual: value),
                ),
              ),
              const SizedBox(width: 32),
              Expanded(
                child: StatusInput(
                  value: state.defIndividual,
                  onChanged: (value) =>
                      controller.updateStatus(defIndividual: value),
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
                  onChanged: (value) =>
                      controller.updateStatus(atkEffort: value),
                ),
              ),
              const SizedBox(width: 32),
              Expanded(
                child: StatusInput(
                  selections: [0, 4, 252],
                  value: state.defEffort,
                  onChanged: (value) =>
                      controller.updateStatus(defEffort: value),
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
                    isSelected: CalculatorController.natureValues
                        .map((value) => value == state.atkNature)
                        .toList(),
                    onPressed: (value) => controller.updateStatus(
                        atkNature: CalculatorController.natureValues[value]),
                    children:
                        CalculatorController.natureValues.map<Widget>((value) {
                      return Text('$value');
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(width: 32),
              Expanded(
                child: Center(
                  child: ToggleButtons(
                    isSelected: CalculatorController.natureValues
                        .map((value) => value == state.defNature)
                        .toList(),
                    onPressed: (value) => controller.updateStatus(
                        defNature: CalculatorController.natureValues[value]),
                    children:
                        CalculatorController.natureValues.map<Widget>((value) {
                      return Text('$value');
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
