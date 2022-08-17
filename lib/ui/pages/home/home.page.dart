import 'package:flutter/material.dart';

import '../qr_code_generator/qr_code_generator.page.dart';
import '../qr_code_scanner/qr_code_scanner.page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final widgetWidth = screenWidth > 400.0 ? 400.0 : screenWidth;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: widgetWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const QrCodeGeneratorPage(),
                )),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Generate QR Code'),
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const QrCodeScannerPage(),
                )),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Scan QR Code'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
