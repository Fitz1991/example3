import 'package:cloud_firestore/cloud_firestore.dart';

class Rune {
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

  String video;

  Rune({this.date, this.description, this.id, this.imgUrl, this.title, this.video});
}
