import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:republic_on_volga/model/article.dart';

class Lection implements Article{
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

  Lection(this.date, this.description, this.id, this.imgUrl, this.title);
}