import 'package:flutter/material.dart';
import 'page02.dart'; // Pastikan import Halaman Kedua benar

class Page01 extends StatefulWidget {
  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  const Page01({super.key, Key});

  @override
  State<Page01> createState() => _Page01State();
}

class _Page01State extends State<Page01> {
  final String pnama = "Dwi Dian Permatasari";
  final String pnpm = "201009012";
  final String pprodi = "Sistem Informasi";
  final String psemester = "V";
  final List<String> listprogram = ["PHP", "Flutter", "C++"];
  final Map<String, dynamic> mapData = {
    "IPS-1": 3.54,
    "IPS-2": 3.35,
    "IPS-3": 3.20,
    "Grade": "Memuaskan",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Pertama')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Page02(
                  npm: pnpm,
                  nama: pnama,
                  prodi: pprodi,
                  semester: psemester,
                  pemrograman: listprogram,
                  mapData: mapData,
                ),
              ),
            );
          },
          child: const Text('Menuju Halaman Ke-2'),
        ),
      ),
    );
  }
}
