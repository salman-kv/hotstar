import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotstar/api/calling_api.dart';
import 'package:hotstar/widget/single_film_show.dart';
import 'package:hotstar/widget/videopage.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
            enlargeCenterPage: true,
            height: 500.0,
            viewportFraction: 0.7,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 100)),
        items: List.generate(mainmovie.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                return  SingleFilmShow( mainList: mainmovie[index],);
                // return BeShow();
              }));
            },
            child: Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        // image: AssetImage('assets/image/photography.jpg'),
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500/${mainmovie[index]['poster_path']}'),
                        fit: BoxFit.contain),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      const Color.fromARGB(255, 3, 0, 15),
                      const Color.fromARGB(255, 3, 0, 15),
                      const Color.fromARGB(255, 3, 0, 15).withOpacity(.2),
                      const Color.fromARGB(255, 3, 0, 15).withOpacity(.1),
                      const Color.fromARGB(255, 3, 0, 15).withOpacity(0.1)
                    ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${mainmovie[index]['title']}',
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${mainmovie[index]['release_date']}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(180, 40),
                                  maximumSize: const Size(190, 40),
                                  backgroundColor:
                                      const Color.fromARGB(255, 37, 37, 37)),
                              onPressed: ()async {
                final res=await getYoutube(mainmovie[index]['id']);
                if(res==null){
                  return;
                }
                else{
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                  return BeShow(fechVideoId: res,mainList: mainmovie[index],);
                }));
                }
              
              },
                              icon: const Icon(Icons.play_arrow),
                              label:  Text('Watch movie',style: Theme.of(context).textTheme.bodySmall,),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 37, 37, 37)),
                                onPressed: () {},
                                child: const Icon(Icons.add))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }));
  }
}
