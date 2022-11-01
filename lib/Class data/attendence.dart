import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class attendece extends StatefulWidget {
  const attendece({Key? key}) : super(key: key);

  @override
  State<attendece> createState() => _attendeceState();
}

class _attendeceState extends State<attendece> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  final CollectionReference _student =
      FirebaseFirestore.instance.collection('student');

  Future _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: _statusController,
                  decoration: const InputDecoration(labelText: 'status'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Attendence'),
                  onPressed: () async {
                    final String name = _nameController.text;
                    final String status = _statusController.text;

                    if (status != null) {
                      await _student.add({"name": name, "status": status});

                      _nameController.text = '';
                      _statusController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade400,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        title: Text("Mark your attendence"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _create(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
