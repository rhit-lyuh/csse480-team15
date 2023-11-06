import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/managers/auth_manager.dart';
import 'package:project/model/user_data.dart';

class UserDatasCollectionManager {
  // Not actually need after the Firebase UI Firestore refactor
  List<UserData> latestUserDatas = [];

  final CollectionReference _ref;

  static final instance = UserDatasCollectionManager._privateConstructor();
  UserDatasCollectionManager._privateConstructor()
      : _ref = FirebaseFirestore.instance.collection(kUserDataCollectionPath);

  // Not actually need after the Firebase UI Firestore refactor
  StreamSubscription startListening(Function observer) {
    return _ref.snapshots().listen((QuerySnapshot querySnapshot) {
      latestUserDatas =
          querySnapshot.docs.map((doc) => UserData.from(doc)).toList();
      observer();
    }, onError: (error) {
      debugPrint("Error listening $error");
    });
  }

  // Not actually need after the Firebase UI Firestore refactor
  void stopListening(StreamSubscription? subscription) {
    subscription?.cancel();
  }

  void maybeAddNewUser(List<String> courseList) async {
    DocumentSnapshot snapshot = await _ref.doc(AuthManager.instance.uid).get();
    if (snapshot.exists) {
      print("This UserData exist do nothing");
    } else {
      print("This is a new user. TODO: Make a doc");

      if (AuthManager.instance.uid.isNotEmpty) {
        createNewUser(courseList);
      }
    }
  }

  void createNewUser(List<String> courseList) {
    Map<String, Object> initialUserData = {};
    initialUserData[kUserDataMajor] = 'CSSE';
    initialUserData[kUserDataStartYear] = '2023';
    initialUserData[kUserDataCourseTaking] = courseList;
    _ref.doc(AuthManager.instance.uid).set(initialUserData).catchError((error) {
      print("Error setting the document $error");
    });
  }
}
