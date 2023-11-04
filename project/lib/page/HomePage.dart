import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/component/list_page_drawer.dart';
import 'package:project/component/profile_card.dart';
import 'package:project/managers/auth_manager.dart';
import 'package:project/managers/student_data_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  StreamSubscription? _studentDataSubscription;
  

  @override
  void initState() {
    _studentDataSubscription = StudentDataDocumentManager.instance.startListening(
      documentId: AuthManager.instance.uid, 
      observer: () {
        print("username: ${StudentDataDocumentManager.instance.displayName}");
      }
    );
    super.initState();
  }

  /// The currently selecte
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
      drawer: const ListPageDrawer(),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(40.0)),
            ProfileCard()
          ],
        ),
      ),
    );
  }
}
