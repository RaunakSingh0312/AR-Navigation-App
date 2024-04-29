// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Map<String, Color> colors = {
  'Blue': Color.fromRGBO(7, 36, 188, 0.56),
  'purple': Color(0xffC125F8)
};
Map<String, String> images = {
  'Administrative': 'assets/images/admin.png',
  'Academics': 'assets/images/academic.png',
  'Amenities': 'assets/images/amenities.png',
  'Food and Grocery': 'assets/images/food.png',
  'Shopping': 'assets/images/shopping.png',
  'Residences': 'assets/images/hostel.png',
  'Research Labs': 'assets/images/research_lab.png',
  "Sports": 'assets/images/sports.png',
  "Hostels": 'assets/images/hostel.png',
  "Medical": 'assets/images/medical.png',
  "clock": 'assets/images/clock.png'
};
List<String> Categories = [
  "Administrative",
  "Academics",
  "Amenities",
  "Food and Grocery",
  "Residences",
  "Research Labs"
];
List<String> departments = [
  'Computer science',
  'Bioscience and Bioengineering',
  'Civil Engineering',
  'Electrical Engineering',
  'Mechanical Engineering',
  'Chemistry',
  'Physics',
  'Chemical Engineering',
  'Materials Engineering',
  'Mathematics',
  'Basic Lab Building'
];

List<String> schools = [
  'SoLA(School of Liberal Arts)',
  'SME\nSchool of Management and Entrepreneurship',
  'School of AIDE'
];

List<String> academic = [
  'Tinkering Lab (ANWISA)'
      'Library',
  'LHC (Lecture Hall Building)',
];

List<String> researchLabs = [
  'Environmental Engineering Lab',
  'Geological Engineering Lab',
  'Geotechnical Engineering Lab',
  'Transportation Engineering Lab',
  'Structural Engineering Lab',
  'Jodhpur City knowledge and innovation center',
  'Center for Sustainable Water',
  'CAMSEL Chemical Lab',
  'Heat Transfer Lab',
  'Shock Waves and High speed Flow (SWAHS) Lab',
  'Centre for Emerging Technologies for Sustainable Development',
  'Solar Technologies Research Lab',
  'Center for Advance Scientific Equipment (CASE)',
  'Cognitive Engineering Lab',
  'IoT and Applications Lab',
  'Digital Humanities Workspace',
  'Space Science and Technology',
  'Robotics and Mobility Systems',
  'AyurTech Centre of Excellence'
];
List<String> typeB = [
  'Building no 31, Type B',
  'Building no 42, Type B',
  'Building no 43, Type B',
  'Building no 44, Type B',
  'Building no 45, Type B',
  'Building no 51, Type B',
  'Building no 52, Type B',
  'Building no 62, Type B',
  'Building no 63, Type B',
  'Building no 65, Type B',
  'Building no 66, Type B',
];
List<String> typeC = [
  'Building no 12, Type C',
  'Building no 13, Type C',
  'Building no 25, Type C',
  'Building no 26, Type C',
  'Building no 27, Type C',
  'Building no 28, Type C',
  'Building no 29, Type C',
  'Director\'s Residence',
];

List<String> Iseries = [
  'I2',
  'I3',
];
List<String> Bseries = [
  'B1',
  'B2',
  'B3',
  'B4',
  'B5',
];
List<String> Gseries = [
  'G1',
  'G2',
  'G3',
  'G4',
  'G5',
  'G6',
];
List<String> Yseries = ['Y4', 'Y3'];
List<String> Oseries = ['O3', 'O4'];

List<String> adminBlock = [
  'Office of Students',
  'Office of Academics',
  'Ramanujan Computer Center',
  'E-Cell',
  'Office of Infrastructure\nEngineering',
  'Office of Director',
  'Clock Tower',
  'Office of CPWD',
];

