part of 'pages_bloc.dart';

@immutable
abstract class PagesState {}

class PagesInitial extends PagesState {}

// состояние - страница загружается (показываем прогрессбар)
class PagesStateLoading extends PagesState {}

// состояние - страница загружена (показываем данные)
class PagesStateLoaded extends PagesState {
  final Widget page;
  PagesStateLoaded(this.page);
}
