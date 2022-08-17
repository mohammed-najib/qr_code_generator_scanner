import 'dart:typed_data';

import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QrCodeGeneratorPage extends StatefulWidget {
  const QrCodeGeneratorPage({Key? key}) : super(key: key);

  @override
  State<QrCodeGeneratorPage> createState() => _QrCodeGeneratorPageState();
}

class _QrCodeGeneratorPageState extends State<QrCodeGeneratorPage> {
  final textController = TextEditingController();

  Uint8List? imageBytes;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final widgetWidth = screenWidth > 400.0 ? 400.0 : screenWidth;

    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Generator Page'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: widgetWidth,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (imageBytes != null) SvgPicture.memory(imageBytes!),
                const SizedBox(height: 40.0),
                TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    labelText: 'url',
                    suffixIcon: IconButton(
                      color: Theme.of(context).colorScheme.secondary,
                      icon: const Icon(
                        Icons.done,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        // Create a QR code
                        final dm = Barcode.qrCode();

                        // Generate an SVG from text
                        final svg = dm.toSvg(
                          textController.text,
                          width: 200,
                          height: 200,
                        );

                        // Convert SVG to bytes
                        imageBytes = convertStringToUint8List(svg);

                        setState(() {});
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Uint8List convertStringToUint8List(String data) {
  return Uint8List.fromList(data.codeUnits);
}

String convertUint8ListToString(Uint8List bytes) {
  return String.fromCharCodes(bytes);
}
