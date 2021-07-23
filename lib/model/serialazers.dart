import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:republic_on_volga/model/event.dart';
import 'package:republic_on_volga/model/home_page/main/main.dart';
import 'package:republic_on_volga/model/master_class.dart';
import 'package:republic_on_volga/model/member.dart';
import 'package:republic_on_volga/model/partner.dart';
import 'package:republic_on_volga/model/quiz.dart';
import 'package:republic_on_volga/model/suvenir.dart';
import 'package:republic_on_volga/model/archive.dart';
import 'package:republic_on_volga/model/timestamp_serializer.dart';
import 'package:republic_on_volga/model/volga_slider_model.dart';
import 'package:republic_on_volga/model/assembly_master_classes.dart';
import 'package:republic_on_volga/model/volga_test.dart';

import 'home_page/main/news.dart';

part 'serialazers.g.dart';

@SerializersFor(
    [Main, VolgaSliderModel, News, Member, Partner, VolgaTest, Quiz, Suvenir,
          Event, Archive, AssemblyMasterClasses, MasterClass,])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(TimestampSerializer()))
    .build();
