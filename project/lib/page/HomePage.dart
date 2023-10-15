import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> views = const [
    Center(
      child: Text('Home'),
    ),
    Center(
      child: Text('Course'),
    ),
    Center(
      child: Text('Course Flowchar'),
    ),
  ];
  int selectedIndex = 0;

  /// The currently selecte
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Rose-Hulman",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Row(
        children: [
          SideNavigationBar(
            selectedIndex: selectedIndex,
            items: const [
              SideNavigationBarItem(
                icon: Icons.home,
                label: 'Home',
              ),
              SideNavigationBarItem(
                icon: Icons.apps,
                label: 'Course',
              ),
              SideNavigationBarItem(
                icon: Icons.table_chart,
                label: 'Course Flowchar',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: views.elementAt(selectedIndex),
          )
        ],
      ),
    );
  }
}
