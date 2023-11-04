import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/model/firestore_model_utils.dart';

const kCourseCollectionPath = "Courses";
const kCourseName = "courseName";
const kCourseNumber = "courseNumber";
const kCourseCredit = "creditHours";
const kCourseDepartment = "department";
const kCourseDescription = "description";
const kCourseLastTouched = "lastTouched";
const kCoursePrerequest = "prerequisites";
const kCourseCorequest = "corequisites";
const kCoursePostrequest = "postrequisites";
const kCourseTermAvaliable = "termAvailable";

class Course {
  String name;
  int credit;
  String? documentId;
  String courseNumber;
  String department;
  String description;
  Timestamp lastTouched;
  List<String> prerequest;
  List<String> corequest;
  List<String> postrequest;
  List<bool> termAvailable;

  Course({
    this.documentId,
    required this.name,
    required this.credit,
    required this.courseNumber,
    required this.department,
    required this.description,
    required this.lastTouched,
    required this.corequest,
    required this.postrequest,
    required this.prerequest,
    required this.termAvailable,
  });

  Course.from(DocumentSnapshot doc)
      : this(
          documentId: doc.id,
          name: FirestoreModelUtils.getStringField(doc, kCourseName),
          credit: FirestoreModelUtils.getIntField(doc, kCourseCredit),
          courseNumber: FirestoreModelUtils.getStringField(doc, kCourseNumber),
          department:
              FirestoreModelUtils.getStringField(doc, kCourseDepartment),
          description:
              FirestoreModelUtils.getStringField(doc, kCourseDescription),
          lastTouched:
              FirestoreModelUtils.getTimestampField(doc, kCourseLastTouched),
          corequest:
              FirestoreModelUtils.getStringListField(doc, kCourseCorequest),
          prerequest:
              FirestoreModelUtils.getStringListField(doc, kCoursePrerequest),
          postrequest:
              FirestoreModelUtils.getStringListField(doc, kCoursePostrequest),
          termAvailable:
              FirestoreModelUtils.getBoolListField(doc, kCourseTermAvaliable),
        );

  Map<String, Object?> toMap() => {
        kCourseName: name,
        kCourseCredit: credit,
        kCourseNumber: courseNumber,
        kCourseDepartment: department,
        kCourseDescription: description,
        kCourseLastTouched: lastTouched,
        kCourseCorequest: corequest,
        kCoursePrerequest: prerequest,
        kCoursePostrequest: postrequest,
        kCourseTermAvaliable: termAvailable,
      };
}
