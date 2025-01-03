class Question {
  String question;
  String answer;
  List<String> options;
  Question(
      {required this.answer, required this.options, required this.question});
}

var quizQuestions = [
  Question(
    answer: 'Com certeza',
    options: ['Sim', 'Claro', 'Com certeza'],
    question: 'Se não casarmos até os 30 anos, você se casaria comigo?',
  ),
  Question(
    answer: 'Todas as opções acima',
    options: [
      'Planejar o próximo rolê do final de semana',
      'Fofocar de todos os nossos dates da semana',
      'Falar como somos os únicos românticos em bh',
      'Todas as opções acima'
    ],
    question: 'Qual assunto é mais provável que a gnt converse no rolê?',
  ),
  Question(
    answer: 'Dois vibradores',
    options: ['Flores', 'Dois vibradores', 'Chocolate', 'Perfume'],
    question: 'Qual foi o presente que você me deu que eu mais gostei?',
  ),
  Question(
    answer: 'Fazer um date com sua melhor amiga e escutar ela falar de mulher',
    options: [
      'Fazer um date com sua melhor amiga e escutar ela falar de mulher',
      'Comer escargot com francês e tomar champagne de verdade',
      'Sair com um padrão para um restaurante superfaturado e depois ir para o barco dele',
      'Dar uma voltinha numa bizz com um gringo em Malta'
    ],
    question: 'Qual a sua ideia de date ideal?',
  ),
  Question(
    answer: 'Arranjaria um date com um playboy no grindr',
    options: [
      'Iria ao museu',
      'Daria uma volta na praça sete',
      'Arranjaria um date com um playboy no grindr',
    ],
    question:
        'Se você estivesse a toa em um final de semana, o que eu acho que você faria?',
  ),
  Question(
    answer: 'Ficar assistindo kim kardashian e comendo algum doce importado',
    options: [
      'Ficar olhando as estrelas',
      'Ficar assistindo kim kardashian e comendo algum doce importado',
      'Fazer uma maratona de filmes de terror',
      'Ficar cozinhando e tentando novas receitas'
    ],
    question: 'Das opções abaixo, qual que eu acho que você mais faria?',
  ),
  Question(
    answer: 'Um francês grosso de aparência duvidosa',
    options: [
      'Um cara inteletual',
      'Uma gay afeminada',
      'Um francês grosso de aparência duvidosa',
      'Um cara padrão, esportista'
    ],
    question: 'Qual eu acho que é seu tipo?',
  ),
  Question(
    answer: 'Todas as opções acima',
    options: [
      'Psicologia',
      'Francês, para conhecer um novo amor',
      'Moda',
      'Como virar aeromoço',
      'Todas as opções acima'
    ],
    question: 'Se fosse para aprender algo novo, o que eu acho que seria?',
  ),
];
