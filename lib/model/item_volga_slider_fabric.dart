import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_store/flutter_cache_store.dart';
import 'package:provider/provider.dart';
import 'package:republic_on_volga/data/resources.dart';
import 'package:republic_on_volga/libs/lib/simple_url_preview.dart';
import 'package:republic_on_volga/main.dart';
import 'package:republic_on_volga/view/yuotube_widget.dart';

class VolgaItemForSliderFabric {
  Widget createWidget(String url) {}
}

class ImageVolgaFactory implements VolgaItemForSliderFabric {
  double width;

  ImageVolgaFactory({this.width = 1000});

  @override
  Widget createWidget(String url) {
    return
      (url != null && url.isNotEmpty) ? CachedNetworkImage(imageUrl: url, fit:
    BoxFit
        .cover, width:
    width,) : SizedBox.shrink();
  }
}

class VideoVolgaFactory implements VolgaItemForSliderFabric {
  @override
  Widget createWidget(String url) {
    return YoutubeWidget(
      url,
      autoPlay: true,
    );
  }
}

class UrlPreviewVolgaFactory implements VolgaItemForSliderFabric {
  VolgaItemForSliderFabric videoVolgaSliderFabric;
  double height;

  UrlPreviewVolgaFactory({this.videoVolgaSliderFabric, this.height});

  @override
  Widget createWidget(String url) {
    return Provider(create: (context) => height, child: PreviewUrlWidget(videoVolgaSliderFabric: videoVolgaSliderFabric, url: url,),) ;
  }
}

class PreviewUrlWidget extends StatefulWidget {
  VolgaItemForSliderFabric videoVolgaSliderFabric;
  String url;

  PreviewUrlWidget({this.videoVolgaSliderFabric, this.url});

  @override
  _PreviewUrlWidgetState createState() => _PreviewUrlWidgetState();
}

class _PreviewUrlWidgetState extends State<PreviewUrlWidget> {
  bool isTapPreview = false;
  Widget currentWidget;

  @override
  Widget build(BuildContext context) {
    _getWidgetFromUrl(widget.url);
    if (isTapPreview) {
      return currentWidget;
    } else {
      currentWidget = Container(
        height: (Provider.of<double>(context) != null) ? Provider.of<double>(context) : volgaSliderItemHeight,
        child: Stack(
          children: [
            SimpleUrlPreview(
              previewHeight: (Provider.of<double>(context) != null) ? Provider.of<double>(context) : volgaSliderItemHeight,
              url: widget.url,
              bgColor: Colors.transparent,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isTapPreview = true;
                    currentWidget = widget.videoVolgaSliderFabric.createWidget(widget.url);
                  });
                },
                child: Opacity(
                  opacity: 0.7,
                  child: Icon(
                    Icons.play_arrow,
                    size: 70,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return currentWidget;
  }

  _getWidgetFromUrl(String url) async {
    final store = await CacheStore.getInstance();
    var response = await store.getFile(widget.url).catchError((error) {
      return null;
    });

    if (response == null) {
      if (!this.mounted) {
        return;
      }
      setState(() {
        log.i(this.mounted);
      });
      return;
    }
    var file;

    try {
      await response.readAsString();
    } on FileSystemException {
      file = await response.readAsBytes();
      log.e('Не получилось прочитать $file');
    } catch (e) {
      log.e(e);
    }
  }
}
