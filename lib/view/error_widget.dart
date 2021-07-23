import 'package:flutter/material.dart';
import 'package:republic_on_volga/data/resources.dart';

class ServerErrorWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(serverError, style: Theme
              .of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.red),),
        ],
      ),
    );
  }
}
