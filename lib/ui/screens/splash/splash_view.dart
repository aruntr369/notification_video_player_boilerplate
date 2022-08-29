import 'package:boilerplate/constants/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../tools/screen_size.dart';
import 'splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      onModelReady: (model) => model.startTimer(),
      builder: (context, model, child) {
        return Scaffold(
          body: Container(
            width: ScreenSize.width,
            height: ScreenSize.height,
            alignment: Alignment.center,
            child: Assets.images.logo.image(),
          ),
        );
      },
      viewModelBuilder: () => SplashViewModel(),
    );
  }
}
