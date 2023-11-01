import 'package:flutter/material.dart';
import 'package:project/component/quarter_course_list.dart';

class YearList extends StatelessWidget {
  final int year;
  const YearList({super.key, required this.year});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 50.0),
          width: 400,
          height: 80,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Center(
            child: Text(
              "Year $year",
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
        ),
        Row(
          children: [
            QuarterCourseList(
              season: "Fall",
              year: year,
            ),
            QuarterCourseList(
              season: "Winter",
              year: year,
            ),
            QuarterCourseList(
              season: "Spring",
              year: year,
            ),
            QuarterCourseList(
              season: "Summer",
              year: year,
            ),
          ],
        ),
      ],
    );
  }
}
