// lib/bloc/navigation/navigation_event.dart
import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class PageTapped extends NavigationEvent {
  final int index;
  final dynamic args;

  const PageTapped(this.index, {this.args});

  @override
  List<Object> get props => [index];
}
