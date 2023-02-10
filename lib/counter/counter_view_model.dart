// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class CounterViewModel extends ChangeNotifier {
  int count = 0;
  Student s = Student(
    degree: 1,
  );
  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }

  void sameValue() {
    // s = Student(
    //   degree:1,
    // );
    count = 0;
    notifyListeners();
  }
}

class Student extends Equatable {
  final int degree;
  Student({
    required this.degree,
  });

  @override
  List<Object?> get props => [degree];
}
