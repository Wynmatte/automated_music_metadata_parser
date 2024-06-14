// ignore_for_file: prefer_const_constructors

import 'package:ammp/widgets/get_tracksWIP.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  List<DataRow> rows = [];
  HomeScreen({super.key, required this.rows});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Map> trackCols = [
      {"col": "Title", "width": 0.2},
      {"col": "Artist/s", "width": 0.2},
      {"col": "Album", "width": 0.1},
      {"col": "Track No.", "width": 0.05},
      {"col": "Genre", "width": 0.05},
      {"col": "Pace", "width": 0.03},
      {"col": "Energy", "width": 0.035},
      {"col": "Year", "width": 0.025},
      {"col": "Date Created", "width": 0.07},
      {"col": "Date Modified", "width": 0.075},
      {"col": "Cover Link", "width": 0.3},
    ];
    List<DataColumn> cols = [];

    trackCols.forEach(
      (element) {
        cols.add(get_cols(element["col"], element["width"], context));
      },
    );

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
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  border: Border.all(width: 0),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: DataTable(
                columns: cols,
                rows: widget.rows,
                dataRowMinHeight: 12,
                dividerThickness: 1,
                showBottomBorder: true,
                headingRowColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 247, 127, 67)),
                headingRowHeight: 28,
                border: TableBorder.all(width: 1),
                // TODO: implement checkbox features
              ),
            ),
          )),
        ));
  }
}
