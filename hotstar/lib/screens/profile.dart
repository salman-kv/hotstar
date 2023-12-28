import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 150,
          ),
          Text(
            'Login to Desney+Hotstar',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Text(
            'Start waching from where you left off, personalise for kids and more',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor:const Color.fromARGB(255, 94, 169, 229)
            ),
            onPressed: () {},
            icon: const Icon(Icons.download),
            label: Text('Log in', style: Theme.of(context).textTheme.bodySmall),
          )
        ],
      ),
    );
  }
}
