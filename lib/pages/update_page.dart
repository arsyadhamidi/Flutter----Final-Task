import 'dart:convert';

import 'package:finaltask/constantfile/constanfile.dart';
import 'package:finaltask/model/listmodel.dart';
import 'package:finaltask/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdatePegawaiPage extends StatefulWidget {

  final ListDataPegawai? data;

  UpdatePegawaiPage({Key? key, this.data}) : super(key: key);

  @override
  State<UpdatePegawaiPage> createState() => _UpdatePegawaiPageState();
}

class _UpdatePegawaiPageState extends State<UpdatePegawaiPage> {

  TextEditingController _nama = TextEditingController();
  TextEditingController _posisi = TextEditingController();
  TextEditingController _gaji = TextEditingController();
  TextEditingController _alamat = TextEditingController();

  Future<void> updateDataPegawai() async{
    final response = await http.post(Uri.parse(ConstantFile.url + "editPegawai"),
    body: {
      "id": widget.data?.id.toString(),
      "nama": _nama.text,
      "posisi": _posisi.text,
      "gaji": _gaji.text,
      "alamat": _alamat.text
    });

    var DataUpdate = jsonDecode(response.body);

    Navigator.pop(context);

  }

  @override
  void initState() {
    _nama.text = widget.data?.nama ?? '';
    _posisi.text = widget.data?.posisi ?? '';
    _gaji.text = widget.data?.gaji ?? '';
    _alamat.text = widget.data?.alamat ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Update Pegawai"),
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
        padding: EdgeInsets.all(20),
        child: MaterialButton(
          onPressed: () async{
            updateDataPegawai();
            setState(() {

            });
          },
          color: Colors.green,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none
          ),
          height: 50,
          child: Text("Update Data ${widget.data?.id}", style: TextStyle(color: Colors.white),),
        )
      ),
    );
  }
}
