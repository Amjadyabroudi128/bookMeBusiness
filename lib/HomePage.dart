
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  HomePage({@required this.document});
  final document;

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  final CollectionReference Services =
  FirebaseFirestore.instance.collection('Services');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Services').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if (!snapshot.hasData) {
              return Stack(
                children: <Widget>[

                ],
              );
            }
            return ListView(
              children: snapshot.data!.docs.map((document) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.all(10),
                  color: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ListTile(
                      //   title: Text(document["name"]),
                      //   trailing: Text(document["service"]),
                      //   // subtitle: Text(formattedDate(
                      //   //     document["date"],
                      //   // )),
                      //   subtitle: Text("${formattedDate(document["date"])}: ${document["time"]}"),
                      // ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Text(document["name"], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          Spacer(),
                          Text(document["service"], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Text("${formattedDate(document["date"])}: ${document["time"]}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          Spacer(),
                          Text(document["price"], style: TextStyle(fontSize: 20),)
                        ],
                      ),
                      SizedBox(height: 20,),
                      Center(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black
                            ),
                          child: Text("Done", style: TextStyle(color: Colors.red),),
                          onPressed: () async{
                            await FirebaseFirestore.instance.collection("Services").doc(document.id).delete();
                          },
                        ),
                      )

                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
      )
    );
  }
  String formattedDate(timeStamp){
    var dateFromTimeStamp = DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds *1000);
    return DateFormat('dd-MM-yyyy').format(dateFromTimeStamp);
  }
}


