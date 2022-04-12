import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

final List<String> angka = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
List hitungAngkaHuruf(String kalimat) {
  List hasil = [];
  int jumlahAngka = 0;
  int jumlahHuruf = 0;
  for (int i = 0; i < kalimat.length; i++) {
    if (angka.contains(kalimat[i])) {
      jumlahAngka++;
    } else {
      jumlahHuruf++;
    }
  }
  hasil.add(jumlahAngka);
  hasil.add(jumlahHuruf);
  return hasil;
}

class _MyAppState extends State<MyApp> {
  final TextEditingController myController = TextEditingController();
  String kalimat = '';
  int jumlahAngka = 0;
  int jumlahHuruf = 0;
  String analisis = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aplikasi Analisis Kalimat',
        home: Scaffold(
          appBar: AppBar(title: Text('Analisis Kalimat')),
          body: Padding(
            padding: EdgeInsets.all(9),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Form Input
                  Text('Kalimat: '),
                  SizedBox(height: 10),
                  Container(
                    width: 600,
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'masukan kalimat..',
                      ),
                      controller: myController,
                      onChanged: (value) {
                        setState(() {
                          kalimat = value;
                          jumlahAngka = hitungAngkaHuruf(kalimat)[0];
                          jumlahHuruf = hitungAngkaHuruf(kalimat)[1];
                          analisis = (jumlahAngka > 0 && jumlahHuruf > 0)
                              ? 'Gabungan Angka dan Huruf'
                              : ((jumlahAngka > 0)
                                  ? 'Hanya Angka'
                                  : 'Hanya Huruf');
                        });
                      },
                    ),
                  ),
                  // Akhir Form Input

                  // Hasil Analisis Kalimat
                  SizedBox(height: 30),
                  Text('HASIL ANALISIS KALIMAT: '),
                  SizedBox(height: 25),
                  Text('Analisis Susunan: ${analisis}'),
                  SizedBox(height: 10),
                  Text('Jumlah Angka: ${jumlahAngka}'),
                  SizedBox(height: 10),
                  Text('Jumlah Huruf: ${jumlahHuruf}'),
                  // Akhir Hasil Analisis Kalimat
                ]),
          ),
        ));
  }
}
