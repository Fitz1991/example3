import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  String id;
  String imgUrl;
  String title;
  String description;
  Timestamp date;

  Article({this.imgUrl, this.title, this.description, this.date});
}
