import 'package:flutter/material.dart';

class MyInputTheme {
  TextStyle _buildTextStyle(Color color, {double size = 16}) {
    return TextStyle(color: color, fontSize: size);
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: color, width: 1.0),
    );
  }

  InputDecorationTheme theme() => InputDecorationTheme(
        contentPadding: const EdgeInsets.all(16),
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        constraints: const BoxConstraints(maxWidth: 250),
        enabledBorder: _buildBorder(Colors.grey[600]!),
        focusedBorder: _buildBorder(Colors.blue),
        errorBorder: _buildBorder(Colors.red),
        focusedErrorBorder: _buildBorder(Colors.red),
        border: _buildBorder(Colors.yellow),
        disabledBorder: _buildBorder(Colors.grey[400]!),

        //text
        suffixStyle: _buildTextStyle(Colors.black),
        counterStyle: _buildTextStyle(Colors.grey, size: 12),
        floatingLabelStyle: _buildTextStyle(Colors.black),

        //make error helper same style
        errorStyle: _buildTextStyle(Colors.red, size: 12),
        hintStyle: _buildTextStyle(Colors.grey),
        labelStyle: _buildTextStyle(Colors.black),
        prefixStyle: _buildTextStyle(Colors.black),
        helperStyle: _buildTextStyle(Colors.black, size: 12),
      );
}
