class Question {
  String question;
  String answer;
  List<String> options;
  Question(
      {required this.answer, required this.options, required this.question});
}

var quizQuestions = [
  Question(
    answer: 'Fazer um date com sua melhor amiga e escutar ela falar de mulher',
    options: [
      'Comer escargot com francês e tomar champagne de verdade',
      'Sair com um padrão para um restaurante superfaturado e depois ir para o barco dele',
      'Fazer um date com sua melhor amiga e escutar ela falar de mulher',
      'Dar uma voltinha numa bizz com um gringo em Malta'
    ],
    question: 'Qual a sua ideia de date ideal?',
  ),
  Question(
    answer: 'Claro',
    options: ['Sim', 'Claro'],
    question: 'Se não casarmos até os 30 anos, você se casaria comigo?',
  ),
  Question(
    answer: 'Vibrador',
    options: ['Vibrador', 'Chocolate', 'Flores', 'Perfume'],
    question: 'Qual presente você me deu que foi o mais inesperado?',
  ),
  Question(
    answer: 'Dua Lipa',
    options: ['Dua Lipa', 'Lady Gaga', 'Beyoncé', 'Rihanna'],
    question: 'Quem eu acho que é o seu artista favorito?',
  ),
  Question(
    answer: 'Arranjaria um date no grindr',
    options: [
      'Se perderia por 1h',
      'Chamaria o Uber',
      'Arranjaria um date no grindr',
      'Pediria ajuda para um estranho'
    ],
    question:
        'Se você estivesse perdido na cidade, o que eu acho que você faria?',
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
    answer: 'Ir para um show do seu artista favorito',
    options: [
      'Fazer um TikTok de dança',
      'Correr uma maratona',
      'Ficar dormindo o dia todo',
      'Ir para um show do seu artista favorito'
    ],
    question:
        'Se você tivesse que fazer algo totalmente espontâneo, o que eu acho que seria seria?',
  ),
  Question(
    answer: 'Francês, para conhecer um novo amor',
    options: [
      'Uma nova dança',
      'Francês, para conhecer um novo amor',
      'Filosofia',
      'Física quântica'
    ],
    question: 'Se fosse para aprender algo novo, o que eu acho que seria?',
  ),
];
