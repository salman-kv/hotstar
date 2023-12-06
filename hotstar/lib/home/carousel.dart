import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 450.0,
          viewportFraction: 1,
          autoPlay: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 100)),
      items: [1, 2, 3, 4, 5].map(
        (i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/photography.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    const Color.fromARGB(255, 3, 0, 15),
                    const Color.fromARGB(255, 3, 0, 15),
                    const Color.fromARGB(255, 3, 0, 15).withOpacity(.4),
                    const Color.fromARGB(255, 3, 0, 15).withOpacity(0.1)
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                minimumSize:const Size(180, 40),
                                maximumSize:const Size(190, 40),
                                backgroundColor:
                                    const Color.fromARGB(255, 66, 65, 65)),
                            onPressed: () {},
                            icon: const Icon(Icons.play_arrow),
                            label:const Text('Watch movie'),
                          ),
                          const SizedBox(width: 10,),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 66, 65, 65)),
                            onPressed: (){}, child:const Icon(Icons.add))
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }
}
