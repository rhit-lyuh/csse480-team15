import 'dart:async';
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

  void update(List<String> courseList) {
    _ref.doc(latestUserData!.documentId!).update({
      kUserDataCourseTaking: courseList,
    }).then((_) {
      print("Finished updating the document");
    }).catchError((error) {
      print("There was an error adding the document $error");
    });
  }

  String get major => latestUserData?.major ?? "";
  int get startYear => latestUserData?.startYear ?? -1;
  List<String> get courseTaking => latestUserData?.courseTaking ?? [];
  bool get hasCourseTaking => latestUserData?.courseTaking != [];
}
