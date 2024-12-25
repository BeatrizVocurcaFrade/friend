import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
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
  Section(title: '🎵 Músicas que definem nossa amizade'),
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
          label: Text('🎁 Abra o seu presente!')),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SplashScreen()),
          ),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text(
          'Bem-vindoo 🌟',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
              child: buildSectionHeader('✨ Faça o Quiz do Melhor Amigo', true),
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
              child: buildSectionHeader('📸 Galeria de Memórias', false),
            ),
            buildCarousel(memorias, context),
            const SizedBox(height: 16),
            buildSectionHeader('📚 Livros que você quer ler...', false),
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
              child: ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    sections[0].isExpanded = !sections[0].isExpanded;
                  });
                  if (!sections[0].isExpanded) {
                    _audioPlayer.stop();
                  }
                },
                children: sections.map<ExpansionPanel>((Section section) {
                  return ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildSectionHeader(section.title, false),
                      );
                    },
                    body: buildMusicCarousel(_audioPlayer),
                    isExpanded: section.isExpanded,
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

Widget buildSectionHeader(String title, bool isToTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
