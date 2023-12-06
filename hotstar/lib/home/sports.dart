import 'package:flutter/material.dart';

class Sports extends StatelessWidget {
  const Sports({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'haii',
              style: TextStyle(color: Colors.white),
            )),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(10, (index) {
              return Container(
                margin: const EdgeInsets.all(10),
                height: 130,
                width: 200,
                color: Colors.amber,
              );
            }),
          ),
        ),
      ],
    );
  }
}
