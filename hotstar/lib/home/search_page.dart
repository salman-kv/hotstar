import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 45,
          child: SearchBar(
            leading: Icon(Icons.search),
            hintText: 'Movies,shows and more',
            trailing: [Icon(Icons.mic_none_outlined)],
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)))),
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: List.generate(
              100,
              (index){
                return Container(
                  height: 120,
                  width: double.infinity,
                  margin:const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.amber
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage('assets/image/photography.jpg'),fit: BoxFit.cover)
                          ),
                      )),
                      Expanded(
                        flex: 3,
                        child: Text('haa'))
                    ],
                  ),
                );
              }
            ),
          ),
        ))
        // ListView(
        //   shrinkWrap: true,
        //   physics: ScrollPhysics(),
        //   children: List.generate(100, (index) => Text('fsd',style: TextStyle(color: Colors.amber),)),
        // )
      ],
    );
  }
}
