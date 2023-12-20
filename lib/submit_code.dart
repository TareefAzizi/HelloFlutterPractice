void printWordsAndCharacters(String text) {
  // Splitting the text into words
  List<String> words = text.split(' ');

  for (String word in words) {
    print('Word: $word'); // Print each word
    for (int i = 0; i < word.length; i++) {
      print('Character: ${word[i]}'); // Print each character in the word
    }
  }
}

void main() {
  String exampleText = "This is a sample text";
  printWordsAndCharacters(exampleText);
}
