import 'package:flutter/material.dart';
import 'package:project/component/quarter_course_list.dart';

class YearList extends StatelessWidget {
  final int year;
  final void Function({required String course, required String quarter})
      callBack;
  final List<String> courseList;
  const YearList({
    super.key,
    required this.year,
    required this.callBack,
    required this.courseList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 50.0),
          width: 300,
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
            DragTarget(
              builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return QuarterCourseList(
                  season: "Fall",
                  year: year,
                  courseList: courseList,
                );
              },
              onAccept: (String course) {
                callBack(course: course, quarter: "Fall");
              },
            ),
            DragTarget(
              builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return QuarterCourseList(
                  season: "Winter",
                  year: year,
                  courseList: courseList,
                );
              },
              onAccept: (String course) {
                callBack(course: course, quarter: "Winter");
              },
            ),
            DragTarget(
              builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return QuarterCourseList(
                  season: "Spring",
                  year: year,
                  courseList: courseList,
                );
              },
              onAccept: (String course) {
                callBack(course: course, quarter: "Spring");
              },
            ),
          ],
        ),
      ],
    );
  }

  Map<int, String> _splitCourseQuarter(String word) {
    var split = word.split(',');
    Map<int, String> values = {
      for (int i = 0; i < split.length; i++) i: split[i]
    };
    return values;
  }
}
