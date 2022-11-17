import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siskangv2/themes/color_pallete.dart';

class InPageSearchBar extends StatelessWidget {
  final String? hint;
  final Function(String)? searchQuery;
  final Function(String)? onSubmitted;
  final FocusNode? focusNode;
  const InPageSearchBar({Key? key, this.onSubmitted, this.focusNode, this.hint, this.searchQuery})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? _lastInput;
    return Container(
      decoration: BoxDecoration(
        color: Pallete.lighterGrey,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: TextField(
            onSubmitted: onSubmitted,
            focusNode: focusNode,
            style: Get.textTheme.bodyText1,
            maxLines: 1,
            onChanged: (query) {
              if (_lastInput != query) {
                searchQuery!(query);
                _lastInput = query;
              }
            },
            decoration: InputDecoration(
              fillColor: Pallete.transparent,
              contentPadding: EdgeInsets.zero,
              iconColor: Pallete.primaryLight,
              prefixIcon: const Icon(Icons.search),
              hintText: hint,
              border: InputBorder.none,
            ),
            cursorColor: Pallete.primaryLight,
          ),
        ),
      ),
    );
  }
}
