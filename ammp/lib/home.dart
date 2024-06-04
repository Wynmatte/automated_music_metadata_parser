// ignore_for_file: prefer_const_constructors
import 'package:editable/editable.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DataRow> rows = [
    DataRow(cells: [
      DataCell(TextFormField(
        initialValue: "title",
      )),
      DataCell(TextFormField(
        initialValue: "title",
      )),
      DataCell(TextFormField(
        initialValue: "title",
      )),
      DataCell(TextFormField(
        initialValue: "title",
      )),
      DataCell(TextFormField(
        initialValue: "title",
      )),
      DataCell(TextFormField(
        initialValue: "title",
      )),
      DataCell(TextFormField(
        initialValue: "title",
      )),
      DataCell(Text(
        "date created",
      )),
      DataCell(Text(
        "date modified",
      )),
      DataCell(TextFormField(
        initialValue: "title",
      )),
    ])
  ];
  List<DataColumn> cols = [
    DataColumn(label: Text("Title")),
    DataColumn(label: Text("Artist/s")),
    DataColumn(label: Text("Album")),
    DataColumn(label: Text("Track No.")),
    DataColumn(label: Text("Genre")),
    DataColumn(label: Text("Pace")),
    DataColumn(label: Text("Year")),
    DataColumn(label: Text("Date Created")),
    DataColumn(label: Text("Date Modified")),
    DataColumn(label: Text("Cover Link")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(32),
        child: AppBar(
          elevation: 1,
          backgroundColor: Color.fromARGB(255, 249, 119, 55),
        ),
      ),
      body: Row(children: [
        DataTable(
          columns: cols,
          rows: rows,
        )
      ]),
    );
  }
}
