import 'package:flutter/material.dart';
import 'package:qr_code/Pages/qr_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Maker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QRView(),
    );
  }
}
