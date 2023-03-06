import 'package:finaltask/constantfile/constanfile.dart';
import 'package:finaltask/model/listmodel.dart';
import 'package:finaltask/model/modelpegawai.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class NetworkProvider{

  Future<ListModelPegawai?> getDataPegawai() async{
    var response = await http.get(Uri.parse(ConstantFile.url + "getDataPegawai"));

    ListModelPegawai listPegawai = listModelPegawaiFromJson(response.body);
    return listPegawai;
  }

  Future<ModelPegawai?> addDataPegawai(BuildContext context,
      String nama, String posisi, String gaji, String alamat) async{
    final response = await http.post(Uri.parse(ConstantFile.url + "addPegawai"),
        body: {
          "nama": nama,
          "posisi": posisi,
          "gaji": gaji,
          "alamat": alamat,
        });

    ModelPegawai? tambahPegawai = await modelPegawaiFromJson(response.body);
    Navigator.pop(context);
    return tambahPegawai;

  }

}