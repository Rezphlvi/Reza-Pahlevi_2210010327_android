// ignore_for_file: file_names

import 'package:flutter/material.dart'; 
import 'HalamanKedua.dart'; 
 
class Halamanpertama extends StatefulWidget { 
  const Halamanpertama({super.key}); 
 
  @override 
  State<Halamanpertama> createState() => _HalamanpertamaState(); 
} 
 
class _HalamanpertamaState extends State<Halamanpertama> { 
  @override 
  Widget build(BuildContext context) { 
 return Scaffold( 
      appBar: AppBar(title: const Text('Halaman Pertama'),), 
      body: Center( 
        child: Column( 
          children: [ 
           const Text('HALAMAN PERTAMA'), 
           ElevatedButton( 
            onPressed: (){ 
              Navigator.push(context,  
              MaterialPageRoute(builder: (context) => const HalamanKedua(),) 
              ); 
            },  
            child: const Text('Menuju Halaman Ke-2')) 
          ] 
            
        ), 
      ), 
    ); 
  } 
} 
