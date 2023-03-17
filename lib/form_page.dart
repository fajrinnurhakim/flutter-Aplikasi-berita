import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ittpnews/database_services.dart';

class FormPage extends StatefulWidget {
  String Deskripsi = "";
  String Namaberita = "";
  String judul = "";
  String Nomer= "";

  FormPage({Key? key, this.Nomer="", this.Deskripsi = "", this.Namaberita = "", this.judul = ""});
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String Deskripsi = "";
  String Namaberita = "";
  String judul = "";
  String Nomer="";
  var txtNomer= TextEditingController();
  var txtDeskripsi = TextEditingController();
  var txtNamaberita = TextEditingController();

  @override
  void initState() {
    super.initState();
    txtNomer.text=widget.Nomer;
    txtDeskripsi.text = widget.Deskripsi;
    txtNamaberita.text = widget.Namaberita;
    Deskripsi = widget.Deskripsi;
    Namaberita = widget.Namaberita;
    Nomer = widget.Nomer;
    judul = widget.judul;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(judul),
        actions: [
          PopupMenuButton(
            onSelected: popupMenuClick,
            itemBuilder: (BuildContext context) {
              return {'Hapus',}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(children: [
                Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: txtNomer,
            decoration: InputDecoration(
              labelText: "Nomer Berita",
              border: OutlineInputBorder(),
              hintText: "Masukkan Nomer berita",
            ),
            onChanged: (value) {
              setState(() {
                Nomer = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: txtNamaberita,
            decoration: InputDecoration(
              labelText: "Namaberita",
              border: OutlineInputBorder(),
              hintText: "Masukkan Namaberita",
            ),
            onChanged: (value) {
              setState(() {
                Namaberita = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: txtDeskripsi,
            decoration: InputDecoration(
              labelText: "Deskripsi",
              border: OutlineInputBorder(),
              hintText: "Masukkan Deskripsi",
            ),
            onChanged: (value) {
              setState(() {
                Deskripsi = value;
              });
            },
          ),
        ),
        
        ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.redAccent),
            onPressed: () {
              DatabaseServices.CreateUpdateberitaittp(context, Deskripsi, Namaberita, Nomer);
            },
            child: Text("simpan"))
      ]),
    );
  }

  void popupMenuClick(String value) {
    switch (value) {
      case 'Hapus':
        DatabaseServices.deleteberitaittp(widget.Nomer);
        Navigator.pop(context);
        break;
    }
  }
}
