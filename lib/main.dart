import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iitj_ram/constants.dart';
import 'package:iitj_ram/home.dart';
import 'package:iitj_ram/try.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IITJ RAM - Roads And Maps',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(
        category: "All Places",
        index: 2,
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CupertinoNavigationBar(
          leading: IconButton(
            icon: const Icon(Icons.location_pin),
            onPressed: () {},
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            color: Colors.white10,
            child: Column(
              children: [
                Container(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: colors['Blue'],
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.only(left: 13, top: 10),
                  width: 300,
                  height: 300,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => Locations()));
                              },
                              icon: Image.asset(
                                images['admin']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Text(
                              "Admin\nBlock",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            )
                          ]),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.12,
                          ),
                          Column(children: [
                            const SizedBox(
                              height: 10,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(images['dept']!),
                            ),
                            const Text(
                              "Academic\nUnits",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            )
                          ]),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.12,
                          ),
                          Column(children: [
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(images['r_lab']!),
                            ),
                            const Text(
                              "Research\nLabs",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            )
                          ])
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Column(children: [
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                images['sports']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Text(
                              "Sports",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            )
                          ]),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.12,
                          ),
                          Column(children: [
                            const SizedBox(
                              height: 10,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(images['hostel']!),
                            ),
                            const Text(
                              "Residences",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            )
                          ]),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.09,
                          ),
                          Column(children: [
                            const SizedBox(
                              height: 8,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(images['shop']!),
                            ),
                            const Text(
                              "Shopping",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            )
                          ])
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Column(children: [
                            const SizedBox(
                              height: 7,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                images['food']!,
                                height: 40,
                                width: 40,
                              ),
                            ),
                            const Text(
                              "Food",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            )
                          ]),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.13,
                          ),
                          Column(children: [
                            const SizedBox(
                              height: 10,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                images['phc']!,
                                height: 40,
                                width: 40,
                              ),
                            ),
                            const Text(
                              "Medical",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            )
                          ]),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.12,
                          ),
                          Column(children: [
                            const SizedBox(
                              height: 10,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                images['amen']!,
                                height: 40,
                                width: 40,
                              ),
                            ),
                            const Text(
                              "Amenities",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            )
                          ])
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
