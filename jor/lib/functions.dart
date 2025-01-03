import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/services.dart';

import 'package:url_launcher/url_launcher.dart';

import 'dart:html' as html;

Future<void> downloadAndOpenPdf(
    BuildContext context, String assetPath, String fileName) async {
  try {
    // Carregar o arquivo PDF do asset
    final ByteData data = await rootBundle.load(assetPath);
    final bytes = data.buffer.asUint8List();

    // Criar o Blob para o arquivo
    final blob = html.Blob([Uint8List.fromList(bytes)]);

    // Criar uma URL para o Blob
    final url = html.Url.createObjectUrlFromBlob(blob);

    // Criar um link e abrir em uma nova aba
// Simula o clique para abrir o PDF

    // Revogar a URL após o uso
    html.Url.revokeObjectUrl(url);

    // Mostrar mensagem de sucesso
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('PDF salvo com sucesso!'),
        backgroundColor: Colors.green,
      ),
    );
  } catch (e) {
    // Mensagem de erro caso algo falhe
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Erro ao abrir o PDF: $e'),
        backgroundColor: Colors.red,
      ),
    );
  }
}

Future<void> playMusic(String musicAsset, AudioPlayer audioPlayer) async {
  await audioPlayer.play(AssetSource(musicAsset));
}

void redirectToSite() async {
  final Uri uri = Uri.parse("https://amz.onl/3Ba6m3Z");
  try {
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      debugPrint("Não foi possível abrir a URL: $uri");
    }
  } catch (e) {
    debugPrint("Erro ao lançar a URL: $e");
  }
}
