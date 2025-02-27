//Este se llama asi por que es un reproductor de video scrollable

import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {

  final List<VideoPost> videos; 

  const VideoScrollableView({
    super.key, 
    required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical ,
      itemCount: videos.length,
      itemBuilder: (context, index) {

        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            //video player ++ gradiente

            SizedBox.expand(
              child: FullscreenPlayer(
                caption: videoPost.caption,
                videoUrl: videoPost.videoUrl
              )

            ),
           


            //botones 
            /*Positioned es un widget que trabaja junto al "Stack"
            y nos permite definir la posición del widget hijo. */
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost)),
          ],
        );
      },

    );
  }
}