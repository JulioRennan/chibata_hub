import 'package:chibata_hub/core/theme/app_colors.dart';
import 'package:chibata_hub/modules/home/home_controller.dart';
import 'package:chibata_hub/modules/video/widgets/card_other_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({
    super.key,
    required this.linkVideo,
    required this.annotations,
    required this.index,
  });
  final String linkVideo;
  final String annotations;
  final int index;

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late final _controller = YoutubePlayerController(
    initialVideoId: widget.linkVideo,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      showLiveFullscreenButton: false,
    ),
  );
  bool isFullscreen = false;
  late final controller = Get.find<HomeController>();
  late final currentVideo = controller.listClasses
      .where(
        (element) => element['link'] == widget.linkVideo,
      )
      .first;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        return true;
      },
      child: Builder(builder: (context) {
        if (isFullscreen) {
          return YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          );
        }
        return Scaffold(
          appBar: isFullscreen
              ? null
              : AppBar(
                  title: Text('Aula ${widget.index + 1}'),
                ),
          body: Column(
            children: [
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                onReady: () {
                  _controller.addListener(() {
                    setState(() {
                      isFullscreen = _controller.value.isFullScreen;
                    });
                  });
                },
              ),
              if (!isFullscreen)
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
                                Builder(builder: (_) {
                                  return ListView(
                                    children: [
                                      for (var i = 0;
                                          i < controller.listClasses.length;
                                          i++)
                                        CardOtherClass(
                                          index: i,
                                          isSelected: controller.listClasses[i]
                                                  ['id'] ==
                                              currentVideo['id'],
                                          onTap: () {
                                            final video =
                                                controller.listClasses[i];
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => VideoPage(
                                                  annotations:
                                                      video['annotations'] ??
                                                          '',
                                                  linkVideo: video['link'],
                                                  index: i,
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                    ],
                                  );
                                }),
                                Builder(builder: (context) {
                                  if (widget.annotations.isEmpty) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.speaker_notes_off,
                                          size: 60,
                                          color: AppColors.primaryColor,
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          'Nenhuma anotação disponível',
                                          style: StyleThemes.body.withColor(
                                              AppColors.primaryColor),
                                        )
                                      ],
                                    );
                                  }
                                  return SingleChildScrollView(
                                    child: Text(
                                      widget.annotations,
                                      style: StyleThemes.body,
                                    ),
                                  );
                                }),
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
      }),
    );
  }
}
