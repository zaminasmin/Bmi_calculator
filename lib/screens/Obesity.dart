import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Obesity extends StatefulWidget {
  const Obesity({Key? key}) : super(key: key);

  @override
  State<Obesity> createState() => _ObesityState();
}

class _ObesityState extends State<Obesity> {
  @override
  Widget build(BuildContext context) {
    var strm = FirebaseFirestore.instance.collection("Obesity").snapshots();
    return Scaffold(appBar: AppBar(backgroundColor:Colors.black,title: Text("WHAT NEXT",),),body:StreamBuilder(
        stream: strm,
        builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
        {
          if (!snapshot.hasData) {
            print(snapshot.data?.docs.length);
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          print(snapshot.data?.docs.length);
          return ListView.builder(itemCount:snapshot.data?.docs.length ,itemBuilder: (BuildContext context,int index) {
            return Column(children: [ Card(
              child: Container(height:100,
                child: ListTile(
                  title: Text(snapshot.data?.docs[index]['description']),
                  subtitle: Text(snapshot.data?.docs[index]['category']),
                  leading:  Container(height: 80,width: 80,
                    child:  Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          snapshot.data!.docs[index]['image']),
                    ),
                  ),

                ),
              ),
            ),

            ],);
          },);

        }),
    );
  }
}
