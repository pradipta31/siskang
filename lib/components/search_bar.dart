import 'package:flutter/material.dart';

class SearchBarComponent extends StatelessWidget {
  final String? hint;
  final FocusNode? focusNode;
  final Function(String value)? searchQuery;
  const SearchBarComponent({Key? key, this.hint, this.searchQuery, this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8), color: Theme.of(context).cardColor),
      child: TextField(
        onChanged: (value) {
          if (searchQuery != null) {
            searchQuery!(value);
          }
        },
        focusNode: focusNode,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).primaryColor.withOpacity(0.27),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            hintText: hint ?? "",
            border: InputBorder.none),
        cursorColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
