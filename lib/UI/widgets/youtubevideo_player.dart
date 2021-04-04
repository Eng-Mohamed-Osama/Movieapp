import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerwidge extends StatefulWidget {
  YoutubePlayerwidge(
      {Key key,
      this.title,
      YoutubePlayerController controller,
      bool showVideoProgressIndicator,
      String youtubeLink,
      MaterialAccentColor progressIndicatorColor})
      : super(key: key);

  final String title;

  @override
  _YoutubePlayerwidge createState() => _YoutubePlayerwidge();
}

class _YoutubePlayerwidge extends State<YoutubePlayerwidge> {
  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'SUXWAEX2jlg', // id youtube video
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ));

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.blueAccent,
    );
  }
}
