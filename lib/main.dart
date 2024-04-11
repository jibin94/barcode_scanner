import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String scannedResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text(
          "Barcode Scanner",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed:() =>scan(ScanMode.QR),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text('San QR Code',style: TextStyle(color: Colors.white),),
            ),

            ElevatedButton(
              onPressed:() =>scan(ScanMode.BARCODE),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text('San Barcode Code',style: TextStyle(color: Colors.white),),
            ),
            Text(
              'Scanned Result : $scannedResult',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> scan(ScanMode mode) async {
    try {
      FlutterBarcodeScanner.scanBarcode("#2A99CF", "Cancel", true, mode)
          .then((value) {
        if (value == "-1") {
        } else {
          debugPrint("scanned value : $value");
          setState(() {
            scannedResult = value;
          });
        }
      });
    } catch (e) {
      debugPrint("scanner issue : $e");
    }
  }
}
