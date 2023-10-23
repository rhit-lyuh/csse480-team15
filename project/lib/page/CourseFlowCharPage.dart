import 'package:flutter/material.dart';
import 'package:project/component/list_page_drawer.dart';

class CourseFlowChartPage extends StatefulWidget {
  const CourseFlowChartPage({super.key});

  @override
  State<CourseFlowChartPage> createState() => _CourseFlowChartPageState();
}

class _CourseFlowChartPageState extends State<CourseFlowChartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Rose-Hulman",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff800000),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 160,
              color: Colors.red,
            ),
            Container(
              width: 160,
              color: Colors.blue,
            ),
            Container(
              width: 160,
              color: Colors.green,
            ),
          ],
        ),
      ),
      drawer: const ListPageDrawer(),
    );
  }
}
