import 'package:cloud_firestore/cloud_firestore.dart';

DateTime? toDate(dynamic timestamp) {
  if (timestamp == null) return null;
  return (timestamp as Timestamp).toDate();
}

Timestamp? fromDate(DateTime date) {
  return Timestamp.fromDate(date.toUtc());
}