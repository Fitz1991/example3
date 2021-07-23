import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:republic_on_volga/data/resources.dart';
import 'package:republic_on_volga/domain/screen/screen_cubit.dart';
import 'package:republic_on_volga/model/item_volga_slider_fabric.dart';
import 'package:republic_on_volga/model/master_class.dart';
import 'package:republic_on_volga/model/master_class_arguments.dart';
import 'package:republic_on_volga/model/selected_item_menu.dart';
import 'package:republic_on_volga/view/arrow_back_button.dart';
import 'package:republic_on_volga/view/main_app_bar.dart';
import 'package:republic_on_volga/view/single_page_widget.dart';
import 'package:simple_html_css/simple_html_css.dart';

class MasterClassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MasterClassArguments masterClassArguments = ModalRoute.of(context).settings.arguments as MasterClassArguments;
    MasterClass masterClass = masterClassArguments.masterClass;
    return SinglePageWidget(
        appBar: MainAppBar(
          title: masterClass.title,
          leading: ArrowBackButton(),
        ),
        body: BlocBuilder<ScreenCubit, ScreenState>(
          builder: (context, state) {
            if (state is ScreenHeight) {
              return Container(
                  padding: EdgeInsets.all(8),
                  height: state.height - bottomMenuIndent,
                  child: ListView(
                    children: [
                      Stack(
                        children: [
                          ImageVolgaFactory().createWidget(masterClassArguments.parentUrl),
                          Positioned(
                            left: 24,
                            top: 32,
                            child: Text(masterClassArguments.parentTitle, style: Theme.of(context).textTheme.headline2
                                .copyWith(color: Colors.white),),
                          ),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Text(masterClass.title, style: Theme.of(context).textTheme.headline1,),
                      SizedBox(height: 8,),
                      RichText(
                        text: HTML.toTextSpan(context, masterClass.description,
                            defaultTextStyle:
                            Theme.of(context).textTheme.bodyText1),
                      ),
                      SizedBox(height: 8,),
                      UrlPreviewVolgaFactory(videoVolgaSliderFabric: VideoVolgaFactory(), height: 300).createWidget
                        (masterClass
                          .url)
                    ],
                  ));
            } else {
              return SizedBox.shrink();
            }
          },
        ),
        selectedItemMenu: SelectedItemMenu(lection: true));
  }
}
