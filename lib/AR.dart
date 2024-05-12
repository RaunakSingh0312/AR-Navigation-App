// ignore_for_file: library_private_types_in_public_api

import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

double lati = 0;
double long = 0;
bool tap = false;
int checkaxis = 0;
int moved_right = 0;
int moved_left = 0;

List<vector.Vector4> rotationsRight = [
  vector.Vector4(0, 0, 0, 1),
  vector.Vector4(0, -1, 0, 1)
];
List<vector.Vector4> rotationsLeft = [
  vector.Vector4(0, 0, 0, 1),
  vector.Vector4(0, -1, 0, 1)
];

class HelloWorld extends StatefulWidget {
  final List<double> x;
  final List<double> z;
  final List<double> y;
  const HelloWorld({
    required this.y,
    required this.x,
    required this.z,
    super.key,
  });

  @override
  _HelloWorldState createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  var right_image;
  var left_image;
  var pin;
  @override
  void initState() {
    tap = false;
    checkaxis = 0;
    moved_right = 0;
    moved_left = 0;
    super.initState();
    getimages();
  }

  void getimages() async {
    var image = await rootBundle.load("assets/images/right.png");
    var imageBytes = image.buffer.asUint8List();
    right_image = ArCoreImage(bytes: imageBytes, width: 500, height: 500);

    image = await rootBundle.load("assets/images/left.png");
    imageBytes = image.buffer.asUint8List();

    left_image = ArCoreImage(bytes: imageBytes, width: 500, height: 500);

    image = await rootBundle.load("assets/images/pin.png");
    imageBytes = image.buffer.asUint8List();
    pin = ArCoreImage(bytes: imageBytes, width: 500, height: 500);
  }

  late ArCoreController arCoreController;

  /*void _determine_Position() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    LocationSettings locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high, distanceFilter: 5);
    StreamSubscription<Position> positionstream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((event) {
      setState(() {
        lati = event.latitude;
        long = event.longitude;
        print(lati);
        print(long);

        
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: tap == false
              ? const Text('Tap anywhere on the screen')
              : const Text("AR Navigation"),
        ),
        body: ArCoreView(
            enableTapRecognizer: true,
            // enableUpdateListener: true,
            onArCoreViewCreated: _onArCoreViewCreated),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    controller.onPlaneTap = _ontaphandler;
  }

  void _ontaphandler(List<ArCoreHitTestResult> hits) {
    if (!tap) {
      tap = true;
      for (int i = 0; i < widget.x.length - 1; i++) {
        print("helloifjijs");
        print(
            '${widget.x[i]}, ${widget.z[i]}, ${widget.x[i + 1]}, ${widget.z[i + 1]} , $checkaxis');
        _addSphere(arCoreController, [widget.x[i], widget.z[i], widget.y[i]],
            [widget.x[i + 1], widget.z[i + 1], widget.y[i + 1]]);
      }
      arCoreController.addArCoreNodeWithAnchor(ArCoreNode(
          image: pin,
          position:
              vector.Vector3(widget.x.last, widget.y.last, widget.z.last)));
    }
  }

  void _addSphere(ArCoreController controller, List<double> coordinates,
      List<double> nextcoordinates) async {
    if ((moved_left % 4 == 0 && moved_right % 4 == 0) ||
        (moved_left % 4 == 0 && moved_right % 4 == 1) ||
        (moved_left % 4 == 1 && moved_right % 4 == 0) ||
        (moved_left % 4 == 1 && moved_right % 4 == 1)) {
      if (nextcoordinates[checkaxis % 2] - coordinates[checkaxis % 2] > 0) {
        print('in right');
        final node = ArCoreNode(
            image: right_image,
            position:
                vector.Vector3(coordinates[0], coordinates[2], coordinates[1]),
            rotation: rotationsRight[checkaxis % 2]);
        arCoreController.addArCoreNodeWithAnchor(node);

        checkaxis += 1;
        moved_right += 1;
      } else if (nextcoordinates[checkaxis % 2] - coordinates[checkaxis % 2] <
          0) {
        print('in left');
        final node = ArCoreNode(
            image: left_image,
            position:
                vector.Vector3(coordinates[0], coordinates[2], coordinates[1]),
            rotation: rotationsLeft[checkaxis % 2]);
        arCoreController.addArCoreNodeWithAnchor(node);
        checkaxis += 1;
        moved_left += 1;
      } else {
        final node = ArCoreNode(
            shape: ArCoreSphere(materials: [
              ArCoreMaterial(
                  color: Colors.amber[400], metallic: 10, reflectance: 1),
            ], radius: 0.4),
            position:
                vector.Vector3(coordinates[0], coordinates[2], coordinates[1]));
        arCoreController.addArCoreNodeWithAnchor(node);
      }
    } else {
      if (nextcoordinates[checkaxis % 2] - coordinates[checkaxis % 2] < 0) {
        print('in right');
        final node = ArCoreNode(
            image: right_image,
            position:
                vector.Vector3(coordinates[0], coordinates[2], coordinates[1]),
            rotation: rotationsRight[checkaxis % 2]);
        arCoreController.addArCoreNodeWithAnchor(node);

        checkaxis += 1;
        moved_right += 1;
      } else if (nextcoordinates[checkaxis % 2] - coordinates[checkaxis % 2] >
          0) {
        print('in left');
        final node = ArCoreNode(
            image: left_image,
            position:
                vector.Vector3(coordinates[0], coordinates[2], coordinates[1]),
            rotation: rotationsLeft[checkaxis % 2]);
        arCoreController.addArCoreNodeWithAnchor(node);
        checkaxis += 1;
        moved_left += 1;
      } else {
        final node = ArCoreNode(
            shape: ArCoreSphere(materials: [
              ArCoreMaterial(
                  color: Colors.amber[400], metallic: 10, reflectance: 1),
            ], radius: 0.4),
            position:
                vector.Vector3(coordinates[0], coordinates[2], coordinates[1]));
        arCoreController.addArCoreNodeWithAnchor(node);
      }
    }
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}
