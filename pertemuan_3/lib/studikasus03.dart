import 'package:flutter/material.dart';

class StudiKasus03 extends StatefulWidget {
  const StudiKasus03({super.key});

  @override
  _StudiKasus03State createState() => _StudiKasus03State();
}

class _StudiKasus03State extends State<StudiKasus03> {
  String? selectedHokage; // Menyimpan pilihan Hokage
  String imageUrl = ''; // Menyimpan URL gambar yang dipilih

  // Daftar Hokage
  final List<String> hokageList = [
    'Hokage 1',
    'Hokage 2',
    'Hokage 3',
    'Hokage 4',
    'Hokage 5',
  ];

  // URL gambar berdasarkan pilihan Hokage
  Map<String, String> hokageImages = {
    'Hokage 1':
        'https://static.wikia.nocookie.net/naruto/images/3/30/Hokage_Hashirama.png', // Ganti dengan URL yang sesuai
    'Hokage 2':
        'https://cdn.idntimes.com/content-images/duniaku/post/20191219/kage-terkuat-tobirama-senju-4f785ff7a463c753eddd05d0c0e9da9b.jpg',
    'Hokage 3':
        'https://cdn.idntimes.com/content-images/community/2023/08/2906592-cropped-56965fbaa68adf470a17cc45ea5d328d-1c144a7a493a45ebf933a8015a055700_600x400.jpg',
    'Hokage 4':
        'https://img.koran-jakarta.com/images/article/masashi-kishimoto-bakal-buat-spin-off-hokage-keempat-minato-namikaze-230420120651.jpeg',
    'Hokage 5':
        'https://assets.pikiran-rakyat.com/crop/0x0:0x0/750x500/photo/2022/10/23/934786489.jpg',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Studi Kasus 03 - Dropdown & Gambar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Dropdown untuk memilih Hokage
            DropdownButton<String>(
              hint: const Text('Pilih Hokage'),
              value: selectedHokage,
              onChanged: (String? newValue) {
                setState(() {
                  selectedHokage = newValue;
                  imageUrl = ''; // Reset image ketika memilih Hokage baru
                });
              },
              items: hokageList.map<DropdownMenuItem<String>>((String hokage) {
                return DropdownMenuItem<String>(
                  value: hokage,
                  child: Text(hokage),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            // ElevatedButton untuk memuat gambar
            ElevatedButton(
              onPressed: () {
                if (selectedHokage != null) {
                  setState(() {
                    imageUrl = hokageImages[selectedHokage!] ?? '';
                  });
                }
              },
              child: const Text('Tampilkan Gambar Hokage'),
            ),
            const SizedBox(height: 20),
            // Menampilkan gambar berdasarkan pilihan
            if (imageUrl.isNotEmpty)
              Image.network(
                imageUrl,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Text('Gagal memuat gambar'));
                },
              ),
          ],
        ),
      ),
    );
  }
}
