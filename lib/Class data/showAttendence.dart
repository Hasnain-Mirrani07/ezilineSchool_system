import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class showAttendence extends StatefulWidget {
  const showAttendence({Key? key}) : super(key: key);

  @override
  State<showAttendence> createState() => _showAttendenceState();
}

class _showAttendenceState extends State<showAttendence> {
  final CollectionReference _student =
      FirebaseFirestore.instance.collection('student');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade400,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        title: Text("Mark your attendence"),
      ),
      body: StreamBuilder(
        stream: _student.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['name']),
                    subtitle: Text(documentSnapshot['status'].toString()),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
