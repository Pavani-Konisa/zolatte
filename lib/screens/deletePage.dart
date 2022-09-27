import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zolatte/screens/home_screen.dart';

class DeletePage extends StatefulWidget {
  const DeletePage({Key? key}) : super(key: key);
  static const routeName = '/DeletePage';

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 246, 244, 244)),
        backgroundColor: Color(0xFF2661FA),
        title: Text('Zolatte'),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 246, 244, 244),
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: 100,
        ),
        Container(
          child: Text('Are you sure to delete',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),),
        ),
        SizedBox(
          height: 30,
        ),
    Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: RaisedButton(
            onPressed: () {
              // FirebaseFirestore.instance
              //     .collection("test")
              //     .doc(sampledata)
              //     .delete()
              //     .whenComplete(() => HomeScreen());
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0)),
            textColor: Colors.white,
            padding: const EdgeInsets.all(0),
            child: Container(
              alignment: Alignment.center,
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80.0),
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 255, 136, 34),
                    Color.fromRGBO(255, 177, 41, 1)
                  ])),
              padding: const EdgeInsets.all(0),
              child: Text(
                'Delete',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ]),
      );
  }
}
