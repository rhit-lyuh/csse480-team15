import 'package:flutter/material.dart';
import 'package:project/component/list_page_drawer.dart';
import 'package:project/component/year_list.dart';

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
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                YearList(year: 1),
                YearList(year: 2),
                YearList(year: 3),
                YearList(year: 4),
              ],
            ),
          ),
        ),
      ),
      drawer: const ListPageDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddCourseDialog();
        },
        tooltip: "Add a Class",
        backgroundColor: const Color(0xff800000),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void showAddCourseDialog() {
    List<String> yearList = [
      "Select a Year",
      "1",
      "2",
      "3",
      '4',
    ];
    List<String> quarterList = [
      "Select a Quarter",
      "Fall",
      "Winter",
      "Spring",
      'Summer',
    ];
    String dropdownValueYear = yearList.first;
    String dropdownValueQuarter = quarterList.first;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Add a Class"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter a course',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                DropdownMenu<String>(
                  initialSelection: yearList.first,
                  onSelected: (String? value) {
                    setState(() {
                      dropdownValueYear = value!;
                    });
                  },
                  dropdownMenuEntries:
                      yearList.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                      value: value,
                      label: value,
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                DropdownMenu<String>(
                  initialSelection: quarterList.first,
                  onSelected: (String? value) {
                    setState(() {
                      dropdownValueQuarter = value!;
                    });
                  },
                  dropdownMenuEntries: quarterList
                      .map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                      value: value,
                      label: value,
                    );
                  }).toList(),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("CANCEL"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "ADD A COURSE",
                ),
              ),
            ],
          );
        });
  }
}
