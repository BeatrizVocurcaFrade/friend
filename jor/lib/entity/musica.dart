var musicas = [
  Music('assets/linn.png', "linn.mp3"),
  Music('assets/val.png', "val.m4a"),
  Music('assets/irmas.jpg', "irmas.m4a"),
];

class Music {
  String image;
  String music;
  Music(this.image, this.music);
}
