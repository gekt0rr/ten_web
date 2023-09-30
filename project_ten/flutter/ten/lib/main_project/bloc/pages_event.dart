part of 'pages_bloc.dart';

@immutable
abstract class PagesEvent {}

class PagesEventLoading extends PagesEvent {}

class PageHomeEvent extends PagesEvent {}

class PageItem1Event extends PagesEvent {}

class ProizvodstvoDashboardEvent extends PagesEvent {}

class ProizvodstvoFormEvent extends PagesEvent {}

class ProizvodstvoListEvent extends PagesEvent {}
