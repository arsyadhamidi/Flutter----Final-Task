// To parse this JSON data, do
//
//     final listModelPegawai = listModelPegawaiFromJson(jsonString);

import 'dart:convert';

ListModelPegawai listModelPegawaiFromJson(String str) => ListModelPegawai.fromJson(json.decode(str));

String listModelPegawaiToJson(ListModelPegawai data) => json.encode(data.toJson());

class ListModelPegawai {
  ListModelPegawai({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<ListDataPegawai>? data;

  factory ListModelPegawai.fromJson(Map<String, dynamic> json) => ListModelPegawai(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<ListDataPegawai>.from(json["data"]!.map((x) => ListDataPegawai.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ListDataPegawai {
  ListDataPegawai({
    this.id,
    this.nama,
    this.posisi,
    this.gaji,
    this.alamat,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? nama;
  String? posisi;
  String? gaji;
  String? alamat;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ListDataPegawai.fromJson(Map<String, dynamic> json) => ListDataPegawai(
    id: json["id"],
    nama: json["nama"],
    posisi: json["posisi"],
    gaji: json["gaji"],
    alamat: json["alamat"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama": nama,
    "posisi": posisi,
    "gaji": gaji,
    "alamat": alamat,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
