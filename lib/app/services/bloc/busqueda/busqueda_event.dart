part of 'busqueda_bloc.dart';

@immutable
abstract class BusquedaEvent {}

class OnShowIcon extends BusquedaEvent {}

class OnHideIcon extends BusquedaEvent {}
