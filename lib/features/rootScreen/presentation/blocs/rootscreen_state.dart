import 'package:flutter/material.dart';
import 'package:portfolio_in/features/rootScreen/presentation/blocs/root_screen_event.dart';

class RootscreenState {
  final Buttons button;
  final int index;
  final Widget currentPage;
  RootscreenState({
    required this.button,
    required this.index,
    required this.currentPage,
  });
  RootscreenState copyWith({Buttons? button, int? index, Widget? currentPage}) {
    return RootscreenState(
      currentPage: currentPage ?? this.currentPage,
      button: button ?? this.button,
      index: index ?? this.index,
    );
  }
}
