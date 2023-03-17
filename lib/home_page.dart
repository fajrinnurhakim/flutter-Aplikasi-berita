import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ittpnews/form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("ITTP NEWS"),
      ),
      
      body:  SingleChildScrollView(
        child:  Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('beritaittp')
              .snapshots(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context,index){
                      DocumentSnapshot documentSnapshot =
                      snapshot.data!.docs[index];
                      print("${documentSnapshot["Namaberita"]}");  
                      return Card(
                        child : ListTile(
                        leading: Image.asset('image/splash.png'),
                        title: Text(documentSnapshot["Namaberita"]),
                        subtitle: Text(documentSnapshot["Deskripsi"]),
                        trailing: Text(documentSnapshot["Nomer"]),
                      ),
                      );
                    },
                  );
                }else{
                  return Text("Tidak ada data");
                }
              },
            )
          ],)
      ),
    );
  }
}