import 'package:flutter/material.dart';
import 'package:project/component/course_card.dart';
import 'package:project/model/course.dart';

class QuarterCourseList extends StatelessWidget {
  final String season;
  final int year;
  final List<Course> courseList;
  const QuarterCourseList({
    super.key,
    required this.season,
    required this.year,
    required this.courseList,
  });

  @override
  Widget build(BuildContext context) {
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
          height: 500,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          margin: const EdgeInsets.only(bottom: 50.0),
          child: Column(
            children: courseList
                .map((c) => season == c.quarter && year == c.year
                    ? LongPressDraggable<Course>(
                        data: c,
                        // dragAnchorStrategy: pointerDragAnchorStrategy,
                        feedback: CourseCard(
                          courseName: c.name,
                          courseCredit: c.credit,
                        ),
                        childWhenDragging: const Card(
                          margin: EdgeInsets.only(top: 20.0),
                          color: Colors.yellow,
                          clipBehavior: Clip.hardEdge,
                        ),
                        child: CourseCard(
                          courseName: c.name,
                          courseCredit: c.credit,
                        ),
                        onDragStarted: () {
                          print(c.name);
                        },
                        onDragCompleted: () {
                          print(c.quarter);
                        },
                      )
                    : const SizedBox())
                .toList(),
          ),
        ),
      ],
    );
  }
}
