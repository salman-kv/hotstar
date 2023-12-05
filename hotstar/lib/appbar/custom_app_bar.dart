import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Text('hhhhhhhhh',style: TextStyle(color: Colors.deepOrangeAccent),));
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 60);
}