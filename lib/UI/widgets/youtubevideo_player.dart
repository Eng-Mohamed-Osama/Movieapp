import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerwidge extends StatefulWidget {
  YoutubePlayerwidge({
    Key key,
    this.title,
    YoutubePlayerController controller,
    bool showVideoProgressIndicator,
    @required this.youtubeLink,
    MaterialAccentColor progressIndicatorColor,
  }) : super(key: key);

  final String title;
  final String youtubeLink;

  @override
  _YoutubePlayerwidge createState() => _YoutubePlayerwidge();
}

class _YoutubePlayerwidge extends State<YoutubePlayerwidge> {
  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
        initialVideoId: widget.youtubeLink,
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ));
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.blueAccent,
    );
  }
}
