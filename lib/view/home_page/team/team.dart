import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:republic_on_volga/data/home_page/main/repository/team_firestore_repository.dart';
import 'package:republic_on_volga/domain/home_page/team/team_bloc.dart';
import 'package:republic_on_volga/model/member.dart';
import 'package:republic_on_volga/view/error_widget.dart';
import 'package:republic_on_volga/view/progress_widget.dart';
import 'package:republic_on_volga/view/styles/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class Team extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TeamBloc>(
      create: (context) => TeamBloc(teamRepository: TeamFirestoreRepository())
        ..add(GetTeamEvent()),
      child: BlocBuilder<TeamBloc, TeamState>(
        builder: (context, state) {
          if (state is TeamData) {
            return Column(
              children: [
                ...state.members
                    .map((e) => CardMember(
                          member: e,
                        ))
                    .toList()
              ],
            );
          }
          if (state is ErrorTeam) {
            return ServerErrorWidget();
          } else {
            return ProgressWidget();
          }
        },
      ),
    );
  }
}

class CardMember extends StatelessWidget {
  Member member;

  CardMember({this.member});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            child: CachedNetworkImage(
              imageUrl: member.imgUrl,
              height: 200,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                member.surname,
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                width: 5,
              ),
              Text(member.name, style: Theme.of(context).textTheme.headline1),
              SizedBox(
                width: 5,
              ),
              Text(member.secondName,
                  style: Theme.of(context).textTheme.headline1),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          (member.position != null && member.position.isNotEmpty) ? Text(
            member.position,
            style: Theme.of(context).textTheme.headline2,
          ) : SizedBox.shrink(),
          SizedBox(
            height: 8,
          ),
          Text(
            member.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () => {_launchInBrowser(member.socialUrlPath)},
            child: RichText(
                text: TextSpan(
                    text: 'Instagram',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontStyle: FontStyle.italic),
                    children: [
                  TextSpan(
                      text: member.socialUrl, style: VolgaStyle.primaryStyle())
                ])),
          ),
          SizedBox(
            height: 24,
          ),
        ],
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
