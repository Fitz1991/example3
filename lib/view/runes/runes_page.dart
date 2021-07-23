import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:republic_on_volga/data/resources.dart';
import 'package:republic_on_volga/data/runes.dart';
import 'package:republic_on_volga/domain/screen/screen_cubit.dart';
import 'package:republic_on_volga/model/item_volga_slider_fabric.dart';
import 'package:republic_on_volga/model/rune.dart';
import 'package:republic_on_volga/model/selected_item_menu.dart';
import 'package:republic_on_volga/view/single_page_widget.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'dart:math' as math;

import '../main_app_bar.dart';

class RunesPage extends StatefulWidget {
  @override
  _RunesPageState createState() => _RunesPageState();
}

class _RunesPageState extends State<RunesPage> {
  AutoScrollController _autoScrollController;
  final _scrollDirection = Axis.vertical;

  @override
  void initState() {
    super.initState();
    _autoScrollController = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: _scrollDirection);
  }

  @override
  Widget build(BuildContext context) {
    return SinglePageWidget(
        appBar: MainAppBar(
          title: 'Руны',
        ),
        body: Center(
          child: BlocBuilder<ScreenCubit, ScreenState>(
            builder: (context, state) {
              if (state is ScreenHeight) {
                return Container(
                    padding: EdgeInsets.only(bottom: 10),
                    height: state.height - bottomMenuIndent,
                    child: CustomScrollView(
                      controller: _autoScrollController,
                      slivers: [
                        SliverPersistentHeader(
                            // pinned: true,
                            floating: true,
                            delegate: _SliverAppBarDelegate(
                          maxHeight: 300,
                          minHeight: 0,
                          child: ABCWidget(autoScrollController: _autoScrollController),
                        )),
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              SizedBox(
                                height: blocSpace,
                              ),
                              ...runes.map<Widget>((data) {
                                return RuneItemWidget(
                                    autoScrollController: _autoScrollController,
                                    data: data);
                              }).toList(),
                              SizedBox(height:  bottomMenuIndent,)
                            ],

                          ),
                        ),
                      ],
                    ));
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ),
        selectedItemMenu: SelectedItemMenu(runes: true));
  }
}

class RuneItemWidget extends StatelessWidget {
  const RuneItemWidget(
      {Key key, @required this.autoScrollController, @required this.data})
      : super(key: key);

  final Rune data;
  final AutoScrollController autoScrollController;

  @override
  Widget build(BuildContext context) {
    return AutoScrollTag(
      key: ValueKey(runes.indexOf(data)),
      controller: autoScrollController,
      index: runes.indexOf(data),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            UrlPreviewVolgaFactory(
              videoVolgaSliderFabric: VideoVolgaFactory(),
            ).createWidget(data.video),
            SizedBox(
              height: 8,
            ),
            Text(
              '${data.title}',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '${data.description}',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
      highlightColor: Colors.black.withOpacity(0.1),
    );
  }
}

class ABCWidget extends StatelessWidget {
  const ABCWidget({
    Key key,
    @required this.autoScrollController,
  }) : super(key: key);

  final AutoScrollController autoScrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      color: HexColor(primaryColor),
      child: GridView.builder(
        // physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: 3,
          mainAxisSpacing: 30.0,
          crossAxisSpacing: 10.0,
        ),
        itemCount: runes.length,
        itemBuilder: (context, index) {
          return Container(
              child: InkWell(
            onTap: () {
              autoScrollController.scrollToIndex(index,
                  preferPosition: AutoScrollPosition.begin);
            },
            child: Image.asset('${runes[index].imgUrl}'),
          ));
        },
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent)
  {
    return new SizedBox.expand(child: child);
  }
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
