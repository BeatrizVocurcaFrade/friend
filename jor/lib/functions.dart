import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:share_plus/share_plus.dart';
import 'dart:html' as html;

import 'dart:typed_data';
import 'dart:io' as io;

Future<String> savePathInApp(Uint8List bytes, String name) async {
  if (kIsWeb) {
    // Salvar como um link no navegador no Flutter Web
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);

    html.AnchorElement(href: url)
      ..target = '_blank'
      ..download = name
      ..click();

    html.Url.revokeObjectUrl(url);

    // Retorna uma mensagem de sucesso para Flutter Web
    return 'Arquivo salvo no navegador: $name';
  } else {
    // Salvar localmente em plataformas móveis e desktop
    try {
      final dir = await getApplicationDocumentsDirectory();
      final pathApp = "${dir.path}/$name";
      final file = io.File(pathApp);
      var raf = file.openSync(mode: io.FileMode.write);
      raf.writeFromSync(bytes);
      raf.close();
      return pathApp;
    } catch (e) {
      return e.toString();
    }
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
