import 'package:flutter/material.dart';

class ScheduleChart extends StatelessWidget {

  final String mon8;
  final String mon9;
  final String mon10;
  final String mon11;
  final String mon12;
  final String mon13;
  final String mon14;
  final String mon15;
  final String mon16;

  final String tue8;
  final String tue9;
  final String tue10;
  final String tue11;
  final String tue12;
  final String tue13;
  final String tue14;
  final String tue15;
  final String tue16;
 
  final String wed8;
  final String wed9;
  final String wed10;
  final String wed11;
  final String wed12;
  final String wed13;
  final String wed14;
  final String wed15;
  final String wed16;

  final String thur8;
  final String thur9;
  final String thur10;
  final String thur11;
  final String thur12;
  final String thur13;
  final String thur14;
  final String thur15;
  final String thur16;

  final String fri8;
  final String fri9;
  final String fri10;
  final String fri11;
  final String fri12;
  final String fri13;
  final String fri14;
  final String fri15;
  final String fri16;

  const ScheduleChart({
    required this.mon8,
  required this.mon9,
  required this.mon10,
  required this.mon11,
  required this.mon12,
  required this.mon13,
  required this.mon14,
  required this.mon15,
  required this.mon16,

  required this.tue8,
  required this.tue9,
  required this.tue10,
  required this.tue11,
  required this.tue12,
  required this.tue13,
  required this.tue14,
  required this.tue15,
  required this.tue16,
 
  required this.wed8,
  required this.wed9,
  required this.wed10,
  required this.wed11,
  required this.wed12,
  required this.wed13,
  required this.wed14,
  required this.wed15,
  required this.wed16,

  required this.thur8,
  required this.thur9,
  required this.thur10,
  required this.thur11,
  required this.thur12,
  required this.thur13,
  required this.thur14,
  required this.thur15,
  required this.thur16,

  required this.fri8,
  required this.fri9,
  required this.fri10,
  required this.fri11,
  required this.fri12,
  required this.fri13,
  required this.fri14,
  required this.fri15,
  required this.fri16,

    super.key
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
  primary: false,
  slivers: <Widget>[
    SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverGrid.count(
        // crossAxisSpacing: 10,
        // mainAxisSpacing: 10,
        crossAxisCount: 10,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: const Text(
                "8:00-8:50",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: const Text(
                "9:00-9:50",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: const Text(
                "10:00-10:50",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: const Text(
                "11:00-11:50",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: const Text(
                "12:00-12:50",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: const Text(
                "13:00-13:50",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: const Text(
                "14:00-14:50",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: const Text(
                "15:00-15:50",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: const Text(
                "16:00-16:50",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: const Text(
                "Mon",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${mon8}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${mon9}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${mon10}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${mon11}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${mon12}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${mon13}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${mon14}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${mon15}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${mon16}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: const Text(
                "Tue",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${tue8}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${tue9}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${tue10}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${tue11}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${tue12}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${tue13}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${tue14}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${tue15}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${tue16}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: const Text(
                "Wed",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${wed8}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${wed9}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${wed10}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${wed11}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${wed12}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${wed13}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${wed14}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${wed15}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${wed16}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: const Text(
                "Thur",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${thur8}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${thur9}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${thur10}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${thur11}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${thur12}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${thur13}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${thur14}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${thur15}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${thur16}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: const Text(
                "Fri",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${fri8}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${fri9}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${fri10}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${fri11}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${fri12}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${fri13}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${fri14}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${fri15}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Text(
                "${fri16}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    ),
  ],
);
  }
}