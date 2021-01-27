import 'package:flutter/material.dart';

class WuiTextField extends StatelessWidget {

  final TextEditingController controller;
  final bool outlined;
  final bool obscureText;
  final InputDecoration decoration;
  final bool border;
  final FocusNode focusNode;
  final Function(String) onChanged;
  final Function onTap;
  final bool enabled;
  final bool readOnly;
  final TextInputType keyboardType;

  WuiTextField({
    this.keyboardType,
    this.readOnly = false,
    this.enabled,
    this.controller,
    this.focusNode,
    this.border = true,
    this.outlined = false,
    this.decoration,
    this.obscureText = false,
    this.onChanged,
    this.onTap
  });

  InputBorder _getBorder() {
    BorderSide borderSide = BorderSide(color: Colors.black.withOpacity(.08));
    return border == false ? InputBorder.none : (outlined ? OutlineInputBorder(borderSide: borderSide) : UnderlineInputBorder(borderSide: borderSide));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: controller,
      obscureText: obscureText,
      decoration: decoration != null ? 
        decoration.copyWith(
          border: _getBorder(),
          enabledBorder: _getBorder()
        ) : 
        InputDecoration(
          border: _getBorder(),
          enabledBorder: _getBorder()
        ),
      enabled: enabled,
      readOnly: readOnly,
      onTap: onTap,
      onChanged: onChanged,
      keyboardType: keyboardType,
    );
  }
}