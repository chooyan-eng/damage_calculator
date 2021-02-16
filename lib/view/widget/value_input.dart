import 'package:flutter/material.dart';

class ValueInput extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<int> onChanged;

  const ValueInput({
    Key key,
    this.controller,
    this.onChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      maxLines: 1,
      decoration: InputDecoration(),
      keyboardType: TextInputType.number,
      onChanged: (value) => onChanged(int.parse(value)),
    );
  }
}
