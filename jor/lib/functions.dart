import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'package:url_launcher/url_launcher.dart';

import 'dart:html' as html;
import 'package:open_file/open_file.dart';
import 'dart:typed_data';

Future<void> downloadAndOpenPdf(
    BuildContext context, String assetPath, String fileName) async {
  try {
    // Carregar o arquivo PDF do asset
    final ByteData data = await rootBundle.load(assetPath);
    final bytes = data.buffer.asUint8List();
    if (kIsWeb) {
      // Mostrar o PDF diretamente no app (sem abrir nova aba)
      final blob = html.Blob([Uint8List.fromList(bytes)]);
      final url = html.Url.createObjectUrlFromBlob(blob);

      // Revogar a URL após o uso
      html.Url.revokeObjectUrl(url);
    } else
    // Para dispositivos móveis (APK)
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android) {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$fileName');
      await file.writeAsBytes(bytes);

      // Abrir o arquivo PDF no visualizador nativo
      final result = await OpenFile.open(file.path);
      if (result.type != ResultType.done) {
        throw Exception('Erro ao abrir o PDF');
      }
    }
    // Mensagem de sucesso
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('PDF aberto com sucesso!'),
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
