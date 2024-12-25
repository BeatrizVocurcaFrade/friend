var memorias = [
  Memoria.image(
      image: 'assets/1.jpeg',
      message:
          "Dia em que fomos para a baladinha com o menor número de gays na história"),
  Memoria.image(
      image: 'assets/2.jpeg',
      message:
          "Não lembro onde estávamos, mas coloquei essa porque eu tinha poucas fotos"),
  Memoria.image(
      image: 'assets/3.jpeg', message: "O dia do nosso primeiro beijo"),
  Memoria.image(image: 'assets/4.jpeg', message: "Nosso date romântico"),
  Memoria.image(image: 'assets/5.jpeg', message: "Combinando como um casal"),
  Memoria.image(
      image: 'assets/6.jpeg',
      message: "Um dia caótico, mas que rendeu boas memórias"),
  Memoria.image(image: 'assets/7.jpeg', message: "Saudades daquele carnaval"),
  Memoria.image(
      image: 'assets/8.jpeg', message: "Devíamos ter uns 11 anos nessa foto"),
  Memoria.image(
      image: 'assets/9.jpeg',
      message: "Coloquei essa só porque eu tô gostosa nessa foto"),
  Memoria.image(
      image: 'assets/10.jpeg',
      message: "Tentamos tirar uma boa foto, mas esse dia não ajudou"),
  Memoria.image(
      image: 'assets/11.jpeg',
      message: "Combinandinho na praia, bem estilo casal"),
  Memoria.image(
      image: 'assets/12.jpeg',
      message: "Combinandinho na praia, bem estilo casal"),
  Memoria.image(
      image: 'assets/13.jpeg',
      message: "Combinandinho na praia, bem estilo casal")
];
var livros = [
  Memoria.book(
      image: 'assets/a.jpg', url: "assets/a.pdf", message: "AgntMiraNoAmor"),
  Memoria.book(
      image: 'assets/b.jpg',
      url: "assets/b.epub",
      message: "TalvezVceDevaConversar"),
  Memoria.book(
      image: 'assets/c.jpg', url: "assets/d.pdf", message: "NPediNoVazio"),
  Memoria.book(
      image: 'assets/d.jpg', url: "assets/c.pdf", message: "AgntMiraNoAmor"),
];

class Memoria {
  String image;
  String message;
  String url;
  bool isDownload;
  Memoria.image(
      {required this.image,
      required this.message,
      this.url = '',
      this.isDownload = false});
  Memoria(
      {required this.image,
      required this.message,
      this.url = '',
      this.isDownload = false});
  Memoria.book(
      {required this.image,
      required this.message,
      required this.url,
      this.isDownload = true});
}
