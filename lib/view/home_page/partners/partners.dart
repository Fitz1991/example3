import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:republic_on_volga/data/home_page/main/repository/partner_firestore_repository.dart';
import 'package:republic_on_volga/data/resources.dart';
import 'package:republic_on_volga/domain/home_page/partner/partner_bloc.dart';
import 'package:republic_on_volga/domain/screen/screen_cubit.dart';
import 'package:republic_on_volga/view/error_widget.dart';
import 'package:republic_on_volga/view/progress_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class PartnersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PartnerBloc>(
      create: (context) =>
          PartnerBloc(partnerRepository: PartnerFirestoreRepository())
            ..add(GetPartnerEvent()),
      child: BlocBuilder<PartnerBloc, PartnerState>(
        builder: (context, partnerState) {
          if (partnerState is PartnerData) {
            return BlocBuilder<ScreenCubit, ScreenState>(
              builder: (context, state) {
                if (state is ScreenHeight) {
                  return Container(
                    padding: EdgeInsets.all(8),
                    height: state.height - bottomMenuIndent - homeAppBarHeight,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 24,
                        mainAxisExtent: 100,
                        mainAxisSpacing: 24,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            _launchInBrowser(partnerState.partners[index].urlPartner);
                          },
                          child: CachedNetworkImage(
                            imageUrl: partnerState.partners[index].urlImg,
                          ),
                        );
                      },
                      itemCount: partnerState.partners.length,
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            );
          }
          if (partnerState is ErrorPartnerEvent) {
            return ServerErrorWidget();
          } else {
            return ProgressWidget();
          }
        },
      ),
    );
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


