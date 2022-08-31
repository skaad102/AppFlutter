import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/game_model.dart';

part 'key_event.dart';
part 'key_state.dart';

class KeyBloc extends Bloc<KeyEvent, KeyInitial> {
  KeyBloc() : super(KeyInitial()) {
    on<KeyEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AddKey>((event, emit) {
      _addKey(event, emit);
    });
    on<DelKey>((event, emit) {
      _delKey(event, emit);
    });
    on<SubmitKey>((event, emit) {
      _submitKey(event, emit);
    });
  }

  void _addKey(AddKey event, Emitter<KeyInitial> emit) {
    if (state.gameModel!.letterId < 5 && state.gameModel!.rowId < 5) {
      state.gameModel!.insertWord(state.gameModel!.letterId, event.letter);
      state.gameModel!.letterId++;
      emit(state.copyWith());
    }
  }

  void _delKey(DelKey event, Emitter<KeyInitial> emit) {
    if (state.gameModel!.letterId > 0) {
      state.gameModel!.letterId--;
      state.gameModel!.insertWord(state.gameModel!.letterId, Letter("", 0));
      emit(state.copyWith());
    }
  }

  void _submitKey(SubmitKey event, Emitter<KeyInitial> emit) {
    final gameModel = state.gameModel!;
    if (gameModel.rowId < 5) {
      if (gameModel.letterId == 5) {
        final word =
            gameModel.wordleBoard[gameModel.rowId].map((e) => e.letter).join();
        // gameModel.wordleBoard[gameModel.rowId].join();
        /* si existe la palabra en el listado  */
        if (gameModel.checkWord(word)) {
          gameModel.game_message = "Correct";
          gameModel.wordleBoard[gameModel.rowId].forEach((e) {
            e.code = 1;
          });
        } else {
          for (var i = 0; i < word.length; i++) {
            String c = word[i];
            if (gameModel.game_guess.contains(c)) {
              gameModel.game_guess[i] == c
                  ? gameModel.wordleBoard[gameModel.rowId][i].code = 1
                  : gameModel.wordleBoard[gameModel.rowId][i].code = 2;
            }
          }
          gameModel.game_message = "Incorrect";
        }
        gameModel.letterId = 0;
        gameModel.rowId++;
        emit(state.copyWith());
      }
    }
  }

  void iniciarModel() {
    state.gameModel!.initGame();
  }
}
