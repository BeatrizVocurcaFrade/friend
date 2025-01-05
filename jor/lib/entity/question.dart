class Question {
  String question;
  List<String> answer;
  List<String> options;
  Question(
      {required this.answer, required this.options, required this.question});
}

var quizQuestions = [
  Question(
    answer: [
      'Opção 1',
    ],
    options: ['Opção 1', 'Opção 2', 'Opção 3'],
    question: 'Pergunta 1?',
  ),
  Question(
    answer: [
      'Opção 2',
    ],
    options: ['Opção 1', 'Opção 2', 'Opção 3'],
    question: 'Pergunta 1?',
  ),
  Question(
    answer: [
      'Opção 3',
    ],
    options: ['Opção 1', 'Opção 2', 'Opção 3'],
    question: 'Pergunta 1?',
  ),
  // Question(
  //   answer: [
  //     'Todas as opções acima',
  //   ],
  //   options: [
  //     'Filosofar como ser sapatão é bem melhor que ser gay',
  //     'Fofocar de todos os nossos dates da semana',
  //     'Planejar nossa vida em outro país',
  //     'Todas as opções acima',
  //   ],
  //   question: 'Qual assunto é mais provável que a gnt converse no rolê?',
  // ),
  // Question(
  //   answer: [
  //     'Dois vibradores',
  //   ],
  //   options: ['Flores', 'Dois vibradores', 'Chocolate', 'Perfume'],
  //   question: 'Qual foi o presente que você me deu que eu mais gostei?',
  // ),
  // Question(
  //   answer: [
  //     'Eu',
  //     'Você',
  //   ],
  //   options: ['Eu', 'Você'],
  //   question: 'Quem é mais provável que se divorcie?',
  // ),
  // Question(
  //   answer: [
  //     'Fazer um date com sua melhor amiga e escutar ela falar de mulher',
  //   ],
  //   options: [
  //     'Comer escargot com francês e tomar champagne de verdade',
  //     'Dar uma voltinha numa bizz com um gringo em Malta',
  //     'Fazer um date com sua melhor amiga e escutar ela falar de mulher',
  //     'Sair com um padrão para um restaurante superfaturado e depois ir para o barco dele',
  //   ],
  //   question: 'Qual a sua ideia de date ideal?',
  // ),
  // Question(
  //   answer: [
  //     'Arranjaria um date com um velho rico no ifood laranja',
  //   ],
  //   options: [
  //     'Iria ao museu',
  //     'Daria uma volta na praça sete',
  //     'Arranjaria um date com um velho rico no ifood laranja',
  //   ],
  //   question:
  //       'Se você estivesse a toa em um final de semana, o que eu acho que você faria?',
  // ),
  // Question(
  //   answer: [
  //     'Ficar assistindo kim kardashian e comendo algum doce importado',
  //   ],
  //   options: [
  //     'Ficar olhando as estrelas',
  //     'Fazer uma maratona de filmes de terror',
  //     'Ficar assistindo kim kardashian e comendo algum doce importado',
  //     'Ficar cozinhando e tentando novas receitas',
  //   ],
  //   question: 'Das opções abaixo, qual que eu acho que você mais faria?',
  // ),
  // Question(
  //   answer: [
  //     'Um francês grosso de aparência duvidosa',
  //   ],
  //   options: [
  //     'Um cara inteletual',
  //     'Uma gay afeminada',
  //     'Um francês grosso de aparência duvidosa',
  //     'Um cara padrão, esportista',
  //   ],
  //   question: 'Qual eu acho que é seu tipo?',
  // ),
  // Question(
  //   answer: [
  //     'Todas as opções acima',
  //   ],
  //   options: [
  //     'Psicologia',
  //     'Francês',
  //     'Moda',
  //     'Como entrar na emirates',
  //     'Todas as opções acima',
  //   ],
  //   question: 'Se fosse para aprender algo novo, o que eu acho que seria?',
  // ),
];
