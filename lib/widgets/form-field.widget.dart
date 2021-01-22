import 'package:flutter/material.dart';

class WuiTextField extends StatelessWidget {

  final TextEditingController controller;
  final bool outlined;
  final bool obscureText;
  final InputDecoration decoration;

  WuiTextField({
    this.controller,
    this.outlined = false,
    this.decoration,
    this.obscureText = false
  });

  InputBorder _getBorder() {
    BorderSide borderSide = BorderSide(color: Colors.black.withOpacity(.08));
    return outlined ? OutlineInputBorder(borderSide: borderSide) : UnderlineInputBorder(borderSide: borderSide);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: decoration != null ? 
        decoration.copyWith(border: _getBorder()) : 
        InputDecoration(border: _getBorder())
    );
  }
}