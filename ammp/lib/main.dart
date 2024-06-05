// ignore_for_file: prefer_const_constructors

import 'package:ammp/widgets/get_tracksWIP.dart';
import 'package:flutter/material.dart';
import 'package:ammp/home.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<dynamic> data = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString("assets/tracks.json");
    data = await jsonDecode(response);
  }

  await readJson();
  print(data);

  List<DataRow> tracks = getTracks(data);
  runApp(MaterialApp(
    title: "AMMP",
    // initialRoute: '/loadingScreen',
    home: HomeScreen(tracks: tracks),
  ));
}
