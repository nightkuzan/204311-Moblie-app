import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List chiangmai = [];
void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(const MaterialApp(
    home: MyWidget(),
  ));

  getdata();
}

void adddata() {
  // ignore: unused_local_variable
  Future<FirebaseApp> firebase = Firebase.initializeApp();
  // ignore: no_leading_underscores_for_local_identifiers
  final CollectionReference _chiangmai =
      FirebaseFirestore.instance.collection('chiangmai');
  _chiangmai.add({
    'district': 'เมืองเชียงใหม่',
    'tambon': 'เมืองเชียงใหม่',
    'zipcode': '50000',
  });
}

void getdata() {
  // ignore: unused_local_variable
  Future<FirebaseApp> firebase = Firebase.initializeApp();
  // ignore: no_leading_underscores_for_local_identifiers
  final CollectionReference _chiangmai =
      FirebaseFirestore.instance.collection('chiangmai');
  _chiangmai.get().then((QuerySnapshot snapshot) {
    
    chiangmai = snapshot.docs.map((e) => e.data()).toList();
  });
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Address Form'),
              ),
              body: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text("Error"),
                  ],
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Address Form'),
              ),
              body: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Enter Email Address',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Enter Zip Code',
                      ),
                    ),
                    const Text("Province: Chiang Mai"),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'District',
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Tambon',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        getdata();
                        print(chiangmai);

                        if (true) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
