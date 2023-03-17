import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseServices {
  static Future<void> CreateUpdateberitaittp(
      BuildContext context, String Deskripsi, String Namaberita, String Nomer, ) async {
    DocumentReference beritaittpReference =
        FirebaseFirestore.instance.collection("beritaittp").doc(Nomer);
    Map<String, dynamic> databeritaittp = {"Nomer": Nomer,"Deskripsi": Deskripsi, "Namaberita": Namaberita};
    beritaittpReference.set(databeritaittp).whenComplete(() {
      Navigator.pop(context);
    });
  }

  static Future<void> deleteberitaittp(String Deskripsi) async {
    CollectionReference beritaittpCollection =
        FirebaseFirestore.instance.collection('beritaittp');
    return await beritaittpCollection.doc(Deskripsi).delete();
  }
}
