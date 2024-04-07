double coincidenceWords(String text1, String text2) {
  // Removemos los signos de puntuación y dividimos las cadenas en palabras
  List<String> words1 = removePunctuationAndSplit(text1);
  List<String> words2 = removePunctuationAndSplit(text2);

  // Calculamos el porcentaje de coincidencias entre las palabras
  double matchingPercentage = calculateMatchingPercentage(words1, words2);

  return matchingPercentage; // Devolvemos el porcentaje de coincidencia
}

List<String> removePunctuationAndSplit(String text) {
  // Modificamos la expresión regular para incluir los apostrofes como separadores de palabras
  final RegExp punctuationRegex = RegExp(r'[\W_]+');

  // Removemos los signos de puntuación y dividimos el texto en palabras
  return text.replaceAll(punctuationRegex, ' ').toLowerCase().split(' ');
}

double calculateMatchingPercentage(List<String> words1, List<String> words2) {
  Set<String> uniqueWords =
      {}; // Conjunto para almacenar las palabras únicas de ambas cadenas

  // Agregamos todas las palabras de ambas cadenas al conjunto de palabras únicas
  uniqueWords.addAll(words1);
  uniqueWords.addAll(words2);

  int totalUniqueWords = uniqueWords.length;
  int commonWordsCount = 0;

  // Contamos las palabras comunes entre ambas cadenas
  for (String word in uniqueWords) {
    if (words1.contains(word) && words2.contains(word)) {
      commonWordsCount++;
    }
  }

  // Manejamos el caso cuando no hay palabras únicas
  if (totalUniqueWords == 0) {
    throw Exception("No hay palabras únicas para comparar.");
  }

  // Calculamos el porcentaje de coincidencia
  double percentage = (commonWordsCount / totalUniqueWords) * 100;

  return percentage;
}
