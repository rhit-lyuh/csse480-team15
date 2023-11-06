import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreModelUtils {
  // A few date time helpers that really don't belong here, but it's easy:
  static DateTime fromTimestampToDateTime(Timestamp value) => value.toDate();
  static Timestamp fromDateTimeToTimestamp(DateTime value) =>
      Timestamp.fromDate(value);
  static TimeOfDay fromDateTimeToTimeOfDay(DateTime value) {
    DateTime epochDate = DateTime(1970, 1, 1, 0, 0);
    Duration delta = value.difference(epochDate);
    return TimeOfDay(hour: delta.inHours % 24, minute: delta.inMinutes % 60);
  }

  static String getStringField(
          DocumentSnapshot documentSnapshot, String fieldName) =>
      containsField(documentSnapshot, fieldName)
          ? documentSnapshot.get(fieldName)
          : "";

  static int getIntField(DocumentSnapshot documentSnapshot, String fieldName) =>
      containsField(documentSnapshot, fieldName)
          ? documentSnapshot.get(fieldName)
          : 0;

  static bool getBoolField(
          DocumentSnapshot documentSnapshot, String fieldName) =>
      containsField(documentSnapshot, fieldName)
          ? documentSnapshot.get(fieldName)
          : false;

  static DateTime getDateTimeField(
          DocumentSnapshot documentSnapshot, String fieldName) =>
      containsField(documentSnapshot, fieldName)
          ? documentSnapshot.get(fieldName)?.toDate()
          : DateTime.now();

  static Timestamp getTimestampField(
          DocumentSnapshot documentSnapshot, String fieldName) =>
      containsField(documentSnapshot, fieldName)
          ? documentSnapshot.get(fieldName)
          : Timestamp.now();

  static List<String> getStringListField(
      DocumentSnapshot documentSnapshot, String fieldName) {
    if (containsField(documentSnapshot, fieldName)) {
      // List<String> temp = documentSnapshot.get(fieldName);
      List<String> temp = List<String>.from(documentSnapshot.get(fieldName));
      return temp;
    }
    return [];
    // List<String> categoriesList = List<String>.from(map['categories'] as List);
  }

  static List<bool> getBoolListField(
          DocumentSnapshot documentSnapshot, String fieldName) =>
      containsField(documentSnapshot, fieldName)
          ? documentSnapshot.get(fieldName)
          : [];

  static bool containsField(
          DocumentSnapshot documentSnapshot, String fieldName) =>
      documentSnapshot.exists &&
      (documentSnapshot.data() as Map<String, dynamic>)
          .containsKey(fieldName) &&
      documentSnapshot.get(fieldName) != null;
}
