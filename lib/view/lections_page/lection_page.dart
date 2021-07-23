import 'package:flutter/material.dart';
import 'package:republic_on_volga/model/article.dart';
import 'package:republic_on_volga/model/article_screen_argument.dart';
import 'package:republic_on_volga/model/selected_item_menu.dart';
import 'package:republic_on_volga/view/arrow_back_button.dart';
import 'package:republic_on_volga/view/main_app_bar.dart';
import 'package:republic_on_volga/view/single_page_widget.dart';

class LectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Article article = (ModalRoute.of(context).settings.arguments as ArticleScreenArgument).article;

    return SinglePageWidget(
        appBar: MainAppBar(
          title: article.title,
          leading: ArrowBackButton(),
        ),
        body: Text(article.description),
        selectedItemMenu: SelectedItemMenu(lection: true)
    );
  }
}
