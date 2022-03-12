import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/network/firebase_json_converter.dart';
import 'package:looping_diary/core/network/firebase_rest_client.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('HomePage'),
          leading: IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final now = DateTime.now();
                  // print(await FirebaseAuth.instance.currentUser?.getIdToken());
                  // print('https://looping-diary.firebaseio.com/${FirebaseAuth.instance.currentUser?.uid}/notes.json');
                  await (await getIt.getAsync<FirebaseRestClient>()).patch(
                      'https://firestore.googleapis.com/v1/projects/looping-diary/databases/(default)/documents/${FirebaseAuth.instance.currentUser?.uid}/notes',
                      FirebaseJsonConverter().convertToFirebaseJson(
                          'projects/looping-diary/databases/(default)/documents/${FirebaseAuth.instance.currentUser?.uid}/xxx',
                          {
                            'date': '${now.day}|${now.month}|${now.year}',
                            'entry': 'Today was a good day my dear diary. Something amazing happened!'
                          }));
                },
                child: const Text('Write to DB'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await (await getIt.getAsync<FirebaseRestClient>())
                      .get(
                        'https://firestore.googleapis.com/v1/projects/looping-diary/databases/(default)/documents/${FirebaseAuth.instance.currentUser?.uid}/notes',
                      )
                      .then((value) => print(value['fields']));
                },
                child: const Text('Read from DB'),
              ),
            ],
          ),
        ),
      );
}
