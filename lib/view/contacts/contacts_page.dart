import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:republic_on_volga/data/resources.dart';
import 'package:republic_on_volga/domain/screen/screen_cubit.dart';
import 'package:republic_on_volga/model/contact.dart';
import 'package:republic_on_volga/model/selected_item_menu.dart';
import 'package:republic_on_volga/view/main_app_bar.dart';
import 'package:republic_on_volga/view/single_page_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsPage extends StatelessWidget {
  Contact contact = Contact(
      instaUrl: '@happy_volga',
      instaUrlPath: 'https://www.instagram.com/happy_volga/?igshid=f6bp9y4e6t6v',
      mail: 'respublika.navolge@yandex.ru',
      shortMail: 'respublika.navolge');

  @override
  Widget build(BuildContext context) {
    return SinglePageWidget(
        appBar: MainAppBar(
          title: 'Контакты',
        ),
        body: BlocBuilder<ScreenCubit, ScreenState>(
          builder: (context, state) {
            if (state is ScreenHeight) {
              return Container(
                height: state.height - bottomMenuIndent - homeAppBarHeight,
                child: Column(
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          InkWell(
                              onTap: () => _launchInBrowser(contact.instaUrlPath),
                              child: Row(
                                children: [
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/insta.svg',
                                          height: 60,
                                          width: 60,
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text(
                                          contact.instaUrl,
                                          style: Theme.of(context).textTheme.headline1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 48,
                          ),
                          InkWell(
                              onTap: () => _launchInBrowser(contact.mailUri),
                              child: Row(
                                children: [
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.alternate_email_sharp,
                                          size: 60,
                                          color: HexColor(primaryColor),
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text(
                                          contact.shortMail,
                                          style: Theme.of(context).textTheme.headline1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
        selectedItemMenu: SelectedItemMenu(contacts: true));
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
