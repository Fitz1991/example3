import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:republic_on_volga/domain/utils/date_formater.dart';
import 'package:republic_on_volga/model/article.dart';
import 'package:republic_on_volga/view/article_listener.dart';
import 'package:simple_html_css/simple_html_css.dart';

class ArticlesWidget extends StatelessWidget {
  ArticlesWidget({
    Key key,
    this.isPreview = true,
    @required this.articles,
    @required this.articleListener,
  }) : super(key: key);

  bool isPreview;
  final List<Article> articles;
  final ArticleListener articleListener;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...articles.map((article) {
          return GestureDetector(
            onTap: () => articleListener.goToPage(articles.indexOf(article)),
            child: ListTileWidget(
                date: article.date,
                description: article.description,
                imageUrl: article.imgUrl,
                isPreview: isPreview,
                title: article.title),
          );
        }).toList(),
      ],
    );
  }
}

class ListTileWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final Timestamp date;
  bool isPreview;

  ListTileWidget({
    @required this.date,
    @required this.description,
    @required this.imageUrl,
    @required this.title,
    this.isPreview,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (imageUrl != null && imageUrl.isNotEmpty)
            ? CachedNetworkImage(
                imageUrl: imageUrl,
              )
            : SizedBox.shrink(),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Builder(
                builder: (context) {
                  return (date != null)
                      ? Column(
                          children: [
                            Text(timestampToDate(date),
                                style: Theme.of(context).textTheme.bodyText2),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        )
                      : SizedBox.shrink();
                },
              ),
              RichText(
                text: HTML.toTextSpan(context, description,
                    defaultTextStyle: Theme.of(context).textTheme.bodyText1),
                overflow: (isPreview) ? TextOverflow.ellipsis : TextOverflow.visible,
                maxLines: (isPreview) ? 5 : null,
              ),
              SizedBox(
                height: 16,
              )
            ],
          ),
        )
      ],
    );
  }
}
