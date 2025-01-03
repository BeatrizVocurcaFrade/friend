import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:jor/entity/memoria.dart';
import 'package:jor/entity/musica.dart';
import 'package:jor/functions.dart';
import 'package:jor/main.dart';
import 'package:jor/quiz/quiz.dart';
import 'package:jor/splash.dart';
import 'package:jor/voucher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class Section {
  String title;
  bool isExpanded;

  Section({required this.title, this.isExpanded = false});
}

List<Section> sections = [
  Section(title: ' Nosssas músicas'),
];

class _HomePageState extends State<HomePage> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const VoucherPage()),
            );
          },
          label: Row(
            children: [
              Image.asset(
                'assets/svg/present.png', // Caminho para o seu arquivo SVG
                height: 30, // Ajuste o tamanho conforme necessário
                width: 30, // Ajuste o tamanho conforme necessário
              ),
              Text(' Abra o seu presente!'),
            ],
          )),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SplashScreen()),
          ),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/svg/rainbow.png', // Caminho para o seu arquivo SVG
                height: 30, // Ajuste o tamanho conforme necessário
                width: 30, // Ajuste o tamanho conforme necessário
              ),
              SizedBox(width: 10),
              Text(
                'Bem-vindoo',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(width: 10),
              Image.asset(
                'assets/svg/rainbow.png', // Caminho para o seu arquivo SVG
                height: 30, // Ajuste o tamanho conforme necessário
                width: 30, // Ajuste o tamanho conforme necessário
              ),
            ],
          ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 5,
      ),
      body: GestureDetector(
        onTap: () {
          _audioPlayer.stop();
        },
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            GestureDetector(
              onTap: () {
                _audioPlayer.stop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizPage()),
                );
              },
              child: buildSectionHeader(
                  'assets/svg/sparkles.png', ' Teste da Amizade', true),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                _audioPlayer.stop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MemoryCarousel()),
                );
              },
              child: buildSectionHeader(
                  'assets/svg/camera.png', ' Galeria de Memórias', false),
            ),
            GestureDetector(
                onTap: () {
                  _audioPlayer.stop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MemoryCarousel()),
                  );
                },
                child: buildCarousel(memorias, context)),
            const SizedBox(height: 16),
            buildSectionHeader(
                'assets/svg/book.png', ' Livros que você quer ler...', false),
            buildCarousel(livros, context),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                setState(() {
                  sections[0].isExpanded = !sections[0].isExpanded;
                });
                if (!sections[0].isExpanded) {
                  _audioPlayer.stop();
                }
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 4,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        sections[index].isExpanded =
                            !sections[index].isExpanded;
                      });
                      if (!sections[index].isExpanded) {
                        _audioPlayer.stop();
                      }
                    },
                    children: sections.map<ExpansionPanel>((Section section) {
                      return ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: buildSectionHeader(
                                'assets/svg/music.png', section.title, false),
                          );
                        },
                        body: buildMusicCarousel(_audioPlayer),
                        isExpanded: section.isExpanded,
                        canTapOnHeader: true,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }
}

Widget buildSectionHeader(String svgUrl, String title, bool isToTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          svgUrl, // Caminho para o seu arquivo SVG
          height: 30, // Ajuste o tamanho conforme necessário
          width: 30, // Ajuste o tamanho conforme necessário
        ),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        Visibility(
            visible: isToTap, child: Icon(Icons.arrow_forward_ios_outlined))
      ],
    ),
  );
}

Widget buildMusicCarousel(AudioPlayer audioPlayer) {
  return SizedBox(
    height: 140,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children:
          musicas.map((music) => buildMusicItem(music, audioPlayer)).toList(),
    ),
  );
}

Widget buildMusicItem(Music music, AudioPlayer audioPlayer) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GestureDetector(
        onTap: () => playMusic(music.music, audioPlayer),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              music.image,
              fit: BoxFit.cover,
              width: 120,
            ),
            Container(
              color: Colors.black54,
              child: const Icon(
                Icons.play_circle_fill,
                color: Colors.white,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildCarousel(List<Memoria> listM, BuildContext context) {
  return SizedBox(
    height: 200,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children:
          listM.map((memoria) => buildPhotoItem(memoria, context)).toList(),
    ),
  );
}

Widget buildPhotoItem(Memoria memoria, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (memoria.isDownload) {
        downloadAndOpenPdf(
          context,
          memoria.url,
          'meu_arquivo_${memoria.message}',
        );
      } else if (memoria.isNetwork) {
        // redirectToSite();
        Clipboard.setData(ClipboardData(text: memoria.url.toString()));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Link para ler o livro copiado com sucesso...'),
            backgroundColor: Colors.green,
          ),
        );
      }
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          memoria.image,
          fit: BoxFit.cover,
          width: 150,
        ),
      ),
    ),
  );
}
