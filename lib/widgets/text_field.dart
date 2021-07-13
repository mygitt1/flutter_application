import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final Function validator;

  final TextEditingController controller;

  const MyTextField({
    this.hintText,
    this.controller,
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              width: 2,
              color: Colors.brown.shade900,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
