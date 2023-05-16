import 'package:chibata_hub/core/theme/app_colors.dart';
import 'package:chibata_hub/modules/video/widgets/card_other_class.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'sTX0UEplF54',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      showLiveFullscreenButton: false,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aula 2'),
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () {
              // _controller.addListener();
            },
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Container(
                padding: EdgeInsets.all(12),
                color: Colors.white,
                child: Column(
                  children: [
                    TabBar(
                      dividerColor: AppColors.primaryColor,
                      labelColor: AppColors.primaryColor,
                      indicatorColor: AppColors.primaryColor,
                      labelStyle: StyleThemes.subtitle,
                      indicatorPadding: const EdgeInsets.only(bottom: 3),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 3,
                      unselectedLabelColor:
                          AppColors.primaryColor.withOpacity(.5),
                      tabs: [
                        Tab(text: "Trilha do curso"),
                        Tab(text: "Anotações"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ListView(
                            children: [
                              CardOtherClass(),
                            ],
                          ),
                          SingleChildScrollView(
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              style: StyleThemes.body,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
