import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final validator;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? hintText;
  final bool? obScureText;
  final bool? edit;
  final Widget? sufixIcon;
  final Color? fillColor;
  final Widget? prefixIcon;
  final VoidCallback? onChanged;
  final TextInputType? keyboardType;
  CommonTextField(
      {Key? key,
      this.validator,
      this.textInputAction,
      this.controller,
      this.hintText,
      this.obScureText = false,
      this.sufixIcon,
      this.fillColor = Colors.transparent,
      this.prefixIcon,
      this.onChanged,
      this.keyboardType = TextInputType.emailAddress,
      this.edit = true})
      : super(key: key);

  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: 16,
        // color: AppColors.grey.withAlpha(200),
      ),
      onTap: onChanged,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obScureText!,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: sufixIcon,
        prefixIcon: prefixIcon,
        enabled: edit!,
        hintStyle: TextStyle(fontSize: 16, color: Colors.white54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white38),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
