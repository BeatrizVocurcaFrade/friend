import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'package:url_launcher/url_launcher.dart';

import 'dart:io' as io;
import 'package:share_plus/share_plus.dart';
// Adicione o pacote universal_html ao pubspec.yaml para suporte multiplataforma
// dependencies:
//   universal_html: ^2.0.6
import 'package:universal_html/html.dart' as html;

Future<String> savePathInApp(Uint8List bytes, String name) async {
  if (kIsWeb) {
    return _saveInBrowser(bytes, name);
  } else {
    return _saveLocally(bytes, name);
  }
}

Future<String> _saveInBrowser(Uint8List bytes, String name) async {
  try {
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);

    html.AnchorElement(href: url)
      ..target = '_blank'
      ..download = name
      ..click();

    html.Url.revokeObjectUrl(url);

    return 'Arquivo salvo no navegador: $name';
  } catch (e) {
    return 'Erro ao salvar no navegador: ${e.toString()}';
  }
}

Future<String> _saveLocally(Uint8List bytes, String name) async {
  try {
    final dir = await getApplicationDocumentsDirectory();
    final pathApp = "${dir.path}/$name";
    final file = io.File(pathApp);
    await file.writeAsBytes(bytes);
    return pathApp;
  } catch (e) {
    return 'Erro ao salvar localmente: ${e.toString()}';
  }
}

Future<void> downloadAndOpenPdf(
    BuildContext context, String assetPath, String fileName) async {
  try {
    final ByteData data = await rootBundle.load(assetPath);
    final Uint8List uint8List = data.buffer.asUint8List();

    String path = await savePathInApp(uint8List, "/boleto$fileName.pdf");

    if (kIsWeb) {
      // Compartilhar no navegador usando Web Share API
      final blob = html.Blob([uint8List]);
      final url = html.Url.createObjectUrlFromBlob(blob);

      html.Url.revokeObjectUrl(url);
    } else {
      // Compartilhar em plataformas móveis/desktop
      Share.shareXFiles([XFile(path)]);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('PDF salvo com sucesso!'),
        backgroundColor: Colors.green,
      ),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Erro ao salvar o PDF: $e'),
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
