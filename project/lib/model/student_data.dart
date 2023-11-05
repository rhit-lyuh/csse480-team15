import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/model/firestore_model_utils.dart';

const kStudentDataCollectionPath = "Students";
const kStudentDataDisplayName = "username";
const kStudentDataMajor = "Major";
const kStudentDataMinor = "Minor";
const kStudentDataYear = "year";
const kStudentDataAcademic = "Academic";

class StudentData {
  String? documentId;
  String username;
  String major;
  String minor;
  String year;
  String academic;

  StudentData({
    this.documentId,
    required this.username,
    required this.major,
    required this.minor,
    required this.year,
    required this.academic,
  });

  StudentData.from(DocumentSnapshot doc)
      : this(
          documentId: doc.id,
          username:
              FirestoreModelUtils.getStringField(doc, kStudentDataDisplayName),
          major: FirestoreModelUtils.getStringField(doc, kStudentDataMajor),
          minor: FirestoreModelUtils.getStringField(doc, kStudentDataMinor),
          year: FirestoreModelUtils.getStringField(doc, kStudentDataYear),
          academic: FirestoreModelUtils.getStringField(doc, kStudentDataAcademic),
        );

  Map<String, Object?> toMap() => {
        kStudentDataDisplayName: username,
        kStudentDataMajor: major,
        kStudentDataMinor: minor,
        kStudentDataYear: year,
        kStudentDataAcademic: academic,
      };

  @override
  String toString() {
    return "Display name: $username";
  }
}
