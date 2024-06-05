// ignore_for_file: prefer_const_constructors

import 'package:ammp/widgets/get_tracksWIP.dart';
import 'package:flutter/material.dart';
import 'package:ammp/home.dart';

void main() {
  // TODO: gets tracks from json, placeholder list for now
  List<DataRow> tracks =
      getTracks([1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 1, 1, 1, 1, 1, 1, 1]);
  runApp(MaterialApp(
    title: "AMMP",
    // initialRoute: '/loadingScreen',
    home: HomeScreen(tracks: tracks),
  ));
}
