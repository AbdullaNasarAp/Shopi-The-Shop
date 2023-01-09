import 'package:flutter/material.dart';
import 'package:shopi/utils/utils.dart';

class CustomTextFormfield extends StatelessWidget {
  const CustomTextFormfield({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.action,
    required this.icon,
    required this.hint,
    required this.obscure,
    required this.validator,
    this.suffixOntap,
    this.suffixIcon,
    this.initvalue,
    required this.onsaved,
  });
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction action;
  final IconData icon;
  final String hint;
  final bool obscure;
  final String? Function(String?)? validator;
  final void Function()? suffixOntap;
  final IconData? suffixIcon;
  final String? initvalue;
  final void Function(String?)? onsaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onsaved,
      initialValue: initvalue,
      autofocus: false,
      keyboardType: keyboardType,
      textInputAction: action,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        fillColor: kGrey,
        prefixIcon: Icon(
          icon,
          color: kGrey,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        hintText: hint,
        hintStyle: const TextStyle(color: kGrey),
        suffixIcon: obscure == true
            ? IconButton(
                onPressed: suffixOntap,
                icon: Icon(
                  suffixIcon,
                  color: kBlack,
                ),
              )
            : null,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
                style: BorderStyle.solid, color: kGrey, width: 1)),
      ),
      obscureText: obscure,
    );
  }
}
