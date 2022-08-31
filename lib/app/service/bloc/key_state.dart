part of 'key_bloc.dart';

@immutable
class KeyInitial {
  final WordleGameModel? gameModel;

  KeyInitial({WordleGameModel? gameModel})
      : gameModel = gameModel ?? WordleGameModel();

  /* crear copia del estado */
  KeyInitial copyWith() => KeyInitial(
        gameModel: gameModel,
      );
}
