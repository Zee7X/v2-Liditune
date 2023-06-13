import 'package:flutter/material.dart';

import '../modules/Login/controllers/login_controller.dart';


class FormLogin extends StatelessWidget {
  const FormLogin(
      {super.key,
      // super.key,
      this.namaicon2,
      required this.namaController,
      required this.textHintText,
      required this.namaIcon,
      this.controller,
      this.obsecure,
      this.textInputAction,
      this.suffixicon1});

  final LoginController? controller;
  final TextEditingController namaController;
  final String textHintText;
  final IconData namaIcon;
  final bool? obsecure;
  final TextInputAction? textInputAction;
  final IconData? namaicon2;
  final Widget? suffixicon1;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      shadowColor: Colors.grey.withOpacity(0.5),
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(25),
      child: TextField(
        textInputAction: textInputAction,
        style: const TextStyle(fontSize: 20),
        controller: namaController,
        // obscureText: true,
        obscureText: obsecure ?? false,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          // isDense: true,
          contentPadding: EdgeInsets.zero,
          suffixIcon: suffixicon1,
          prefixIcon: Icon(namaIcon, size: 25),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: textHintText.toString(),
          hintStyle: const TextStyle(
            fontFamily: 'Rubik',
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black45,
          ),
        ),
      ),
    );
  }
}
