import 'dart:async';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/model/user_data.dart';

class UserDataDocumentManager {
  UserData? latestUserData;
  final CollectionReference _ref;

  static final instance = UserDataDocumentManager._privateConstructor();
  UserDataDocumentManager._privateConstructor()
      : _ref = FirebaseFirestore.instance.collection(kUserDataCollectionPath);

  StreamSubscription startListening({
    required String documentId,
    required Function observer,
  }) {
    return _ref.doc(documentId).snapshots().listen(
        (DocumentSnapshot documentSnapshot) {
      latestUserData = UserData.from(documentSnapshot);
      observer();
    }, onError: (error) {
      print("Error getting the document $error");
    });
  }

  void stopListening(StreamSubscription? subscription) {
    subscription?.cancel();
  }

  void clearLatest() {
    latestUserData = null;
  }

  String get major => latestUserData?.major ?? "";
  int get startYear => latestUserData?.startYear ?? -1;
  List<String> get courseTaking => latestUserData?.courseTaking ?? [];
}
