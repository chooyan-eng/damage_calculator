import 'package:flutter/material.dart';

class ValueInput extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<int> onChanged;
  final String value;

  const ValueInput({
    Key? key,
    this.controller,
    required this.onChanged,
    this.value = '',
  }) : super(key: key);

  @override
  _ValueInputState createState() => _ValueInputState();
}

class _ValueInputState extends State<ValueInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller =
        widget.controller ?? (TextEditingController()..text = widget.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 20),
      controller: _controller,
      textAlign: TextAlign.center,
      maxLines: 1,
      decoration: InputDecoration(),
      keyboardType: TextInputType.number,
      onChanged: (value) => widget.onChanged(int.parse(value)),
    );
  }
}
