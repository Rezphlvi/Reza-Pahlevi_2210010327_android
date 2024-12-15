import 'package:flutter/material.dart';

class Image03 extends StatelessWidget {
  const Image03({super.key});

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
            buildImageCard('assets/gambar01.jpeg', Colors.red),
            buildImageCard('assets/gambar02.jpeg', Colors.green),
            buildImageCard('assets/gambar03.jpeg', Colors.blue),
            buildImageCard('assets/gambar04.jpeg', Colors.yellow),
            buildImageCard('assets/gambar05.jpeg', Colors.orange),
            buildImageCard('assets/gambar06.jpeg', Colors.purple),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun kotak gambar
  Widget buildImageCard(String imagePath, Color color) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10), // Sudut melengkung
      ),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(10), // Sudut melengkung untuk gambar
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover, // Memastikan gambar penuh di dalam kontainer
          height: 150.0, // Tinggi kontainer
          width: double.infinity, // Lebar penuh
        ),
      ),
    );
  }
}
