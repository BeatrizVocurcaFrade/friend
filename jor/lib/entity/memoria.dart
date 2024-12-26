var memorias = [
  Memoria.image(
      image: 'assets/13.jpeg',
      message: "Te amo, mas essa foto tinha que vir primeiro kkkkk"),
  Memoria.image(
      image: 'assets/12.jpeg', message: "Nosso último rolê do ano..."),
  Memoria.image(
      image: 'assets/9.jpeg',
      message: "Coloquei só porque eu tô gostosa nessa foto"),
  Memoria.image(
      image: 'assets/1.jpeg',
      message:
          "Dia em que fomos para a baladinha com o menor número de gays na história"),
//   Memoria.image(
//       image: 'assets/2.jpeg',
//       message:
//           "Não lembro onde estávamos, mas coloquei essa porque eu tinha poucas fotos"),
  Memoria.image(
      image: 'assets/3.jpeg', message: "O dia do nosso primeiro beijo"),
  Memoria.image(
      image: 'assets/4.jpeg', message: "Um dos nossos dates românticos..."),
  Memoria.image(image: 'assets/5.jpeg', message: "Combinando como um casal"),
  Memoria.image(
      image: 'assets/6.jpeg',
      message: "Carnaval caótico, desse ano vai ser mais ainda🙏🙏"),
  Memoria.image(image: 'assets/7.jpeg', message: "Saudades daquele carnaval"),
  Memoria.image(
      image: 'assets/8.jpeg', message: "Devíamos ter uns 11 anos nessa foto"),
  Memoria.image(
      image: 'assets/10.jpeg', message: "Vivendo nossa solterisse eterna kkkk"),
  Memoria.image(image: 'assets/11.jpeg', message: "Combinandinhos na praia"),
];
var livros = [
  Memoria.book(
      image: 'assets/a.jpg', url: "assets/a.pdf", message: "AgntMiraNoAmor"),
  Memoria.book(
      image: 'assets/b.jpg',
      url: "assets/b.epub",
      message: "TalvezVceDevaConversar"),
  Memoria.book(
      image: 'assets/c.jpg', url: "assets/d.pdf", message: "NPiseNoVazio"),
  Memoria.book(
      image: 'assets/d.jpg', url: "assets/c.pdf", message: "DesigningYourLife"),
  Memoria.net(
      image: 'assets/f.jpg', url: "https://amz.onl/3Ba6m3Z", message: "Boteco"),
];

class Memoria {
  String image;
  String message;
  String url;
  bool isDownload;
  bool isNetwork;
  Memoria.image(
      {required this.image,
      required this.message,
      this.url = '',
      this.isNetwork = false,
      this.isDownload = false});
  Memoria.net(
      {required this.image,
      required this.message,
      this.url = '',
      this.isNetwork = true,
      this.isDownload = false});
  Memoria(
      {required this.image,
      required this.message,
      this.url = '',
      this.isNetwork = false,
      this.isDownload = false});
  Memoria.book(
      {required this.image,
      required this.message,
      required this.url,
      this.isNetwork = false,
      this.isDownload = true});
}
