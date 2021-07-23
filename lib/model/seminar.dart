import 'package:cloud_firestore/cloud_firestore.dart';

class Seminar {
  @override
  Timestamp date;

  @override
  String description;

  @override
  String id;

  @override
  String imgUrl;

  @override
  String title;

  Seminar(this.date, this.description, this.id, this.imgUrl, this.title);
}
