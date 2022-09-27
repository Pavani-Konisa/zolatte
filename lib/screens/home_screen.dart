import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zolatte/widgets/auth/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController sampledata = new TextEditingController();

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
      drawer: AppDrawer(),
      body: Column(children: [
        SizedBox(
          height: 100,
        ),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: Text(
            'Zolatte Welcomes you',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: TextFormField(
            controller: sampledata,
            keyboardType: TextInputType.multiline,
            maxLength: 50,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'enter the text',
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.blue)),
              filled: true,
              contentPadding:
                  EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: RaisedButton(
            onPressed: () {
              Map<String, dynamic> data = {"field1": sampledata.text};
              FirebaseFirestore.instance
                  .collection("test")
                  .add(data)
                  .whenComplete(() => ScaffoldMessenger.of(context)
                      .showSnackBar(
                          SnackBar(content: Text("submitted successfully"))));
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
                'Submit',
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
