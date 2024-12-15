import 'package:flutter/material.dart';

class HasilPage extends StatelessWidget {
  final String nama;
  final String npm;
  final Map<String, String?> nilaiMataKuliah;
  final Map<String, double> sksMataKuliah;

  const HasilPage({
    super.key,
    required this.nama,
    required this.npm,
    required this.nilaiMataKuliah,
    required this.sksMataKuliah,
  });

  double _hitungIPK() {
    int totalSKS = sksMataKuliah.values.fold(0, (sum, sks) => sum + sks.toInt());
    double totalBobot = 0;

    sksMataKuliah.forEach((matkul, sks) {
      double bobot = (nilaiMataKuliah[matkul] == 'A' ? 4.0 :
                     nilaiMataKuliah[matkul] == 'B+' ? 3.3 :
                     nilaiMataKuliah[matkul] == 'B' ? 3.0 :
                     nilaiMataKuliah[matkul] == 'C+' ? 2.3 :
                     nilaiMataKuliah[matkul] == 'C' ? 2.0 :
                     nilaiMataKuliah[matkul] == 'D' ? 1.0 : 0.0);
      totalBobot += bobot * sks;
    });

    return totalBobot / totalSKS;
  }

  @override
  Widget build(BuildContext context) {
    double ipk = _hitungIPK();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Perhitungan'),
        backgroundColor: const Color.fromARGB(255, 39, 126, 213),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Data Mahasiswa:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Nama: $nama'),
            Text('NPM: $npm'),
            const SizedBox(height: 16),
            const Text(
              'Hasil Nilai Mata Kuliah:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...nilaiMataKuliah.entries.map((entry) {
              return Text(
                  '${entry.key}: ${entry.value ?? '-'} (${sksMataKuliah[entry.key]?.toInt() ?? 0} SKS)');
            }),
            const SizedBox(height: 16),
            Text(
              'IPK: ${ipk.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
