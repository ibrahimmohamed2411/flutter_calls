import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fluttercalls/generated/l10n.dart';

import '../constants/assets.dart';

class FlutterAnimateScreen extends StatelessWidget {
  const FlutterAnimateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
      ),
      body: Center(
        child: Image.asset(
          Assets.assetsImagesAppIcon,
        )
            .animate(
              target: 1,
              onPlay: (controller) {},
              onComplete: (controller) => controller.repeat(),
            )
            .shimmer(delay: 400.ms, duration: 1800.ms)
            .shake(hz: 4, curve: Curves.easeInOutCubic)
            .scaleXY(end: 1.1, duration: 600.ms)
            .then(delay: 600.ms)
            .scaleXY(end: 1 / 1.1),
      ),
    );
  }
}
