
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:project/model/firestore_model_utils.dart';

const kCourseSchedulesCollectionPath = "CourseSchedules";
const kCourseScheduleMon8 = "mon8";
const kCourseScheduleMon9 = "mon9";
const kCourseScheduleMon10 = "mon10";
const kCourseScheduleMon11 = "mon11";
const kCourseScheduleMon12 = "mon12";
const kCourseScheduleMon13 = "mon13";
const kCourseScheduleMon14 = "mon14";
const kCourseScheduleMon15 = "mon15";
const kCourseScheduleMon16 = "mon16";

const kCourseScheduleTue8 = "tue8";
const kCourseScheduleTue9 = "tue9";
const kCourseScheduleTue10 = "tue10";
const kCourseScheduleTue11 = "tue11";
const kCourseScheduleTue12 = "tue12";
const kCourseScheduleTue13 = "tue13";
const kCourseScheduleTue14 = "tue14";
const kCourseScheduleTue15 = "tue15";
const kCourseScheduleTue16 = "tue16";

const kCourseScheduleWed8 = "wed8";
const kCourseScheduleWed9 = "wed9";
const kCourseScheduleWed10 = "wed10";
const kCourseScheduleWed11 = "wed11";
const kCourseScheduleWed12 = "wed12";
const kCourseScheduleWed13 = "wed13";
const kCourseScheduleWed14 = "wed14";
const kCourseScheduleWed15 = "wed15";
const kCourseScheduleWed16 = "wed16";

const kCourseScheduleThur8 = "thur8";
const kCourseScheduleThur9 = "thur9";
const kCourseScheduleThur10 = "thur10";
const kCourseScheduleThur11 = "thur11";
const kCourseScheduleThur12 = "thur12";
const kCourseScheduleThur13 = "thur13";
const kCourseScheduleThur14 = "thur14";
const kCourseScheduleThur15 = "thur15";
const kCourseScheduleThur16 = "thur16";

const kCourseScheduleFri8 = "fri8";
const kCourseScheduleFri9 = "fri9";
const kCourseScheduleFri10 = "fri10";
const kCourseScheduleFri11 = "fri11";
const kCourseScheduleFri12 = "fri12";
const kCourseScheduleFri13 = "fri13";
const kCourseScheduleFri14 = "fri14";
const kCourseScheduleFri15 = "fri15";
const kCourseScheduleFri16 = "fri16";

class CourseSchedule {
  String? documentId;
  
   String mon8;
   String mon9;
   String mon10;
   String mon11;
   String mon12;
   String mon13;
   String mon14;
   String mon15;
   String mon16;

   String tue8;
   String tue9;
   String tue10;
   String tue11;
   String tue12;
   String tue13;
   String tue14;
   String tue15;
   String tue16;
 
   String wed8;
   String wed9;
   String wed10;
   String wed11;
   String wed12;
   String wed13;
   String wed14;
   String wed15;
   String wed16;

   String thur8;
   String thur9;
   String thur10;
   String thur11;
   String thur12;
   String thur13;
   String thur14;
   String thur15;
   String thur16;

   String fri8;
   String fri9;
   String fri10;
   String fri11;
   String fri12;
   String fri13;
   String fri14;
   String fri15;
   String fri16;

   CourseSchedule({
    this.documentId,
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
  });

  CourseSchedule.from(DocumentSnapshot doc) :
    this (
      documentId: doc.id,
      mon8: FirestoreModelUtils.getStringField(doc, kCourseScheduleMon8),
      mon9: FirestoreModelUtils.getStringField(doc, kCourseScheduleMon9),
      mon10: FirestoreModelUtils.getStringField(doc, kCourseScheduleMon10),
      mon11: FirestoreModelUtils.getStringField(doc, kCourseScheduleMon11),
      mon12: FirestoreModelUtils.getStringField(doc, kCourseScheduleMon12),
      mon13: FirestoreModelUtils.getStringField(doc, kCourseScheduleMon13),
      mon14: FirestoreModelUtils.getStringField(doc, kCourseScheduleMon14),
      mon15: FirestoreModelUtils.getStringField(doc, kCourseScheduleMon15),
      mon16: FirestoreModelUtils.getStringField(doc, kCourseScheduleMon16),

      tue8: FirestoreModelUtils.getStringField(doc, kCourseScheduleTue8),
      tue9: FirestoreModelUtils.getStringField(doc, kCourseScheduleTue9),
      tue10: FirestoreModelUtils.getStringField(doc, kCourseScheduleTue10),
      tue11: FirestoreModelUtils.getStringField(doc, kCourseScheduleTue11),
      tue12: FirestoreModelUtils.getStringField(doc, kCourseScheduleTue12),
      tue13: FirestoreModelUtils.getStringField(doc, kCourseScheduleTue13),
      tue14: FirestoreModelUtils.getStringField(doc, kCourseScheduleTue14),
      tue15: FirestoreModelUtils.getStringField(doc, kCourseScheduleTue15),
      tue16: FirestoreModelUtils.getStringField(doc, kCourseScheduleTue16),

      wed8: FirestoreModelUtils.getStringField(doc, kCourseScheduleWed8),
      wed9: FirestoreModelUtils.getStringField(doc, kCourseScheduleWed9),
      wed10: FirestoreModelUtils.getStringField(doc, kCourseScheduleWed10),
      wed11: FirestoreModelUtils.getStringField(doc, kCourseScheduleWed11),
      wed12: FirestoreModelUtils.getStringField(doc, kCourseScheduleWed12),
      wed13: FirestoreModelUtils.getStringField(doc, kCourseScheduleWed13),
      wed14: FirestoreModelUtils.getStringField(doc, kCourseScheduleWed14),
      wed15: FirestoreModelUtils.getStringField(doc, kCourseScheduleWed15),
      wed16: FirestoreModelUtils.getStringField(doc, kCourseScheduleWed16),

      thur8: FirestoreModelUtils.getStringField(doc, kCourseScheduleThur8),
      thur9: FirestoreModelUtils.getStringField(doc, kCourseScheduleThur9),
      thur10: FirestoreModelUtils.getStringField(doc, kCourseScheduleThur10),
      thur11: FirestoreModelUtils.getStringField(doc, kCourseScheduleThur11),
      thur12: FirestoreModelUtils.getStringField(doc, kCourseScheduleThur12),
      thur13: FirestoreModelUtils.getStringField(doc, kCourseScheduleThur13),
      thur14: FirestoreModelUtils.getStringField(doc, kCourseScheduleThur14),
      thur15: FirestoreModelUtils.getStringField(doc, kCourseScheduleThur15),
      thur16: FirestoreModelUtils.getStringField(doc, kCourseScheduleThur16),

      fri8: FirestoreModelUtils.getStringField(doc, kCourseScheduleFri8),
      fri9: FirestoreModelUtils.getStringField(doc, kCourseScheduleFri9),
      fri10: FirestoreModelUtils.getStringField(doc, kCourseScheduleFri10),
      fri11: FirestoreModelUtils.getStringField(doc, kCourseScheduleFri11),
      fri12: FirestoreModelUtils.getStringField(doc, kCourseScheduleFri12),
      fri13: FirestoreModelUtils.getStringField(doc, kCourseScheduleFri13),
      fri14: FirestoreModelUtils.getStringField(doc, kCourseScheduleFri14),
      fri15: FirestoreModelUtils.getStringField(doc, kCourseScheduleFri15),
      fri16: FirestoreModelUtils.getStringField(doc, kCourseScheduleFri16),

    );

}