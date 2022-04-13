// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
// NAMA / NIM : KOMANG HOKKY ARYASTA / 2015091028
import 'package:flutter/material.dart';

void main() {
  runApp(Pertemuan10());
}

class Pertemuan10 extends StatefulWidget {
  @override
  State<Pertemuan10> createState() => _Pertemuan10State();
}

class _Pertemuan10State extends State<Pertemuan10> {
  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();
  TextEditingController output = TextEditingController();
  void tambah() {
    int angka1 = int.parse(input1.text);
    int angka2 = int.parse(input2.text);

    int hasil = angka1 + angka2;
    output.text = hasil.toString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pertemuan 10"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: input1,
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukan angka ke-1',
                ),
              ),
              SizedBox(height: 7),
              TextField(
                controller: input2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukan angka ke-2',
                ),
              ),
              SizedBox(height: 7),
              ElevatedButton(
                onPressed: () {
                  tambah();
                },
                child: Text('TAMBAH'),
              ),
              SizedBox(height: 7),
              TextField(
                controller: output,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Hasil Penjumlahan',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
