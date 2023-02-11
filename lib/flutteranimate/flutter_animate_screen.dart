import 'package:flutter/material.dart';
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
        child: Column(
          children: [
            Image.asset(
              Assets.assetsImagesAppIcon,
            ),
            Image.asset(
              Assets.assetsImagesMusicPlayer,
            ),
            Image.asset(
              Assets.assetsImagesMusicPlayer,
            ),
          ],
        ),
      ),
    );
  }
}
