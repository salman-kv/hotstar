import 'package:flutter/material.dart';
import 'package:hotstar/api/calling_api.dart';
import 'package:hotstar/widget/single_film_show.dart';

class PotrateList extends StatelessWidget {
  final name;
  final List<dynamic> listData;
  PotrateList({super.key, required this.name, required this.listData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              name,
              style: Theme.of(context).textTheme.displayLarge
            )),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(listData.length, (index) {
              return GestureDetector(
                 onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                return  SingleFilmShow( mainList: listData[index],);
              }));
            },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  height: 200,
                  width: 150,
                  // color: Colors.amber,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500/${listData[index]["poster_path"]}'),
                        fit: BoxFit.fill),
                  ),
                  // child: Text('haaa'),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
