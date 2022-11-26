import 'package:flutter/material.dart';

class LengthTextField extends StatefulWidget {
  final double? initialValue;
  final double width;
  final String suffixValue;
  final TextStyle valueStyle;
  final TextStyle suffixStyle;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  const LengthTextField({
    Key? key,
    this.initialValue,
    required this.width,
    required this.suffixValue,
    required this.valueStyle,
    required this.suffixStyle,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  @override
  State<LengthTextField> createState() => _LengthTextFieldState();
}

class _LengthTextFieldState extends State<LengthTextField> {
  final _controller = TextEditingController();

  bool get notEmpty => _controller.text != '';

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      _controller.text = widget.initialValue!.toStringAsFixed(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextFormField(
        textAlign: TextAlign.right,
        controller: _controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        style: widget.valueStyle,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixText: notEmpty ? widget.suffixValue : null,
          suffixStyle: widget.suffixStyle,
        ),
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onSubmitted,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
