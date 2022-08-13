import 'dart:async';

import 'package:rutas_app/app/models/game_model.dart';

class _KeyService {
  final _gameModel = WordleGameModel();
  WordleGameModel get gameModel => _gameModel;

  final _stremController = StreamController<WordleGameModel>.broadcast();
  Stream<WordleGameModel> get keyStrem => _stremController.stream;
  // final pressKey = Letter(letter, code);
  void cargarKey(WordleGameModel model, Letter letter) {
    _gameModel.insertWord(_gameModel.letterId, letter);
    _gameModel.letterId++;
    _stremController.add(model);
  }

  void delKey(WordleGameModel model, Letter letter) {
    _gameModel.insertWord(_gameModel.letterId - 1, letter);
    _gameModel.letterId--;
    _stremController.add(model);
  }

  void initKeyService() {
    _gameModel.initGame();
    _stremController.add(_gameModel);
  }

  void submitKey(WordleGameModel model) {
    if (_gameModel.letterId <= 5) {
      final filasKey = _gameModel.wordleBoard[_gameModel.rowId];
      final word = filasKey.map((e) => e.letter).join();

      if (_gameModel.checkWord(word) && word == _gameModel.game_guess) {
        _gameModel.game_message = "🎉🎊 Correcto 🎊🎉";
        filasKey.forEach((e) => e.code = 1);
      } else {
        for (int i = 0; i < word.length; i++) {
          String c = word[i];
          /* si la letra esta en la palabra random */
          if (_gameModel.game_guess.contains(c)) {
            /* si la letra esta en la poscion correcta */
            _gameModel.game_guess[i] == c
                ? filasKey[i].code = 1
                : filasKey[i].code = 2;
          }
        }
        _gameModel.game_message = "Incorrecto";
      }

      _gameModel.letterId = 0;
      _gameModel.rowId++;
    } else {
      _gameModel.game_message = "Game Over";
      _gameModel.game_over = true;
    }
    _stremController.add(model);
  }
}

final keyService = _KeyService();
