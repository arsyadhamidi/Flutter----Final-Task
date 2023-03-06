import 'package:finaltask/network/network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPegawaiPage extends StatefulWidget {
  const AddPegawaiPage({Key? key}) : super(key: key);

  @override
  State<AddPegawaiPage> createState() => _AddPegawaiPageState();
}

class _AddPegawaiPageState extends State<AddPegawaiPage> {

  TextEditingController _nama = TextEditingController();
  TextEditingController _posisi = TextEditingController();
  TextEditingController _gaji = TextEditingController();
  TextEditingController _alamat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Add Pegawai"),
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            TextFormField(
              controller: _nama,
              decoration: InputDecoration(
                prefixIcon: Icon(CupertinoIcons.person),
                hintText: "Nama Lengkap",
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                )
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _posisi,
              decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.person_2),
                  hintText: "Posisi",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  )
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _gaji,
              decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.doc_plaintext),
                  hintText: "Gaji",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  )
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _alamat,
              decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.play),
                  hintText: "Alamat",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  )
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: MaterialButton(
          onPressed: (){
            NetworkProvider().addDataPegawai(
                context,
                _nama.text,
                _posisi.text,
                _gaji.text,
                _alamat.text
            );
          },
          color: Colors.green,
          height: 50,
          shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text("Add Pegawai", style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
