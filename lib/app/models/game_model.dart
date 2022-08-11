import 'dart:math';

class WordleGameModel {
  int _rowId = 0;
  int _letterId = 0;

  static String game_message = "";
  static String _game_guess = "";
  static List<String> _word_list = [
    "WORLD",
    "FIGHT",
    "BRAIN",
    "PLANE",
    "SPACE",
    "ROCK",
    "PAPER",
    "SCISSORS",
    "LIZARD",
    "SPOCK",
    "ROBOT",
  ];

  static const game_over = false;
  // setting game
  static List<Letter> wordRow = List.generate(5, (index) => Letter("", 0));
  // setting gameboard
  List<List<Letter>> wordleBoard =
      List.generate(5, (index) => List.generate(5, (index) => Letter("", 0)));
  // game basic function
  static void initGame() {
    final random = Random();
    int index = random.nextInt(_word_list.length);
    _game_guess = _word_list[index];
  }

  // game insertion
  void insertWord(int i, Letter word) {
    wordleBoard[_rowId][i] = word;
  }

  bool checkWord(String word) {
    return _word_list.contains(word);
  }
}

class Letter {
  String? letter;
  int? code;
  Letter(this.letter, this.code);
}
