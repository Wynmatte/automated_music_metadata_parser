import 'package:flutter/material.dart';

List<DataRow> getTracks(dynamic json) {
  List<DataRow> row = [];
  for (int i in json) {
    row.add(DataRow(onSelectChanged: (value) {}, cells: [
      DataCell(TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: "title",
      )),
      DataCell(TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: "title",
      )),
      DataCell(TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: "title",
      )),
      DataCell(TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: "title",
      )),
      DataCell(TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: "title",
      )),
      DataCell(TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: "title",
      )),
      DataCell(TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: "title",
      )),
      DataCell(TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: "title",
      )),
      DataCell(Text(
        "date created",
      )),
      DataCell(Text(
        "date modified",
      )),
      DataCell(TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: "title",
      )),
    ]));
    print(", ${json}}\n");
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
