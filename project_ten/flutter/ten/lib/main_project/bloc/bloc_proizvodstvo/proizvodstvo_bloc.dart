import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:ten/main_project/repository/models/zadelka_5_list.dart';
import 'package:ten/main_project/repository/services/zadelka_5_repo.dart';

part 'proizvodstvo_event.dart';
part 'proizvodstvo_state.dart';

class ProizvodstvoBloc extends Bloc<ProizvodstvoEvent, ProizvodstvoState> {
  final Zadelka5Repo zadelka5Repo;
  ProizvodstvoBloc(this.zadelka5Repo) : super(ProizvodstvoLoadingState()) {
    on<Zadelka5LoadEvent>(_zadelka5LoadEvent);
  }

  _zadelka5LoadEvent(
      Zadelka5LoadEvent event, Emitter<ProizvodstvoState> emit) async {
    emit(ProizvodstvoLoadingState());

    try {
      final List<Zadelka5Model> loadedZadelka5List =
          await zadelka5Repo.getAllZadelka5();
      emit(ProizvodstvoLoadedState(loadedZadelka5: loadedZadelka5List));
    } catch (_) {
      emit(ProizvodstvoErrorState());
    }
  }
}
