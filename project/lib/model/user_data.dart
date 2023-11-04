import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/model/firestore_model_utils.dart';

const kUserDataCollectionPath = "users";
const kUserDataMajor = "major";
const kUserDataStartYear = "startYear";
const kUserDataCourseTaking = "courseTaking";

class UserData {
  String major;
  int startYear;
  List<String> courseTaking;
  String? documentId;

  UserData({
    this.documentId,
    required this.major,
    required this.startYear,
    required this.courseTaking,
  });

  UserData.from(DocumentSnapshot doc)
      : this(
          documentId: doc.id,
          major: FirestoreModelUtils.getStringField(doc, kUserDataMajor),
          startYear: FirestoreModelUtils.getIntField(doc, kUserDataStartYear),
          courseTaking: FirestoreModelUtils.getStringListField(
              doc, kUserDataCourseTaking),
        );

  Map<String, Object?> toMap() => {
        kUserDataMajor: major,
        kUserDataStartYear: startYear,
        kUserDataCourseTaking: courseTaking,
      };
}
