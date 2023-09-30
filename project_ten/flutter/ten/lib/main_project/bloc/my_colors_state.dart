part of 'my_colors_bloc.dart';

@immutable
abstract class MyColorsState {}

class MyColorsInitial extends MyColorsState {}

class MyColorsStateValue extends MyColorsState {
  final Color color;
  MyColorsStateValue(this.color);
}
