import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ittpnews/form_page.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Database Berita"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormPage(judul: "Tambah Data Berita");
          }));
        },
        child: Icon(Icons.add,),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('beritaittp')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot documentSnapshot =
                              snapshot.data!.docs[index];
                          print("${documentSnapshot["Namaberita"]}");
                          return Card(
                            child: InkWell(
                              customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                leading: Image.asset('image/splash.png'),
                                title: Text(documentSnapshot["Namaberita"]),
                                subtitle: Text(documentSnapshot["Deskripsi"]),
                                trailing: Text(documentSnapshot["Nomer"]),
                              ),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return FormPage(judul: "Ubah Data Berita",Nomer : documentSnapshot["Nomer"], Namaberita: documentSnapshot["Namaberita"],Deskripsi: documentSnapshot["Deskripsi"],);
                                }));
                              },
                            ),
                          );
                        });
                  } else {
                    return Text("Tidak ada data");
                  }
                })
          ],
        ),
      ),
    );
  }
}
