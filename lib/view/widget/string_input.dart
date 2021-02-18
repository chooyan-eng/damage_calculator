import 'package:flutter/material.dart';

class StringInput extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String value;

  const StringInput({
    Key key,
    this.controller,
    this.onChanged,
    this.value,
  }) : super(key: key);

  @override
  _StringInputState createState() => _StringInputState();
}

class _StringInputState extends State<StringInput> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController()
      ..text = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 16),
      controller: _controller,
      textAlign: TextAlign.center,
      maxLines: 1,
      decoration: InputDecoration(),
      keyboardType: TextInputType.number,
      onChanged: widget.onChanged,
    );
  }
}
