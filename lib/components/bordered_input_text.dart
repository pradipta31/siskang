import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siskangv2/themes/color_pallete.dart';

// ignore: must_be_immutable
class BorderedInputText extends StatelessWidget {
  Function(dynamic)? data;
  String? hint;
  bool addSuffix;
  TextEditingController? textEditingController;
  bool readOnly;
  dynamic maxLines;
  dynamic initValue;
  dynamic textAlign;
  bool isObsecure;
  IconData? suffixIcon;
  TextInputType? type;
  BorderedInputText(
      {Key? key,
      this.hint,
      this.addSuffix = false,
      this.textEditingController,
      this.readOnly = false,
      this.maxLines,
      this.initValue,
      this.type = TextInputType.text,
      this.suffixIcon,
      this.isObsecure = false,
      this.textAlign = TextAlign.left,
      this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      readOnly: readOnly,
      initialValue: initValue,
      keyboardType: type,
      obscureText: isObsecure,
      textAlign: textAlign,
      textCapitalization: TextCapitalization.sentences,
      cursorColor: Get.theme.primaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        isDense: true,
        suffixIcon: addSuffix
            ? Icon(
                suffixIcon ?? Icons.error,
                color: Get.theme.primaryColor,
                size: 24,
              )
            : null,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Pallete.buttonOutlineColor, width: 1.0),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Pallete.buttonMainColor, width: 1.0),
            borderRadius: BorderRadius.circular(10)),
        hintText: hint,
        hintStyle: Get.textTheme.bodyText1,
      ),
      onChanged: data,
    );
  }
}
