part of 'proizvodstvo_bloc.dart';

@immutable
abstract class ProizvodstvoState {}

class ProizvodstvoLoadingState extends ProizvodstvoState {}

class ProizvodstvoErrorState extends ProizvodstvoState {}

class ProizvodstvoLoadedState extends ProizvodstvoState {
  final List<Zadelka5Model> loadedZadelka5;
  ProizvodstvoLoadedState({required this.loadedZadelka5});

  List<Zadelka5Model> get loadedZadelka5List => loadedZadelka5;
}
