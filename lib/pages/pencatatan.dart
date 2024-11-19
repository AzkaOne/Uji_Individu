import 'package:flutter/material.dart';
import 'package:uji_individu/provider/catatanProvider.dart';
import 'package:provider/provider.dart';

class Pencatatan extends StatelessWidget {
  const Pencatatan({super.key});

  @override
  Widget build(BuildContext context) {
    final kehadiran = Provider.of<Kehadiran>(context);
    final pelajar = kehadiran.pelajar;

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
          ListView.builder(
            itemCount: pelajar.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(pelajar[index].nama),
                trailing: Checkbox(
                  value: pelajar[index].isPresent,
                  onChanged: (_) => kehadiran.toggleKehadiran(index),
                ),
              );
            },
          ),
          
          
        ],
      ),
      bottomNavigationBar:Padding(
        padding:const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: pelajar.isEmpty
          ? null
          :(){
            kehadiran.saveKehadiran();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Kehadiran Disimpan!')),
            );
          },
         child: Text('Simpan Kehadiran')), 
      )
    );
  }
}
