// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

List<DataRow> getTracks(dynamic json) {
  List<DataRow> row = [];

  for (Map<String, dynamic> track in json) {
    String date_created =
        (track["date_created"] != null) ? track["date_created"] : "None";
    String date_modified =
        (track["date_modified"] != null) ? track["date_modified"] : "None";

    row.add(DataRow(onSelectChanged: (value) {}, cells: [
      DataCell(TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: track["title"],
        onFieldSubmitted: (value) {},
      )),
      DataCell(TextFormField(
        onChanged: (value) {
          track["artist_name"] = value;
          print(track["artist_name"]);
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
