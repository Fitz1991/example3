import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String timestampToDate(Timestamp timestamp){
  final date = timestamp.toDate();
  final DateFormat formatter = DateFormat('dd.MM.yy');
  final String formatted = formatter.format(date);
  return formatted;
}

String timestampToTime(Timestamp timestamp){
  final date = timestamp.toDate();
  final DateFormat formatter = DateFormat('hh:mm');
  final String formatted = formatter.format(date);
  return formatted;
}