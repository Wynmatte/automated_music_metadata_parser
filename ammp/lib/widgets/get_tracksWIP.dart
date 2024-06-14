// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ammp/globals.dart' as globals;

List<DataRow> get_rows(List<dynamic> tracks) {
  // opens tracks.json for writing
  
  List<DataRow> row = [];

  for (globals.Track track in tracks) {
    String date_created =
        (track.date_created != null) ? track.date_created : "";
    String date_modified =
        (track.date_modified != null) ? track.date_modified : "";

    // TODO: FIX REPETITIVE CODE BELOW
    row.add(DataRow(onSelectChanged: (value) {}, cells: [
      DataCell(TextFormField(
        onChanged: (value) {
        },
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: track.title,
      )),
      DataCell(TextFormField(
        onChanged: (value) {
        },
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: track.artist_name,
      )),
      DataCell(TextFormField(
        onChanged: (value) {
        },
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: track.album_name,
      )),
      DataCell(TextFormField(
        onChanged: (value) {
        },
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: track.track_number.toString(),
      )),
      DataCell(TextFormField(
        onChanged: (value) {
        },
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: track.genre,
      )),
      DataCell(TextFormField(
        onChanged: (value) {
        },
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: track.pace.toString(),
      )),
      DataCell(TextFormField(
        onChanged: (value) {
        },
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: track.energy.toString(),
      )),
      DataCell(TextFormField(
        onChanged: (value) {
        },
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: track.track_year.toString(),
      )),
      DataCell(Text(
        date_created,
      )),
      DataCell(Text(
        date_modified,
      )),
      DataCell(TextFormField(
        onChanged: (value) {
        },
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: track.cover,
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
