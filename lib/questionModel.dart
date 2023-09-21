class question {
  final String questionText;
  final List<answer> answerList;

  question(this.questionText, this.answerList);
}

class answer {
  final String answerText;
  final bool isCorrect;

  answer(this.answerText, this.isCorrect);
}

List<question> getQuestions() {
  List<question> list = [];
  //Agregamos las preguntas y respuestas
  list.add(question('¿Cuál es la capital de Filipinas?', [
    answer('Manila', true),
    answer('Tirana', false),
    answer('Berlin', false),
    answer('Kabul', false),
  ]));

  list.add(question('¿Cuál es el río más caudaloso del mundo?', [
    answer('Yangtsé', false),
    answer('Orinoco', false),
    answer('Amazonas', true),
    answer('Paraná', false),
  ]));

  list.add(question('¿Cuál es la montaña más alta de Europa?', [
    answer('Monte Elbrús', true),
    answer('Mont Blanc', false),
    answer('Everest', false),
    answer('Monte Dij-Tau', false),
  ]));

  list.add(question('¿En qué país se encuentra el pico Aconcagua?', [
    answer('Chile', false),
    answer('Argentina', true),
    answer('Perú', false),
    answer('Ecuador', false),
  ]));

  return list;
}
