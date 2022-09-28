import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, viewModel, child) => Scaffold(
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 300,
                child: FlickVideoPlayer(flickManager: viewModel.flickManager,
                ),
              ),
              // ElevatedButton(onPressed: () => viewModel.apiService.audioHandler.play(), child: Text("play")),
              // ElevatedButton(onPressed: () => viewModel.apiService.audioHandler.pause(), child: Text("pause"))
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
