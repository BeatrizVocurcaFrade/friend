var memorias = [
  Memoria('assets/1.jpeg',
      "Dia em que fomos para a baladinha com o menor número de gays na história"),
  Memoria('assets/2.jpeg',
      "Não lembro onde estávamos, mas coloquei essa porque eu tinha poucas fotos"),
  Memoria('assets/3.jpeg', "O dia do nosso primeiro beijo"),
  Memoria('assets/4.jpeg', "Nosso date romântico"),
  Memoria('assets/5.jpeg', "Combinando como um casal"),
  Memoria('assets/6.jpeg', "Um dia caótico, mas que rendeu boas memórias"),
  Memoria('assets/7.jpeg', "Saudades daquele carnaval"),
  Memoria('assets/8.jpeg', "Devíamos ter uns 11 anos nessa foto"),
  Memoria('assets/9.jpeg', "Coloquei essa só porque eu tô gostosa nessa foto"),
  Memoria(
      'assets/10.jpeg', "Tentamos tirar uma boa foto, mas esse dia não ajudou"),
  Memoria('assets/11.jpeg', "Combinandinho na praia, bem estilo casal")
];

class Memoria {
  String image;
  String message;
  Memoria(this.image, this.message);
}
