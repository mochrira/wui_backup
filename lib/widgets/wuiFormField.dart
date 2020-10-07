import 'package:flutter/material.dart';
import 'package:wui/colors/primary.color.dart';

class WuiFormField extends StatefulWidget {

  final InputDecoration decoration;
  final TextEditingController controller;
  final bool obscureText;

  WuiFormField({
    this.controller,
    this.decoration,
    this.obscureText = false
  });

  @override
  _WuiFormFieldState createState() => _WuiFormFieldState();
}

class _WuiFormFieldState extends State<WuiFormField> {

  FocusNode _focusNode;

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  void initState() {
    super.initState();
    _focusNode = new FocusNode();
    _focusNode.addListener(_onFocusNode);
  }

  _onFocusNode() {
    setState(() {});
  }

  IconThemeData _prefixIconTheme() {
    return _focusNode.hasFocus ? Theme.of(context).primaryIconTheme : Theme.of(context).iconTheme;
  }

  Color _labelColor() {
    return _focusNode.hasFocus ? primaryColor : textColor;
  }

  @override
  Widget build(BuildContext context) {
    
    InputDecoration decoration = widget.decoration.copyWith(
      prefixIcon: IconTheme(
        data: _prefixIconTheme(),
        child: widget.decoration.prefixIcon,
      ),
      labelStyle: TextStyle(
        color: _labelColor()
      )
    );

    return TextField(
      focusNode: _focusNode,
      obscureText: widget.obscureText,
      controller: widget.controller,
      decoration: decoration
    );
  }
}