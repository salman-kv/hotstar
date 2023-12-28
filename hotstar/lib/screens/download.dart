import 'package:flutter/material.dart';

class Download extends StatelessWidget {
  const Download({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('No Download Available',style: Theme.of(context).textTheme.bodyMedium,),
          const Text('explore and download your faviourite',style:TextStyle(
            color: Colors.grey,
            fontSize: 14
          ),),
          SizedBox(
            width: 290,
            child: ElevatedButton.icon(
              onPressed: (){}, icon: const Icon(Icons.download),label: Text('Download',style: Theme.of(context).textTheme.bodySmall),),
          )
        ],
      ),
    );
  }
}