
import 'package:flutter/material.dart';
import 'package:hotstar/home/carousel.dart';
import 'package:hotstar/home/lates_release.dart';
import 'package:hotstar/home/sports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.asset('assets/image/DisneyHotsta.png'),
                ),
                const Icon(
                  Icons.cast,
                  size: 25,
                )
              ],
            ),
            floating: true,
            expandedHeight: 20,
          ),
          const SliverToBoxAdapter(
            child:Carousel()
          ),
          const SliverToBoxAdapter(
            child: LatestRelease(),
          ),
          const SliverToBoxAdapter(
            child: Sports(),
          ),

          SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Text('koi $index');
            },
          ))
        ],
      );
  }
}