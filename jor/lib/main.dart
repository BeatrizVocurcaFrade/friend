import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:jor/entity/memoria.dart';
import 'package:jor/splash.dart';

void main() {
  runApp(const CelebratingYouApp());
}

class CelebratingYouApp extends StatelessWidget {
  const CelebratingYouApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Celebrando Você',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Color(0xFFD1C4E9),
        textTheme: ThemeData.light().textTheme.apply(
              fontFamily: 'Nunito',
            ),
      ),
      home: const SplashScreen(),
    );
  }
}

class MemoryCarousel extends StatefulWidget {
  const MemoryCarousel({super.key});

  @override
  State<MemoryCarousel> createState() => _MemoryCarouselState();
}

class _MemoryCarouselState extends State<MemoryCarousel> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _playMusic();
  }

  Future<void> _playMusic() async {
    await _audioPlayer.play(AssetSource('fofa.mp3'));
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
      body: Stack(
        children: [
          PageView.builder(
            itemCount: memorias.length,
            itemBuilder: (context, index) {
              final memory = memorias[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    memory.image,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withValues(alpha: 0.5),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        memory.message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              blurRadius: 10,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                _audioPlayer.stop();
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
