import 'package:coders_oasis/shared/components/components.dart';
import 'package:coders_oasis/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart'; // Import SystemChrome.

class VideoPlayer extends StatelessWidget {
  final String videoUrl;

  VideoPlayer({Key? key, required this.videoUrl}) : super(key: key);

  String? extractVideoIdFromUrl(String url) {
    final uri = Uri.parse(url);
    final queryParameters = uri.queryParameters;

    if (uri.host == 'www.youtube.com' && queryParameters.containsKey('v')) {
      return queryParameters['v'];
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    String? asd = extractVideoIdFromUrl(videoUrl);

    if (asd != null) {
      YoutubePlayerController _controller = YoutubePlayerController(
        initialVideoId: asd,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );

      // Hide The status bar.
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      // Set the screen orientation to landscape.
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);

      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(children: [
            Center(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressColors: ProgressBarColors(playedColor: defaultColor),
                  onEnded: (_) {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            backButton(onTap: () {
              SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
              Navigator.pop(context);
            })
          ]),
        ),
      );
    } else {
      // Handle the case where the URL does not contain a valid video ID
      return SafeArea(
        child: Scaffold(
          body: Center(
            child: Text("Invalid YouTube URL"),
          ),
        ),
      );
    }
  }
}
