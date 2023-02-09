import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttercalls/core/state_management/view_state.dart';
import 'package:fluttercalls/home/user_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends ChangeNotifier {
  ViewState usersState = ViewState.initial;
  List<UserModel> users = [];
  void getUsers() async {
    usersState = ViewState.loading;
    final rawUsers = await FirebaseFirestore.instance.collection('users').get();
    users = rawUsers.docs.map((e) => UserModel.fromJson(e.data())).toList();
    usersState = ViewState.success;
    notifyListeners();
  }
}
