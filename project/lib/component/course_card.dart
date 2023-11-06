import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String courseNum;
  final String courseString;
  final void Function({required String course}) courseCardDeleteCallBack;
  final void Function({required String course}) courseCardUndoCallBack;
  const CourseCard(
      {super.key,
      required this.courseNum,
      required this.courseCardDeleteCallBack,
      required this.courseString,
      required this.courseCardUndoCallBack});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCourse(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var courseData = snapshot.data;
          var termAvailable = courseData!["termAvailable"];
          String termAvailableString = "";
          if (termAvailable[0] == true) {
            termAvailableString += "F";
          }
          if (termAvailable[1] == true) {
            termAvailableString += "W";
          }
          if (termAvailable[2] == true) {
            termAvailableString += "S";
          }
          String prerequisites = courseData["prerequisites"] == []
              ? ""
              : courseData["prerequisites"].toString();
          String description = courseData["description"].toString();
          String department = courseData["department"].toString();
          String credit = courseData["creditHours"].toString();
          return Card(
            margin: const EdgeInsets.only(top: 20.0),
            color: switch (department) {
              "CSSE" => Colors.blue,
              "MA" => Colors.yellow,
              "HSSA" => Colors.purple,
              "ECE" => Colors.green,
              "RHIT" => Colors.red,
              "PH" => Colors.yellow,
              "CHEM" => Colors.yellow,
              "SCIENCE" => Colors.yellow,
              "TECH" => Colors.pink,
              "ELECTIVE" => Colors.orange,
              String() => null,
            },
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(courseNum),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Terms avaiable: $termAvailableString"),
                            const SizedBox(
                              height: 50.0,
                            ),
                            Text("Prerequisites: $prerequisites"),
                            const SizedBox(
                              height: 50.0,
                            ),
                            Text("Description: $description"),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("CLOSE"),
                          ),
                          TextButton(
                            onPressed: () {
                              String temp = courseString;

                              courseCardDeleteCallBack(course: courseString);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: const Text("Quote Deleted"),
                                action: SnackBarAction(
                                  label: "Undo",
                                  onPressed: () {
                                    courseCardUndoCallBack(course: temp);
                                  },
                                ),
                              ));
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "DELETE",
                            ),
                          ),
                        ],
                      );
                    });
              },
              child: Column(
                children: [
                  SizedBox(
                    width: 100,
                    height: 20,
                    child: Center(
                      child: Text(courseNum),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 20,
                    child: Center(
                      child: Text(credit),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Future<Map<String, dynamic>?> getCourse() async {
    var courseData = await FirebaseFirestore.instance
        .collection("Courses")
        .get()
        .then((value) {
      for (final doc in value.docs) {
        var data = Map<String, dynamic>.from(doc.data());
        if (data["courseNumber"] == courseNum) {
          return data;
        }
      }
    });
    return courseData;
  }
}
