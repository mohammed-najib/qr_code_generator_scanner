import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScannerPage extends StatefulWidget {
  const QrCodeScannerPage({Key? key}) : super(key: key);

  @override
  State<QrCodeScannerPage> createState() => _QrCodeScannerPageState();
}

class _QrCodeScannerPageState extends State<QrCodeScannerPage> {
  final mobileScannerController = MobileScannerController();

  String? scannedData;

  @override
  void dispose() {
    mobileScannerController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final widgetWidth = screenWidth > 400.0 ? 400.0 : screenWidth;
    final widgetHeight = screenHeight > 600.0 ? 600.0 : screenHeight;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Qr Code Scanner Page'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: widgetWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    MobileScanner(
                      controller: mobileScannerController,
                      allowDuplicates: false,
                      onDetect: (barcode, args) {
                        if (barcode.rawValue == null) {
                          debugPrint('Failed to scan Barcode');
                        } else {
                          scannedData = barcode.rawValue!;
                          debugPrint('Barcode fount! $scannedData');

                          setState(() {});
                        }
                      },
                    ),
                    Positioned(
                      bottom: 0,
                      width: widgetWidth,
                      child: scannedData != null
                          ? ColoredBox(
                              color: Colors.grey.shade900,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    scannedData!,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight > 600 ? screenHeight - widgetHeight : 0,
                child: ColoredBox(
                  color: Colors.grey.shade900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
