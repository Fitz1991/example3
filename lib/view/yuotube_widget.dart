import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeWidget extends StatelessWidget {
  String url;

  YoutubeWidget(this.url, {this.autoPlay = false});

  bool autoPlay;

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _youtubePlayerController;
    if (url != null) {
      String videoId;
      videoId = YoutubePlayer.convertUrlToId(url);
      _youtubePlayerController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          autoPlay: autoPlay,
          mute: false,
        ),
      );
      return Container(
        height: 300,
        child: YoutubePlayer(
          controller: _youtubePlayerController,
          showVideoProgressIndicator: true,
          bottomActions: [
            CurrentPosition(),
            ProgressBar(isExpanded: true),
            PlaybackSpeedButton()
          ],
        ),
      );
    } else
      return SizedBox.shrink();
  }

// _getVideo(String url) async {
//   var file = await DefaultCacheManager().getSingleFile(url);
// }
}
