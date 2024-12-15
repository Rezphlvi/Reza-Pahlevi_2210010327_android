import 'package:flutter/material.dart';
import 'hasilpage.dart';
import 'konversi.dart';

class InputNilai extends StatefulWidget {
  const InputNilai({super.key});

  @override
  State<InputNilai> createState() => _InputNilaiState();
}

class _InputNilaiState extends State<InputNilai> {
  final List<String> mataKuliah = [
    'Matematika',
    'Fisika',
    'Kimia',
    'Biologi',
    'Pemrograman',
    'Basis Data',
    'Jaringan',
    'Sistem Operasi',
    'Manajemen Proyek',
    'Kecerdasan Buatan',
    'Keamanan Siber',
    'Etika Profesi'
  ];

  final List<String> nilaiOptions = ['A', 'B', 'B+', 'C', 'C+', 'D', 'E'];

  final Map<String, String?> nilaiMataKuliah = {};

  final TextEditingController namaController = TextEditingController();
  final TextEditingController npmController = TextEditingController();

  final Konversi konversi = Konversi();

  @override
  void initState() {
    super.initState();
    for (var matkul in mataKuliah) {
      nilaiMataKuliah[matkul] = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Nilai Mata Kuliah'),
        backgroundColor: const Color.fromARGB(160, 96, 93, 93),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Masukkan Data Mahasiswa',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: npmController,
                decoration: const InputDecoration(
                  labelText: 'NPM',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 32),
              const Text(
                'Masukkan Nilai Mata Kuliah',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: mataKuliah.length,
                itemBuilder: (context, index) {
                  String matkul = mataKuliah[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(matkul)),
                        DropdownButton<String>(
                          hint: const Text('Pilih Nilai'),
                          value: nilaiMataKuliah[matkul],
                          onChanged: (String? value) {
                            setState(() {
                              nilaiMataKuliah[matkul] = value;
                            });
                          },
                          items: nilaiOptions.map<DropdownMenuItem<String>>((String isi) {
                            return DropdownMenuItem<String>(
                              value: isi,
                              child: Text(isi),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Map<String, double> sksMataKuliah = {};
                    nilaiMataKuliah.forEach((matkul, nilai) {
                      sksMataKuliah[matkul] = konversi.sksMatkul(nilai ?? 'E').toDouble();
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HasilPage(
                          nama: namaController.text,
                          npm: npmController.text,
                          nilaiMataKuliah: nilaiMataKuliah,
                          sksMataKuliah: sksMataKuliah,
                        ),
                      ),
                    );
                  },
                  child: const Text('Hitung Nilai'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
