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
  list.add(question('Cuantos son 1000 gramos?', [
    answer('1 Kg', true),
    answer('10 Kg', false),
    answer('0,5 Kg', false),
    answer('100 Kg', false),
  ]));

  list.add(question('Cuantos son 100 gramos?', [
    answer('1 Kg', false),
    answer('10 Kg', false),
    answer('0,1 Kg', true),
    answer('100 Kg', false),
  ]));

  list.add(question('Cuantos son 10 gramos?', [
    answer('1 Kg', false),
    answer('10 Kg', false),
    answer('0,01 Kg', true),
    answer('100 Kg', false),
  ]));

  list.add(question('Cuantos son 10000 gramos?', [
    answer('1 Kg', false),
    answer('10 Kg', true),
    answer('0,5 Kg', false),
    answer('100 Kg', false),
  ]));

  return list;
}
