import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
            backgroundColor: Colors.transparent,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.asset('assets/image/DisneyHotsta.png'),
                  // child: Image.network('https://image.tmdb.org/t/p/w500/qV4fdXXUm5xNlEJ2jw7af3XxuQB.jpg'),
                ),
                const Icon(
                  Icons.cast,
                  size: 25,
                )
              ],
            ),
            floating: true,
            expandedHeight: 20,
          );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 350);
}
