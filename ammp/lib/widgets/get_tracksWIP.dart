// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ammp/globals.dart' as globals;

List<DataRow> getTracks(List<dynamic> json) {
  final globals.TracksFile file = globals.TracksFile();
  List<DataRow> row = [];

  for (Map<String, dynamic> track in json) {
    String date_created =
        (track["date_created"] != null) ? track["date_created"] : "None";
    String date_modified =
        (track["date_modified"] != null) ? track["date_modified"] : "None";

    // TODO: FIX REPETITIVE CODE BELOW
    row.add(DataRow(onSelectChanged: (value) {}, cells: [
      DataCell(TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: track["title"],
      )),
      DataCell(TextFormField(
        onChanged: (value) {
          track['artist_name'] = value;
          globals.outputJson = json;
          file.writeCounter(globals.outputJson);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: track["artist_name"],
      )),
      DataCell(TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: track["album_name"],
      )),
      DataCell(TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: track["track_number"],
      )),
      DataCell(TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: track["genre"],
      )),
      DataCell(TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: track["pace"],
      )),
      DataCell(TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: track["energy"],
      )),
      DataCell(TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: track["track_year"],
      )),
      DataCell(Text(
        date_created,
      )),
      DataCell(Text(
        date_modified,
      )),
      DataCell(TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: track["album_cover"],
      )),
    ]));
  }

  return row;
}

DataColumn get_cols(String track_cols, double width, BuildContext context) {
  return DataColumn(
    label: Container(
      width: MediaQuery.of(context).size.width * width,
      child: Text(
        track_cols,
        textAlign: TextAlign.center,
      ),
    ),
  );
}
