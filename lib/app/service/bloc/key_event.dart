part of 'key_bloc.dart';

@immutable
abstract class KeyEvent {}

class AddKey extends KeyEvent {
  Letter letter;
  AddKey(this.letter);
}

class DelKey extends KeyEvent {}

class SubmitKey extends KeyEvent {}
