import 'package:flutter/material.dart';

class Ar_World extends StatefulWidget {
  const Ar_World({super.key});

  @override
  State<Ar_World> createState() => _Ar_WorldState();
}

class _Ar_WorldState extends State<Ar_World> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: 
      ExpansionTile(
                    title: const Text('Vision APIs'),
                    children: [
                      Text('In this section we will discuss about the Vision APIs. '),
                      Text('In this section we will discuss about the Vision APIs. '),
                      Text('In this section we will discuss about the Vision APIs. ')

                      
                    ],
                  ),  
      )
    );
  }
}