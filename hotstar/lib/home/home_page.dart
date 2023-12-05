import 'package:flutter/material.dart';
import 'package:hotstar/appbar/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 6, 0, 34)
          
        ),
        child: ListView(
          children: List.generate(203, (index) {
            return Text('hai ${index}');
          }),
        ),
      ),
      // body: CustomScrollView(
      //   slivers: [
      //     const SliverAppBar(
      //       title: Text('hotstar'),
      //       floating: true,
      //       flexibleSpace: Placeholder(),
      //       expandedHeight: 200,
      //     ),
      //     SliverList(
      //       delegate: SliverChildBuilderDelegate(
      //         (context, index) => ListTile(title: Text('Item #$index')),
      //         childCount: 1000,
      //       ),
      //     ),
      //     SliverList(delegate: SliverChildBuilderDelegate(
      //       (context, index) {
      //         return Text('koi ${index}');
      //       },
      //     ))
      //   ],
        
      // ),
    );
  }
}
