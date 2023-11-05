import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/component/list_page_drawer.dart';
import 'package:project/component/schedule_chart.dart';
import 'package:project/managers/auth_manager.dart';
import 'package:project/managers/course_schedule_data_manager.dart';
import 'package:project/managers/student_data_manager.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  
  StreamSubscription? _courseScheduleDataSubscription;

  @override
  void initState() {
    _courseScheduleDataSubscription = CoursescheduleDataDocumentManager.instance.startListening(
      dcoumentId: AuthManager.instance.uid, 
      observer: () {
        setState(() {
          
        });
      }
    );
    super.initState();
  }

  @override
  void dispose() {
    CoursescheduleDataDocumentManager.instance.stopListening(_courseScheduleDataSubscription);
    super.dispose();
  }

  /// The currently selecte
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Current Schedule",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff800000),
      ),
      drawer: const ListPageDrawer(),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(child: ScheduleChart(
          mon8: CoursescheduleDataDocumentManager.instance.mon8,
          mon9: CoursescheduleDataDocumentManager.instance.mon9,
          mon10: CoursescheduleDataDocumentManager.instance.mon10,
          mon11: CoursescheduleDataDocumentManager.instance.mon11,
          mon12: CoursescheduleDataDocumentManager.instance.mon12,
          mon13: CoursescheduleDataDocumentManager.instance.mon13,
          mon14: CoursescheduleDataDocumentManager.instance.mon14,
          mon15: CoursescheduleDataDocumentManager.instance.mon15,
          mon16: CoursescheduleDataDocumentManager.instance.mon16,
          
          tue8: CoursescheduleDataDocumentManager.instance.tue8,
          tue9: CoursescheduleDataDocumentManager.instance.tue9,
          tue10: CoursescheduleDataDocumentManager.instance.tue10,
          tue11: CoursescheduleDataDocumentManager.instance.tue11,
          tue12: CoursescheduleDataDocumentManager.instance.tue12,
          tue13: CoursescheduleDataDocumentManager.instance.tue13,
          tue14: CoursescheduleDataDocumentManager.instance.tue14,
          tue15: CoursescheduleDataDocumentManager.instance.tue15,
          tue16: CoursescheduleDataDocumentManager.instance.tue16,

          wed8: CoursescheduleDataDocumentManager.instance.wed8,
          wed9: CoursescheduleDataDocumentManager.instance.wed9,
          wed10: CoursescheduleDataDocumentManager.instance.wed10,
          wed11: CoursescheduleDataDocumentManager.instance.wed11,
          wed12: CoursescheduleDataDocumentManager.instance.wed12,
          wed13: CoursescheduleDataDocumentManager.instance.wed13,
          wed14: CoursescheduleDataDocumentManager.instance.wed14,
          wed15: CoursescheduleDataDocumentManager.instance.wed15,
          wed16: CoursescheduleDataDocumentManager.instance.wed16,

          thur8: CoursescheduleDataDocumentManager.instance.thur8,
          thur9: CoursescheduleDataDocumentManager.instance.thur9,
          thur10: CoursescheduleDataDocumentManager.instance.thur10,
          thur11: CoursescheduleDataDocumentManager.instance.thur11,
          thur12: CoursescheduleDataDocumentManager.instance.thur12,
          thur13: CoursescheduleDataDocumentManager.instance.thur13,
          thur14: CoursescheduleDataDocumentManager.instance.thur14,
          thur15: CoursescheduleDataDocumentManager.instance.thur15,
          thur16: CoursescheduleDataDocumentManager.instance.thur16,

          fri8: CoursescheduleDataDocumentManager.instance.fri8,
          fri9: CoursescheduleDataDocumentManager.instance.fri9,
          fri10: CoursescheduleDataDocumentManager.instance.fri10,
          fri11: CoursescheduleDataDocumentManager.instance.fri11,
          fri12: CoursescheduleDataDocumentManager.instance.fri12,
          fri13: CoursescheduleDataDocumentManager.instance.fri13,
          fri14: CoursescheduleDataDocumentManager.instance.fri14,
          fri15: CoursescheduleDataDocumentManager.instance.fri15,
          fri16: CoursescheduleDataDocumentManager.instance.fri16,

        )),
      ),
    );
  }
}
