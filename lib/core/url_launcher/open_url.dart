import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:portfolio_in/core/env_helper/env_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenUrl {
  Future<void> loadUrl(String url) async {
    try {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('launch error:${e.toString()}');
    }
  }

  Future<void> mailto() async {
    try {
      await launchUrl(Uri(scheme: 'mailto', path: EnvHelper.email));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> makecall() async {
    try {
      await launchUrl(Uri(scheme: 'tel', path: ''));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> dounload() async {
    try {
      final data = await rootBundle.load('assets/images/me/Jackson_cv.pdf');
      final bytes = data.buffer.asUint8List();

      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/Jackson_cv.pdf');
      await file.writeAsBytes(bytes);
      final params = SaveFileDialogParams(sourceFilePath: file.path);
      await FlutterFileDialog.saveFile(params: params);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
