import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: ColoredBox(
          color: Colors.black,
          child: SizedBox(
            height: 200,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
            Text('dt'),
            Text('du'),
            Text('di'),
                ],
              ),
          ),
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 350);
}
