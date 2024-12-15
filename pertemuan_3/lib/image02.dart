import 'package:flutter/material.dart';

class Image02 extends StatelessWidget {
  const Image02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar'),
      ),
      body: SingleChildScrollView(
        // Agar konten dapat digulir
        child: Column(
          children: [
            Image.asset('assets/gambar01.jpeg'), // Gambar 1
            Image.asset('assets/gambar02.jpeg'), // Gambar 2
            Image.asset('assets/gambar03.jpeg'), // Gambar 3
            Image.asset('assets/gambar04.jpeg'), // Gambar 4
            Image.asset('assets/gambar05.jpeg'), // Gambar 5
            Image.asset('assets/gambar06.jpeg'), // Gambar 6
          ],
        ),
      ),
    );
  }
}
