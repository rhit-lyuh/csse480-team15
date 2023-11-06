import 'package:flutter/material.dart';
import 'package:project/component/course_card.dart';

class QuarterCourseList extends StatelessWidget {
  final String season;
  final int year;
  final List<String> courseList;
  final void Function({required String course}) courseCardDeleteCallBack;
  final void Function({required String course}) courseCardUndoCallBack;
  const QuarterCourseList({
    super.key,
    required this.season,
    required this.year,
    required this.courseList,
    required this.courseCardDeleteCallBack,
    required this.courseCardUndoCallBack,
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
                .map(
                  (c) => ((season == "Fall" &&
                                  int.parse(_splitCourseQuarter(c)[1]!)
                                          .remainder(3) ==
                                      1) ||
                              (season == "Winter" &&
                                  int.parse(_splitCourseQuarter(c)[1]!)
                                          .remainder(3) ==
                                      2) ||
                              (season == "Spring" &&
                                  int.parse(_splitCourseQuarter(c)[1]!)
                                          .remainder(3) ==
                                      0)) &&
                          year ==
                              (int.parse(_splitCourseQuarter(c)[1]!)
                                          .remainder(3) !=
                                      0
                                  ? (int.parse(_splitCourseQuarter(c)[1]!) / 3)
                                          .floor() +
                                      1
                                  : (int.parse(_splitCourseQuarter(c)[1]!) / 3))
                      ? LongPressDraggable<String>(
                          data: c,
                          // dragAnchorStrategy: pointerDragAnchorStrategy,
                          feedback: CourseCard(
                            courseNum: _splitCourseQuarter(c)[0]!,
                            courseString: c,
                            courseCardDeleteCallBack: courseCardDeleteCallBack,
                            courseCardUndoCallBack: courseCardUndoCallBack,
                          ),
                          childWhenDragging: const Card(
                            margin: EdgeInsets.only(top: 20.0),
                            color: Colors.yellow,
                            clipBehavior: Clip.hardEdge,
                          ),
                          child: CourseCard(
                            courseNum: _splitCourseQuarter(c)[0]!,
                            courseString: c,
                            courseCardDeleteCallBack: courseCardDeleteCallBack,
                            courseCardUndoCallBack: courseCardUndoCallBack,
                          ),
                          onDragStarted: () {
                            print("Drag started: $c");
                          },
                          onDragCompleted: () {
                            print("Drag complete $c");
                          },
                        )
                      : const SizedBox(),
                )
                .toList(),
          ),
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
