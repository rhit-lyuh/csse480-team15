import 'package:flutter/material.dart';
import 'package:project/component/course_card.dart';
import 'package:project/model/course.dart';

class QuarterCourseList extends StatelessWidget {
  final String season;
  final int year;
  const QuarterCourseList({
    super.key,
    required this.season,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    List<Course> courseList = [];
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
    courseList.add(c1);
    courseList.add(c2);
    courseList.add(c3);
    courseList.add(c4);
    return Column(
      children: [
        Container(
          width: 100,
          height: 80,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Center(
            child: Text(
              season,
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
        ),
        Container(
          width: 100,
          height: 400,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          margin: const EdgeInsets.only(bottom: 50.0),
          child: Column(
            children: courseList
                .map((c) => season == c.quarter && year == c.year
                    ? CourseCard(courseName: c.name, courseCredit: c.credit)
                    : const SizedBox())
                .toList(),
          ),
        ),
      ],
    );
  }
}
