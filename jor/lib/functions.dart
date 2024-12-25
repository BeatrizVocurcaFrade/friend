import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';

Future<void> playMusic(String musicAsset, AudioPlayer audioPlayer) async {
  await audioPlayer.play(AssetSource(musicAsset));
}

Future<void> downloadAndOpenPdf(
    BuildContext context, String assetPath, String fileName) async {
  try {
    // Carregar o arquivo PDF dos assets
    final ByteData data = await rootBundle.load(assetPath);

    // Obter o caminho do diretório temporário
    final Directory tempDir = await getTemporaryDirectory();
    final String filePath = '${tempDir.path}/$fileName';

    // Salvar o PDF localmente
    final File file = File(filePath);
    await file.writeAsBytes(data.buffer.asUint8List());

    // Mostrar mensagem de sucesso
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('PDF salvo com sucesso! Abrindo...'),
        backgroundColor: Colors.green,
      ),
    );

    // Abrir o arquivo PDF
    OpenFilex.open(filePath);
  } catch (e) {
    // Mostrar mensagem de erro
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Erro ao abrir o PDF: $e'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
