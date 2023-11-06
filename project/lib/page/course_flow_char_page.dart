import 'package:flutter/material.dart';
import 'package:project/component/list_page_drawer.dart';
import 'package:project/component/year_list.dart';
import 'package:project/managers/user_data_management.dart';

class CourseFlowChartPage extends StatefulWidget {
  final int yearnum;
  const CourseFlowChartPage({super.key, required this.yearnum});

  @override
  State<CourseFlowChartPage> createState() => _CourseFlowChartPageState();
}

class _CourseFlowChartPageState extends State<CourseFlowChartPage> {
  List<String> courseList = UserDataDocumentManager.instance.hasCourseTaking
      ? UserDataDocumentManager.instance.courseTaking
      : [
          'PH 111,1',
          'MA 111,1',
          'CSSE 120,1',
          'RH 131,1',
          'RHIT 100,1',
          'PH 112,2',
          'MA 112,2',
          'CSSE 220,2',
          'HSSA,2',
          'SCI,3',
          'MA 113,3',
          'ECE 233,3',
          'CSSE 132,3',
          'MA 221,4',
          'MA 276,4',
          'CSSE 280,4',
          'CSSE 232,4',
          'MA 374,5',
          'CSSE 230,5',
          'CSSE 332,5',
          'RH 330,5',
          'MA 381,6',
          'CSSE 333,6',
          'ECE 332,6',
          'HSSA,6',
          'CHEM 111,7',
          'CSSE 304,7',
          'CSSE 371,7',
          'HSSA,7',
          'CSSE,8',
          'CSSE 473,8',
          'CSSE 374,8',
          'HSSA,8',
          'FREE,9',
          'FREE,9',
          'CSSE 474,9',
          'HSSA,9',
          'CSSE,10',
          'FREE,10',
          'CSSE 497,10',
          'HSSA,10',
          'CSSE,11',
          'TECH,11',
          'CSSE 498,11',
          'HSSA,11',
          'FREE,12',
          'FREE,12',
          'CSSE 499,12'
        ];
  late var newCourseNumberEditingController = TextEditingController();
  late var newCourseDepartmentEditingController = TextEditingController();

  @override
  void initState() {
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Visibility(
                visible: !(widget.yearnum == 1),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return CourseFlowChartPage(
                              yearnum: widget.yearnum - 1,
                            );
                          }),
                        );
                      },
                      icon: const Icon(Icons.arrow_circle_left_outlined),
                    ),
                    const Text('Last Year'),
                  ],
                ),
              ),
              Visibility(
                visible: (widget.yearnum < 4),
                child: Row(
                  children: [
                    const Text('Next Year'),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return CourseFlowChartPage(
                              yearnum: widget.yearnum + 1,
                            );
                          }),
                        );
                      },
                      icon: const Icon(Icons.arrow_circle_right_outlined),
                    ),
                  ],
                ),
              ),
            ]),
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      YearList(
                        year: widget.yearnum,
                        courseList: courseList,
                        callBack: ({
                          required String course,
                          required String quarter,
                        }) {
                          setState(() {
                            for (int i = 0; i < courseList.length; i++) {
                              var c = courseList[i];
                              String name = _splitCourseQuarter(c)[0]!;
                              int year = widget.yearnum - 1;
                              int quarterNum = 0;
                              if (c == course) {
                                if (quarter == "Fall") {
                                  quarterNum = 1;
                                } else if (quarter == "Winter") {
                                  quarterNum = 2;
                                } else if (quarter == "Spring") {
                                  quarterNum = 3;
                                }
                                String temp =
                                    (year * 3 + quarterNum).toString();
                                var tempCourse = "$name,$temp";
                                courseList[i] = tempCourse;
                                break;
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
          ],
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
    ];
    List<String> quarterList = [
      "Select a Quarter",
      "Fall",
      "Winter",
      "Spring",
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
                  controller: newCourseDepartmentEditingController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter a course department',
                      hintText: 'e.g. CSSE, MA .etc'),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: newCourseNumberEditingController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter a course number',
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
                    int year = int.parse(dropdownValueYear);
                    int season = 0;
                    if (dropdownValueQuarter == "Fall") {
                      season = 1;
                    } else if (dropdownValueQuarter == "Winter") {
                      season = 2;
                    } else if (dropdownValueQuarter == "Spring") {
                      season = 3;
                    }
                    int quarter = (year - 1) * 3 + season;
                    String courseToAdd =
                        "${newCourseDepartmentEditingController.text.toUpperCase()} ${newCourseNumberEditingController.text},$quarter";
                    courseList.add(courseToAdd);
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

  Map<int, String> _splitCourseQuarter(String word) {
    var split = word.split(',');
    Map<int, String> values = {
      for (int i = 0; i < split.length; i++) i: split[i]
    };
    return values;
  }
}
