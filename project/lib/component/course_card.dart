import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String courseName;
  final int courseCredit;
  const CourseCard({
    super.key,
    required this.courseName,
    required this.courseCredit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 20.0),
      color: Colors.yellow,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(courseName),
                  content: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Terms avaiable: "),
                      SizedBox(
                        height: 50.0,
                      ),
                      Text("Prerequisites: "),
                      SizedBox(
                        height: 50.0,
                      ),
                      Text("Description: "),
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
                child: Text(courseName),
              ),
            ),
            SizedBox(
              width: 100,
              height: 20,
              child: Center(
                child: Text(courseCredit.toString()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
