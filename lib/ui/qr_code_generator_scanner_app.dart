import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'pages/home/home.page.dart';
import 'pages/qr_code_generator/qr_code_generator.page.dart';

class QrCodeGeneratorScannerApp extends StatelessWidget {
  const QrCodeGeneratorScannerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kIsWeb || Platform.isAndroid || Platform.isIOS
          ? 'QR Code Generator and Scanner'
          : 'QR Code Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: kIsWeb || Platform.isAndroid || Platform.isIOS
          ? const HomePage()
          : const QrCodeGeneratorPage(),
    );
  }
}
