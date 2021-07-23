import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:republic_on_volga/data/home_page/main/repository/suvenirs_firestore_repository.dart';
import 'package:republic_on_volga/domain/home_page/suvenirs/suvenirs_bloc.dart';
import 'package:republic_on_volga/view/error_widget.dart';
import 'package:republic_on_volga/view/progress_widget.dart';

class SuvenirsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SuvenirsBloc>(
      create: (context) =>
          SuvenirsBloc(suvenirsRepository: SuvenirsFirestoreRepository())
            ..add(GetSuvenirsEvent()),
      child: BlocBuilder<SuvenirsBloc, SuvenirsState>(
        builder: (context, suvenirState) {
          if (suvenirState is SuvenirsData) {
            return Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  ...suvenirState.suvenirs
                      .map((suvenir) => Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: CachedNetworkImage(imageUrl: suvenir.urlImg),
                          ))
                      .toList()
                ],
              ),
            );
          }
          if (suvenirState is ErrorSuvenirs) {
            return ServerErrorWidget();
          } else {
            return ProgressWidget();
          }
        },
      ),
    );
  }
}
