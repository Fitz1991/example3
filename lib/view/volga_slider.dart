import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:infinity_page_view/infinity_page_view.dart';
import 'package:provider/provider.dart';
import 'package:republic_on_volga/data/resources.dart';
import 'package:republic_on_volga/domain/volga_slider/volga_slider_bloc.dart';
import 'package:republic_on_volga/view/article_listener.dart';

import '../model/item_volga_slider_fabric.dart';

class VolgaSlider extends StatefulWidget {
  VolgaSlider({this.height = 300});
  double height;

  @override
  _VolgaSliderState createState() => _VolgaSliderState();
}

class _VolgaSliderState extends State<VolgaSlider> {
  int currentPage;
  InfinityPageController _pageController;
  VolgaItemForSliderFabric itemVolgaSliderFabric;
  ArticleListener articleListener;

  @override
  void initState() {
    currentPage = 0;
    _pageController =
        InfinityPageController(initialPage: currentPage, viewportFraction: 0.8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    itemVolgaSliderFabric = context.read<VolgaItemForSliderFabric>();
    articleListener = context.read<ArticleListener>();
    return BlocBuilder<VolgaSliderBloc, VolgaSliderState>(
      builder: (context, state) {
        if(state.sliderItems != null && state.sliderItems.isNotEmpty){
          return SizedBox(
            height: widget.height,
            child: Column(
              children: [
                Expanded(
                    child: InfinityPageView(
                      itemCount: state.sliderItems.length,
                      itemBuilder: (context, index) {
                        return (index == currentPage)
                            ? Column(
                          children: [
                            Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 5, right: 5, bottom: elementSpace),
                                  child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                      child: itemVolgaSliderFabric.createWidget(
                                          state.sliderItems[index].url)),
                                )),
                            InkWell(
                              onTap: () {
                                articleListener?.goToPage(index);
                              },
                              child: Column(
                                children: [
                                  (state.sliderItems[index].title != null)
                                      ? Padding(
                                    padding: EdgeInsets.only(
                                        left: 5,
                                        right: 5,
                                        bottom: elementSpace),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        state.sliderItems[index].title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                    ),
                                  )
                                      : SizedBox.shrink(),
                                  (state.sliderItems[index].desc != null)
                                      ? Padding(
                                    padding: EdgeInsets.only(
                                      left: 5,
                                      right: 5,
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        state.sliderItems[index].desc,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    ),
                                  )
                                      : SizedBox.shrink(),
                                ],
                              ),
                            ),
                          ],
                        )
                            : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              child: itemVolgaSliderFabric
                                  .createWidget(state.sliderItems[index].url)),
                        );
                      },
                      // itemCount: imgList.length,
                      controller: _pageController,
                      onPageChanged: (value) {
                        setState(() {
                          currentPage = value;
                        });
                      },
                    )),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: state.sliderItems.map((url) {
                      int index = state.sliderItems.indexOf(url);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentPage == index
                              ? HexColor(primaryColor)
                              : HexColor(inactiveColor),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          );
        }
        else{
          return SizedBox.shrink();
        }
      },
    );
  }
}
