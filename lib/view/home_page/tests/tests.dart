import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:republic_on_volga/data/home_page/main/repository/test_firestore_repository.dart';
import 'package:republic_on_volga/domain/home_page/tests/test_bloc.dart';
import 'package:republic_on_volga/model/quiz_screen_arguments.dart';
import 'package:republic_on_volga/model/volga_test.dart';
import 'package:republic_on_volga/view/error_widget.dart';
import 'package:republic_on_volga/view/progress_widget.dart';
import 'package:republic_on_volga/view/quiz_listener.dart';

class TestsPage extends StatelessWidget implements QuizListener {
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return BlocProvider<TestBloc>(
      create: (context) => TestBloc(testRepository: TestFirestoreRepository())
        ..add(GetTestEvent()),
      child: BlocBuilder<TestBloc, TestState>(
        builder: (context, testState) {
          if (testState is TestData) {
            return Column(
              children: [
                ...testState.tests
                    .map(
                      (test) => GestureDetector(
                          onTap: () => goToPage(test),
                          child: TestTile(
                            test: test,
                          )),
                    )
                    .toList()
              ],
            );
          }
          if (testState is ErrorTest) {
            return ServerErrorWidget();
          } else {
            return ProgressWidget();
          }
        },
      ),
    );
  }

  @override
  goToPage(VolgaTest test) {
    Navigator.of(_context)
        .pushNamed('/quiz', arguments: QuizScreenArgument(test));
  }
}

class TestTile extends StatelessWidget {
  VolgaTest test;

  TestTile({this.test});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          test.title,
          style: Theme.of(context).textTheme.headline1,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 8,
        ),
        CachedNetworkImage(
          imageUrl: test.imageUrl,
        ),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
