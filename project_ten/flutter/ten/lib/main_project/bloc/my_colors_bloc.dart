import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_colors_event.dart';
part 'my_colors_state.dart';

class MyColorsBloc extends Bloc<MyColorsEvent, MyColorsState> {
  // начальное состояние = красный
  MyColorsBloc() : super(MyColorsStateValue(Colors.green)) {
    on<MyColorsEventRed>(_onColorChangeRed);
    on<MyColorsEventGreen>(_onColorChangeGreen);
    on<MyColorsEventBlue>(_onColorChangeBlue);
  }

  _onColorChangeRed(MyColorsEvent event, Emitter<MyColorsState> emit) {
    emit(MyColorsStateValue(Colors.red));
  }

  _onColorChangeGreen(MyColorsEvent event, Emitter<MyColorsState> emit) {
    emit(MyColorsStateValue(Colors.green));
  }

  _onColorChangeBlue(MyColorsEvent event, Emitter<MyColorsState> emit) {
    emit(MyColorsStateValue(Colors.blue));
  }
}
