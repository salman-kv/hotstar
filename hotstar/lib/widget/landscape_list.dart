import 'package:flutter/material.dart';
import 'package:hotstar/api/calling_api.dart';
import 'package:hotstar/widget/single_film_show.dart';

class LandScapeList extends StatelessWidget {
  final String name;
  final List<dynamic> ListData;
  LandScapeList({super.key, required this.name, required this.ListData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding:const EdgeInsets.symmetric(horizontal: 1),
            child: Text(
              name,
              style: Theme.of(context).textTheme.displayLarge
            )),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(ListData.length, (index) {
              return GestureDetector(
                 onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                return  SingleFilmShow( mainList: ListData[index],);
              }));
            },
                child: Container(
                  margin: const EdgeInsets.all(4),
                  height: 140,
                  width: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500/${ListData[index]["backdrop_path"]}',),
                          fit: BoxFit.cover)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              ListData[index]["title"],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Icon(
                            Icons.more_vert_outlined,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