List<String> banks = [
  'SBI Bank',
  'Canara Bank',
  'HDFC Bank',
];
List<String> sports = [
  'Akash Building-Indoor Sports Complex',
  'Lawn Tennis Court',
  'Basketball Court',
  'Cricket Ground',
  'Football Ground and Running Track',
  'Hockey Ground',
];
List<String> recreation = [
  'Jodhpur Club',
  'Temple',
  'Knowledge Tree',
];
List<String> others = [
  'Post Office',
  'Stationary Shop',
  'Laundry',
  'Men Saloon',
  'Women Saloon',
  'Primary Health Care Center(PHC)',
  'Kendriya Bhandar',
];
List<String> food = [
  'Kendriya Bhandar',
  'Rukmini Enterprises',
  'Shamiyana- The Café of IITJ',
  'Old Mess',
  'New Mess',
  'Canteen',
  'RASA Food Restaurant',
];
Map<String, List<String>> cat = {
  "All Places":
      Academics + Amenities + Residences + adminBlock + researchLabs + food,
  'Administrative': adminBlock,
  'Academics': Academics,
  'Amenities': Amenities,
  'Food and Grocery': food,
  'Residences': Residences,
  "Research Labs": researchLabs,
  "Sports": sports,
  "Hostels": Iseries + Bseries + Gseries + Yseries + Oseries,
};

List<String> Academics = academic + departments + schools;
List<String> Amenities = banks + sports + recreation + others;
List<String> Residences =
    typeB + typeC + Iseries + Bseries + Gseries + Yseries + Oseries;
Map<String, LatLng> latlng = {
  "Office of Students": const LatLng(26.47107487710343, 73.11374748057521),
  "Primary Health Care Center(PHC)":
      const LatLng(26.48118964654463, 73.11958573960341),
  "Shamiyana- The Cafe of IITJ": LatLng(26.476959136613775, 73.11420368337342),
  "Computer science": LatLng(26.475084534169483, 73.11446425763387),
  "Chemistry": LatLng(26.475559666699503, 73.11505296233913),
  "Mechanical Engineering": LatLng(26.479239717702924, 73.11659710602929),
  "Materials Engineering": LatLng(26.47980121747186, 73.11689628383033),
  "Mathematics": LatLng(26.480401970334906, 73.11590782581223),
  "Electrical Engineering": LatLng(26.47927356437758, 73.11607208888537),
  "Civil Engineering": LatLng(26.478672630238076, 73.11628409769457),
  "Physics": LatLng(26.479797099789742, 73.11623405622608),
  "SME\nSchool of Management and Entrepreneurship":
      LatLng(26.48006240270969, 73.11721480709043),
  "SoLA(School of Liberal Arts),": LatLng(26.48013338044296, 73.11649358366328),
//Center of advanced science equipment:LatLng(26.476259986849453, 73.11416236782037),
  "Bioscience and Bioengineering": LatLng(26.47557842164395, 73.11465208273306),
  "Basic Lab Building": LatLng(26.474992986536257, 73.11501542984819),
  "LHC (Lecture Hall Building),": LatLng(26.472975111788827, 73.11405882877033),
  "O4": LatLng(26.475133575572944, 73.11704175937255),
  "O3": LatLng(26.475497107767332, 73.1173042540282),
  "Akash Building- Indoor Sports Complex":
      LatLng(26.47668802163257, 73.11968724781245),
  "G3": LatLng(26.473418783036138, 73.11719643375346),
  "G2": LatLng(26.473548427115027, 73.11647523479897),
  "G1": LatLng(26.473539438621422, 73.11551242436968),
  "B3": LatLng(26.47263667659423, 73.11650484166631),
  "B1": LatLng(26.472833556150913, 73.11533539858166),
  "B5": LatLng(26.472363865776565, 73.11507273338722),
  "Laundry": LatLng(26.476219736767472, 73.1178953486408),
  "Mens Saloon": LatLng(26.47548702694202, 73.11792237650923),
  "Library": LatLng(26.471571540307803, 73.1135519208773),
  "Ramanujan Computer Center": LatLng(26.471497839000023, 73.11397876259345),
  "Knowledge Tree": LatLng(26.46923172560986, 73.1142202254885),
  "Kendriya Bhandar": LatLng(26.466298835515786, 73.11203548553343),
  "SBI Bank": LatLng(26.466358863112653, 73.11192283275922),
  "Rukmini Enterprises": LatLng(26.47579721308172, 73.11042752018017),
  "New Mess": LatLng(26.473047079055554, 73.11737416303208),
};
