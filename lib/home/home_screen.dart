import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttercalls/locator/locator.dart';
import 'package:fluttercalls/signin/signin_view_model.dart';
import 'package:fluttercalls/zego/call_invitation.dart';
import 'package:provider/provider.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../core/state_management/view_state.dart';
import 'home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => locator()..getUsers(),
      child: CallInvitationPage(
        userName: FirebaseAuth.instance.currentUser!.email!,
        child: Scaffold(
          drawer: Drawer(
            child: Center(
              child: ListTile(
                title: Text('Logout'),
                onTap: context.read<SignInViewModel>().logout,
              ),
            ),
          ),
          appBar: AppBar(
            title: Text('Home'),
          ),
          body: Consumer<HomeViewModel>(
            builder: (context, model, child) {
              switch (model.usersState) {
                case ViewState.initial:

                case ViewState.loading:
                  return CircularProgressIndicator();
                case ViewState.error:
                  return Text('Error');
                case ViewState.success:
                  return ListView.builder(
                    itemCount: model.users.length,
                    itemBuilder: (context, index) => UserCard(
                      email: model.users[index].email,
                    ),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final String email;
  const UserCard({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(email),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          actionButton(false),
          actionButton(true),
          
        ],
      ),
    );
  }

  ZegoSendCallInvitationButton actionButton(bool isVideo) {
    return ZegoSendCallInvitationButton(
      isVideoCall: isVideo,
      resourceID: "zegouikit_call",
      invitees: [
        ZegoUIKitUser(id: email, name: email),
      ], //group call or one to one call
    );
  }
}
