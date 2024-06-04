// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  List<DataRow> tracks = [];
  HomeScreen({super.key, required this.tracks});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: DataTable(
                columns: cols,
                rows: widget.tracks,
                headingRowColor: WidgetStatePropertyAll(Colors.amber),
                dataRowMinHeight: 12,
                dividerThickness: 1,
                showBottomBorder: true,
              ),
            ),
          )),
        ));
  }
}
