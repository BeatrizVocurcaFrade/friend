import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:jor/entity/memoria.dart';
import 'package:jor/entity/musica.dart';
import 'package:jor/main.dart';
import 'package:jor/quiz.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

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

  Widget _buildMusicCarousel(AudioPlayer audioPlayer) {
    return SizedBox(
      height: 130,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildMusicItem(musicas[0], audioPlayer),
          _buildMusicItem(musicas[0], audioPlayer),
          _buildMusicItem(musicas[0], audioPlayer),
        ],
      ),
    );
  }

  Widget _buildPhotoCarousel() {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildPhotoItem(memorias[0]),
          _buildPhotoItem(memorias[0]),
          _buildPhotoItem(memorias[0]),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: color,
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.white),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(color: Colors.white70),
        ),
        onTap: onTap,
      ),
    );
  }

  Future<void> _playMusic(String musicAsset, AudioPlayer audioPlayer) async {
    await audioPlayer.play(AssetSource(musicAsset));
  }

  Widget _buildMusicItem(Music music, AudioPlayer audioPlayer) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: () {
            _playMusic(music.music, audioPlayer);
          },
          child: Image.asset(
            music.image,
            fit: BoxFit.cover,
            width: 100,
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoItem(Memoria memoria) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          memoria.image,
          fit: BoxFit.cover,
          width: 150,
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bem-vindo 🌟',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionHeader('🎵 Playlist Favorita'),
          _buildMusicCarousel(_audioPlayer),
          _buildSectionHeader('✨ Quiz do Melhor Amigo'),
          _buildCard(
            title: 'Descubra Memórias Únicas',
            description: 'Responda e explore nosso passado.',
            icon: Icons.quiz,
            color: Colors.deepPurple,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const QuizPage()),
              );
            },
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MemoryCarousel()),
              );
            },
            child: _buildSectionHeader('📸 Galeria de Memórias'),
          ),
          _buildPhotoCarousel(),
          _buildSectionHeader('🎁 Surpresa Especial'),
          _buildCard(
            title: 'Clique para abrir seu presente',
            description: 'Um mimo só para você!',
            icon: Icons.card_giftcard,
            color: Colors.deepPurple,
            onTap: () {
              // Função surpresa
            },
          ),
        ],
      ),
    );
  }
}
