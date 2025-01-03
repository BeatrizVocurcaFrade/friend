import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:share_plus/share_plus.dart';

Future<String> savePathInApp(Uint8List bytes, String name) async {
  try {
    final dir = await getApplicationDocumentsDirectory();
    final pathApp = "${dir.path}/$name";
    final file = File(pathApp);
    var raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(bytes);
    raf.close();
    return raf.path;
  } catch (e) {
    return e.toString();
  }
}

Future<void> downloadAndOpenPdf(
    BuildContext context, String assetPath, String fileName) async {
  try {
    final ByteData data = await rootBundle.load(assetPath);
    // Converte ByteData para Uint8List
    final Uint8List uint8List = data.buffer.asUint8List();
    String path = await savePathInApp(uint8List, "/boleto$fileName.pdf");
    Share.shareXFiles([XFile(path)]);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('PDF salvo com sucesso! Abrindo...'),
        backgroundColor: Colors.green,
      ),
    );
  } catch (e) {
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
