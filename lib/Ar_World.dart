import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iitj_ram/AR.dart';
import 'package:iitj_ram/constants.dart';
import 'package:iitj_ram/home.dart';
import 'package:iitj_ram/try.dart';

int index = 0;

class Ar_World extends StatefulWidget {
  const Ar_World({super.key});

  @override
  State<Ar_World> createState() => _Ar_WorldState();
}

class _Ar_WorldState extends State<Ar_World> {
  @override
  void initState() {
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    String selected_location = '';
    return Scaffold(
      appBar:
          RoundedAppBar(color: Colors.blue[400]!, color2: Colors.purple[500]!),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => HelloWorld(
                          x: coordinatesx["Classroom 102"]!,
                          y: coordinatesy["Classroom 102"]!,
                          z: coordinatesz["Classroom 102"]!)));
            },
            child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 30, bottom: 20),
                child: Text(
                  "Where should AR guide you?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 30),
            child: DropdownMenu(
                width: 300,
                trailingIcon: Icon(Icons.arrow_drop_down),
                onSelected: (value) async {
                  Position position = await getCurrentLocation();
                  LatLng position2 = latlng['Computer science']!;
                  if ((position2.latitude - position.latitude).abs() < 0.0001 &&
                      (position2.longitude - position.longitude) < 0.0001) {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => HelloWorld(
                                x: coordinatesx[locations[value]]!,
                                y: coordinatesy[locations[value]]!,
                                z: coordinatesz[locations[value]]!)));
                  } else {
                    Fluttertoast.showToast(
                        msg:
                            "You are not at the CSE department. So, AR navigation is disabled");
                  }
                },
                dropdownMenuEntries: getdropdown()),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuEntry<dynamic>> getdropdown() {
    List<DropdownMenuEntry> lis = [];

    for (int i = 0; i < 12; i++) {
      lis.add(DropdownMenuEntry(value: i, label: locations[i]));
    }
    return lis;
  }
}
