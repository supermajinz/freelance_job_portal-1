// lib/bloc/navigation/navigation_state.dart
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class PageLoading extends NavigationState {}

class PageLoaded extends NavigationState {
  final int currentIndex;
  final Widget currentPage;

  const PageLoaded(this.currentIndex, this.currentPage);

  @override
  List<Object> get props => [currentIndex, currentPage];
}
