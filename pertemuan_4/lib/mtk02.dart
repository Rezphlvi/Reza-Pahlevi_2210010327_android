import 'package:flutter/material.dart';

class Mtk02 extends StatelessWidget {
  final double hasil;
  const Mtk02({super.key, required this.hasil});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hasil Perhitungan')),
      body: Center(
        child: Text(
          'Hasil: $hasil',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}