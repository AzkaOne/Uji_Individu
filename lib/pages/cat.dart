import 'package:flutter/material.dart';
import 'package:uji_individu/provider/catatanProvider.dart';
import 'package:provider/provider.dart';

class Cat extends StatelessWidget {
  const Cat({super.key});

  @override
  Widget build(BuildContext context) {
    final catatanHistory = Provider.of<Kehadiran>(context).historyKehadiran;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Presensi Siswa',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg1.png',
              fit: BoxFit.cover,
            ),
          ),
          catatanHistory.isEmpty
          ? Center(child: Text('Belum Ada Riwayat Kehadiran.'))
         : ListView.builder(
            itemCount: catatanHistory.length,
            itemBuilder: (context, index){
              final record = catatanHistory[index];
              return ListTile(
                title: Text(
                  'tanggal: ${record['date'].toString().split('')[0]}',
                ),
                subtitle: Text(
                  'Hadir: ${record['present']}, Tidak Hadir: ${record['absent']}',
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
