import 'package:flutter/material.dart';
import 'package:hotstar/api/calling_api.dart';
import 'package:hotstar/widget/custom_app_bar.dart';
import 'package:hotstar/widget/carousel.dart';
import 'package:hotstar/widget/potrate_list.dart';
import 'package:hotstar/widget/landscape_list.dart';

class HomeScreen extends StatelessWidget {
  final List<dynamic>? apidata;
  const HomeScreen({super.key, this.apidata});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: [
          const CustomAppBar(),
          const SliverToBoxAdapter(
            child:Carousel()
          ),
          const SliverToBoxAdapter(
            child:  SizedBox(height: 20,),
          ),
           SliverToBoxAdapter(
            child: PotrateList(name: 'Latest Releases',listData: latest),
          ),
          const SliverToBoxAdapter(
            child:  SizedBox(height: 20,),
          ),
           SliverToBoxAdapter(
            child: LandScapeList(name: 'Trending', ListData: trending),
          ),
          const SliverToBoxAdapter(
            child:  SizedBox(height: 20,),
          ),
           SliverToBoxAdapter(
            child: PotrateList(name: 'Tv Shows',listData: tvShow),
          ),
          const SliverToBoxAdapter(
            child:  SizedBox(height: 20,),
          ),
           SliverToBoxAdapter(
            child: LandScapeList(name: 'Upcoming', ListData: upComing),
          ),
        ],
      );
  }
}