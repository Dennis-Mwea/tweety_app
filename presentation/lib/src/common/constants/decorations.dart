import 'package:flutter/material.dart';

class Decorations {
  static emailInputDecoration(BuildContext context, {String? error}) => InputDecoration(
        filled: true,
        focusColor: Theme.of(context).primaryColor,
        enabledBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(width: 2.0, color: Colors.red)),
        prefixIcon: Icon(Icons.mail, color: Colors.grey),
        hintText: 'Email',
        errorText: error,
      );

  static passwordInputDecoration(BuildContext context, bool isPasswordHidden, VoidCallback toggleShowPassword, {String? error}) =>
      InputDecoration(
        filled: true,
        focusColor: Theme.of(context).primaryColor,
        enabledBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(width: 2.0, color: Colors.red)),
        prefixIcon: Icon(Icons.lock_outline, color: Colors.grey),
        suffixIcon: IconButton(
          icon: isPasswordHidden ? Icon(Icons.visibility_off, color: Colors.grey) : Icon(Icons.visibility, color: Colors.grey),
          onPressed: toggleShowPassword,
        ),
        hintText: 'Password',
        errorText: error,
      );
}
