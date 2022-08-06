import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'busqueda_event.dart';
part 'busqueda_state.dart';

class BusquedaBloc extends Bloc<BusquedaEvent, BusquedaState> {
  BusquedaBloc() : super(BusquedaState()) {
    on<OnShowIcon>((event, emit) {
      emit(state.copyWith(seleccionManual: true));
    });
    on<OnHideIcon>((event, emit) {
      emit(state.copyWith(seleccionManual: false));
    });
  }
}
