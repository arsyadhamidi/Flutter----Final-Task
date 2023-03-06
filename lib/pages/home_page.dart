import 'package:finaltask/constantfile/constanfile.dart';
import 'package:finaltask/model/listmodel.dart';
import 'package:finaltask/network/network.dart';
import 'package:finaltask/pages/add_page.dart';
import 'package:finaltask/pages/update_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<ListDataPegawai>? listData;

  Future<List<ListDataPegawai>?> getPegawai() async{
    try{
      ListModelPegawai? response = await NetworkProvider().getDataPegawai();
      setState(() {
        listData = response?.data;
      });
    }catch(e){}

    return listData;
  }

  Future<ListModelPegawai?> hapusDataPegawai(String id) async{
    try{
      final response = await http.post(Uri.parse(ConstantFile.url + "deletePegawai"),
      body: {
        "id": id
      });

      ListModelPegawai hapusData = await listModelPegawaiFromJson(response.body);

      if(hapusData == 200){
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        return hapusData;
      }

    }catch(exp){}
  }

  @override
  void initState() {
    getPegawai();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Pegawai Udacoding"),
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: listData?.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      onTap: () async {
                         await Navigator.push(context,
                            MaterialPageRoute(builder: (context) => UpdatePegawaiPage(
                                data: listData?[index]
                            )));
                         if(mounted){
                           getPegawai();
                         }
                      },
                      title: Text(listData?[index].nama ?? '',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(listData?[index].posisi ?? ''),
                          Text(listData?[index].gaji ?? ''),
                          Text(listData?[index].alamat ?? ''),
                        ],
                      ),
                      trailing: IconButton(
                          onPressed: (){
                            hapusDataPegawai(listData?[index].id.toString() ?? '');
                            getPegawai();
                          },
                          icon: Icon(CupertinoIcons.trash)
                      ),
                    ),
                  ),
                );
              },
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddPegawaiPage()));

          if(mounted){
            getPegawai();
          }

        },
        backgroundColor: Colors.green,
        child: Icon(CupertinoIcons.add),
      ),
    );
  }
}
