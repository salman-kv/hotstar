import 'package:flutter/material.dart';
import 'package:hotstar/function/movie.dart';
import 'package:hotstar/home/carousel.dart';
import 'package:hotstar/home/potrate_list.dart';
import 'package:hotstar/home/landscape_list.dart';

class HomeScreen extends StatelessWidget {
  final List<dynamic>? apidata;
  const HomeScreen({super.key, this.apidata});

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
          ),
          const SliverToBoxAdapter(
            child:Carousel()
          ),
           SliverToBoxAdapter(
            child: PotrateList(name: 'Latest Releases',listData: latest),
          ),
           SliverToBoxAdapter(
            child: LandScapeList(name: 'Trending', ListData: trending),
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