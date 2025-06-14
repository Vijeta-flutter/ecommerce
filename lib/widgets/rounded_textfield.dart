// import 'package:ecommerce/constants/app_colors.dart';
// import 'package:flutter/material.dart';

// class RoundedTextFormField extends StatelessWidget {
//   final String labelText;
//   final TextEditingController? controller;
//   final TextInputType? keyboardType;
//   final bool obscureText;

//   const RoundedTextFormField({
//     Key? key,
//     required this.labelText,
//     this.controller,
//     this.keyboardType,
//     this.obscureText = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: keyboardType,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: AppColors.white,
//         labelText: labelText,
//         labelStyle: TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 16,
//           color: AppColors.black,
//         ),
//         contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: AppColors.lightGreyBorder, width: 1),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: Colors.blue, width: 2),
//         ),
//       ),
//     );
//   }
// }

import 'package:ecommerce/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RoundedTextFormField extends StatelessWidget {
  final String labelText;
  final String? hintText; // ✅ Optional hint text
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;

  const RoundedTextFormField({
    Key? key,
    required this.labelText,
    this.hintText, // ✅ Add to constructor
    this.controller,
    this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        labelText: labelText, // ✅ Floating label
        hintText: hintText, // ✅ Hint inside field (optional)
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: AppColors.black,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.lightGreyBorder, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.pinkishRed, width: 2),
        ),
      ),
    );
  }
}
