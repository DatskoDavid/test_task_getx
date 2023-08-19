import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/controllers/home_screen_controller.dart';

class PageButton extends GetView<HomeScreenController> {
  final int page;
  final Function() onTap;

  const PageButton({
    Key? key,
    required this.page,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: controller.page.value == page
                ? Theme.of(context).colorScheme.primary.withAlpha(150)
                : Colors.grey[200],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              page.toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
