import 'package:damage_calculator/view/widget/value_input.dart';
import 'package:flutter/material.dart';

class StatusInput extends StatefulWidget {
  final List<int> selections;
  final int value;
  final ValueChanged<int> onChanged;

  StatusInput({
    Key key,
    this.selections,
    this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  _StatusInputState createState() => _StatusInputState();
}

class _StatusInputState extends State<StatusInput> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController()..text = widget.value.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueInput(
          controller: _controller,
          onChanged: (value) => widget.onChanged(value),
        ),
        if (widget.selections?.isNotEmpty ?? false) ...[
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: widget.selections
                .map<List<Widget>>(
                  (value) {
                    return <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _controller.text = '$value';
                            widget.onChanged(value);
                          },
                          child: Text(
                            '$value',
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                    ];
                  },
                )
                .expand((element) => element)
                .toList(),
          ),
        ],
      ],
    );
  }
}
