import 'package:fetching_api/component/menu_items.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showPopover(
        context: context,
        bodyBuilder: (context) => MenuItem(),
        width: 250,
        height: 150,
        transitionDuration: Duration(milliseconds: 100),
        radius: 20,
        direction: PopoverDirection.top,
        arrowWidth: 10,
        arrowHeight: 5,
        arrowDyOffset: 2,
      ),
      child: const Icon(Icons.more_vert),
    );
  }
}
