// ignore_for_file: must_be_immutable, prefer_final_fields

import 'package:flutter/material.dart';

class CustomRegistrationPasswordField extends StatefulWidget {
  CustomRegistrationPasswordField({super.key, this.hintText, this.onChanged});
  Function(String)? onChanged;
  String? hintText;

  @override
  State<CustomRegistrationPasswordField> createState() =>
      _CustomRegistrationPasswordFieldState();
}

class _CustomRegistrationPasswordFieldState
    extends State<CustomRegistrationPasswordField> {
  TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password.';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long.';
    } else if (!RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()]).{8,}$')
        .hasMatch(value)) {
      return 'Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      controller: _passwordController,
      obscureText: _isObscure,
      validator: _validatePassword,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: const TextStyle(color: Colors.white),
        suffixIcon: IconButton(
          color: Colors.white,
          icon: Icon(
            _isObscure ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
