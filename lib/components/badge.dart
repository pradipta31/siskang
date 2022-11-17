import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Color? colorBadge;
  final String titleBadge;
  final Widget iconBadge;

  const Badge({
    Key? key,
    this.colorBadge,
    required this.titleBadge,
    required this.iconBadge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 1,
        horizontal: 4,
      ),
      decoration: BoxDecoration(
        color: colorBadge,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconBadge,
          Text(
            titleBadge,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
