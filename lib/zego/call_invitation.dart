import 'package:flutter/material.dart';
import 'package:fluttercalls/static.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
class CallInvitationPage extends StatelessWidget {
  final Widget child;
  final String userName;
  const CallInvitationPage({super.key,required  this.child,required  this.userName});

  @override
  Widget build(BuildContext context) {
     return ZegoUIKitPrebuiltCallWithInvitation(
      appID: Static.appId,
      appSign: Static.appSign,
      userID: userName,
      userName: userName,
      
     
      plugins: [ZegoUIKitSignalingPlugin()],
      child: child,
    );
  }
}