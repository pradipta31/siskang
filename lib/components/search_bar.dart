import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarComponent extends StatelessWidget {
  final String? hint;
  final Function(String value)? searchQuery;
  SearchBarComponent({Key? key, this.hint, this.searchQuery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).cardColor),
      child: TextField(
        onChanged: (value) {
          if (searchQuery != null) {
            searchQuery!(value);
          }
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).primaryColor.withOpacity(0.27),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            hintText: hint ?? "",
            border: InputBorder.none),
        cursorColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
