import 'package:flutter/material.dart';
import 'package:project/page/CourseFlowCharPage.dart';
import 'package:project/page/HomePage.dart';
import 'package:project/page/courses_page.dart';

class ListPageDrawer extends StatelessWidget {
  const ListPageDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff800000),
            ),
            child: Text(
              "Rose-Hulman",
              style: TextStyle(color: Colors.white, fontSize: 28.0),
            ),
          ),
          ListTile(
            title: const Text("Home"),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const HomePage();
                }),
              );
            },
          ),
          ListTile(
            title: const Text("Courses"),
            leading: const Icon(Icons.apps),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CoursesPage();
              }));
            },
          ),
          ListTile(
            title: const Text("Course Flowchart"),
            leading: const Icon(Icons.table_chart),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const CourseFlowChartPage();
                }),
              );
            },
          ),
          const Spacer(),
          ListTile(
            title: const Text("Log out"),
            leading: const Icon(Icons.logout),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
