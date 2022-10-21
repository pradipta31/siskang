import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siskangv2/themes/color_pallete.dart';

// ignore: must_be_immutable
class UnderlineInputText extends StatelessWidget {
  TextEditingController? textEditingController;
  bool readOnly;
  String? hint;
  int? maxLines;
  dynamic initValue;
  TextInputType keyboardType;
  Function(dynamic)? onChanged;
  TextAlign textAlign;

  UnderlineInputText(
      {Key? key,
      this.textEditingController,
      this.readOnly = false,
      this.maxLines,
      this.initValue,
      this.hint,
      this.onChanged,
      this.keyboardType = TextInputType.text,
      this.textAlign = TextAlign.left})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign,
      initialValue: initValue,
      controller: textEditingController,
      keyboardType: keyboardType,
      readOnly: readOnly,
      maxLines: maxLines,
      onChanged: (value) {
        onChanged!(value);
      },
      style: Get.textTheme.subtitle1!.copyWith(fontSize: 14),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        hintText: hint,
        fillColor: Pallete.transparent,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Pallete.buttonOutlineColor),
        ),
        disabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Pallete.darkGrey),
        ),
      ),
    );
  }
}
