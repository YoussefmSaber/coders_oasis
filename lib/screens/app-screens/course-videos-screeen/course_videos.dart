import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart'; // Import SystemChrome.

class CourseVideosScreen extends StatelessWidget {
  CourseVideosScreen({Key? key}) : super(key: key);

  String str =
      "https://www.youtube.com/watch?v=Ii-scMenaOQ&list=PLrnPJCHvNZuCVTz6lvhR81nnaf1a-b67U&index=1&ab_channel=CodinginFlow";

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
    String? asd = extractVideoIdFromUrl(str);

    if (asd != null) {
      YoutubePlayerController _controller = YoutubePlayerController(
        initialVideoId: asd,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );

      // Set the screen orientation to landscape.
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);

      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: AspectRatio(
            aspectRatio: 16/9,
            child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressColors: ProgressBarColors(playedColor: Colors.green),
              ),
          ),
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
