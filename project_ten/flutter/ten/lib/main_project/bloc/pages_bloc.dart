import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ten/main_project/ui/pages/item_1.dart';
import 'package:ten/main_project/ui/pages/proizvodstvo_list.dart';

import '../ui/pages/home_page.dart';
import '../ui/pages/proizvodstvo_form.dart';
import '../ui/pages/proizvodstvo_dashboard.dart';

part 'pages_event.dart';
part 'pages_state.dart';

class PagesBloc extends Bloc<PagesEvent, PagesState> {
  // начальное состояние - страница Item1
  PagesBloc() : super(PagesInitial()) {
    on<PageHomeEvent>(_onPageHomeEvent);
    on<PageItem1Event>(_onPageItem1Event);
    on<ProizvodstvoDashboardEvent>(_onProizvodstvoDashboardEvent);
    on<ProizvodstvoFormEvent>(_onProizvodstvoFormEvent);
    on<ProizvodstvoListEvent>(_onProizvodstvoListEvent);
  }

  _onPageHomeEvent(PageHomeEvent event, Emitter<PagesState> emit) {
    emit(PagesStateLoading());
    emit(PagesStateLoaded(const HomeDefault()));
  }

  _onPageItem1Event(PageItem1Event event, Emitter<PagesState> emit) {
    emit(PagesStateLoading());
    emit(PagesStateLoaded(const Item1Page()));
  }

  _onProizvodstvoDashboardEvent(
      ProizvodstvoDashboardEvent event, Emitter<PagesState> emit) {
    emit(PagesStateLoading());
    emit(PagesStateLoaded(const ProizvodstvoDashboard()));
  }

  _onProizvodstvoFormEvent(
      ProizvodstvoFormEvent event, Emitter<PagesState> emit) {
    emit(PagesStateLoading());
    emit(PagesStateLoaded(ProizvodstvoForm()));
  }

  _onProizvodstvoListEvent(
      ProizvodstvoListEvent event, Emitter<PagesState> emit) {
    emit(PagesStateLoading());
    emit(PagesStateLoaded(ProizvodstvoList()));
  }
}
