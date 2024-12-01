var musicas = [
  Music('assets/linn.jpg', "linn.mp3"),
  Music('assets/val.jpg', "val.m4a"),
];

class Music {
  String image;
  String music;
  Music(this.image, this.music);
}
