import 'dart:math';

class WordleGameModel {
  int rowId = 0;
  int letterId = 0;

  String game_message = "";
  String game_guess = "";
  static List<String> word_list = [
    "WORLD",
    "FIGHT",
    "BRAIN",
    "PLANE",
    "SPACE",
    "ROCCK",
    "PAPER",
    "SCISS",
    "LIZAR",
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
  void initGame() {
    final random = Random();
    int index = random.nextInt(word_list.length);
    game_guess = word_list[index];
  }

  // game insertion
  void insertWord(int i, Letter word) {
    wordleBoard[rowId][i] = word;
  }

  bool checkWord(String word) {
    return word_list.contains(word);
  }
}

class Letter {
  String? letter;
  int? code;
  Letter(this.letter, this.code);
}
