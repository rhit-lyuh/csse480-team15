import 'package:flutter/material.dart';
import 'package:project/component/list_page_drawer.dart';
import 'package:project/component/year_list.dart';

import '../model/course.dart';

class CourseFlowChartPage extends StatefulWidget {
  const CourseFlowChartPage({super.key});

  @override
  State<CourseFlowChartPage> createState() => _CourseFlowChartPageState();
}

class _CourseFlowChartPageState extends State<CourseFlowChartPage> {
  List<Course> courseList = [];
  late var newCourseNameEditingController = TextEditingController();

  var c1 = Course(
    name: "CSSE120",
    credit: 4,
    quarter: "Fall",
    year: 1,
  );
  var c2 = Course(
    name: "CSSE230",
    credit: 4,
    quarter: "Fall",
    year: 2,
  );
  var c3 = Course(
    name: "CSSE220",
    credit: 4,
    quarter: "Winter",
    year: 1,
  );
  var c4 = Course(
    name: "MA111",
    credit: 4,
    quarter: "Fall",
    year: 1,
  );

  @override
  void initState() {
    courseList.add(c1);
    courseList.add(c2);
    courseList.add(c3);
    courseList.add(c4);
    super.initState();
  }

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
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                YearList(
                  year: 1,
                  courseList: courseList,
                  callBack: ({
                    required Course course,
                    required String quarter,
                  }) {
                    setState(() {
                      for (Course c in courseList) {
                        if (c == course) {
                          c.quarter = quarter;
                        }
                      }
                    });
                  },
                ),
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
                TextField(
                  controller: newCourseNameEditingController,
                  decoration: const InputDecoration(
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
                  setState(() {
                    Course newCourse = Course(
                      name: newCourseNameEditingController.text,
                      credit: 4,
                      quarter: dropdownValueQuarter,
                      year: int.parse(dropdownValueYear),
                    );
                    courseList.add(newCourse);
                  });
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
