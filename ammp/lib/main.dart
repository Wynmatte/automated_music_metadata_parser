// ignore_for_file: prefer_const_constructors

import 'package:ammp/widgets/get_tracksWIP.dart';
import 'package:flutter/material.dart';
import 'package:ammp/home.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:ammp/globals.dart' as globals;
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  // // get sql db
  // var dbPath = await getDatabasesPath();
  // String path = join(dbPath, 'tracks.db');

  Database db = await openDatabase('C:/Users/shek/Programming/Automatic_Music_Metadata_Parser/automated_music_metadata_parser/tracks.db');
  List<globals.Track> tracks = await globals.get_tracks(db);
  print(tracks);

  List<DataRow> rows = get_rows(tracks);
  runApp(MaterialApp(
    title: "AMMP",
    // initialRoute: '/loadingScreen',
    home: HomeScreen(rows: rows),
  ));
}
