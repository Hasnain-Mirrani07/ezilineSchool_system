import 'dart:async';
import 'dart:developer';

import 'package:eziline_school_management/Class%20data/attendence.dart';
import 'package:eziline_school_management/Class%20data/showAttendence.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../LocalNotificationService.dart';
import '../Screens/Login/login_screen.dart';

class menu extends StatefulWidget {
  const menu({Key? key}) : super(key: key);

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  final storage = FirebaseStorage.instance;

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  // Future<void> uploadFile(String filePath, String fileName) async {
  //   File file = File(filePath);
  //   try {
  //     await storage.ref('test/$fileName').putFile(file);
  //   } on FirebaseException catch (e) {
  //     print(e);
  //   }
  // }
  int count = 0;
  Timer? timer;
  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        /// callback will be executed every 1 second, increament a count value
        /// on each callback
        ///
        setState(() {
          count++;
          if (count >= 5) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginScreen()));
          }
        });
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();

    // if (FirebaseAuth.instance.currentUser != null) {
    //   Navigator.of(context)
    //       .pushReplacement(MaterialPageRoute(builder: (context) => menu()));
    // } else {
    //   Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (context) => LoginScreen()));
    // }
    // print('Timer Called');

    // FirebaseMessaging.instance.getInitialMessage().then(
    //   (message) {
    //     print("FirebaseMessaging.instance.getInitialMessage");
    //     if (message != null) {
    //       print("New Notification");
    //       // if (message.data['_id'] != null) {
    //       //   Navigator.of(context).push(
    //       //     MaterialPageRoute(
    //       //       builder: (context) => DemoScreen(
    //       //         id: message.data['_id'],
    //       //       ),
    //       //     ),
    //       //   );
    //       // }
    //     }
    //   },
    // );

    // // 2. This method only call when App in forground it mean app must be opened
    // FirebaseMessaging.onMessage.listen(
    //   (message) {
    //     print("FirebaseMessaging.onMessage.listen");
    //     if (message.notification != null) {
    //       print(message.notification!.title);
    //       print(message.notification!.body);
    //       print("message.data11 ${message.data}");
    //       // LocalNotificationService.createanddisplaynotification(message);
    //     }
    //   },
    // );

    // // 3. This method only call when App in background and not terminated(not closed)
    // FirebaseMessaging.onMessageOpenedApp.listen(
    //   (message) {
    //     print("FirebaseMessaging.onMessageOpenedApp.listen");
    //     if (message.notification != null) {
    //       print(message.notification!.title);
    //       print(message.notification!.body);
    //       print("message.data22 ${message.data['_id']}");
    //     }
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Portal $count')),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 300),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                  ),
                  child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          _signOut();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        });
                      },
                      child: Text('Log Out')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => attendece()));
                  },
                  child: Text('Mark Attendence'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => showAttendence()));
                  },
                  child: Text('Show All attednce of felows'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    print('Pressed ElevatedButton');
                  },
                  child: Text('Salybus'),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            // InkWell(
            //    onTap: () async {
            //      var result = await FilePicker.platform.pickFiles(
            //        allowMultiple: false,
            //        type: FileType.custom,
            //        allowedExtensions: ['png', 'jpg', 'gif'],
            //      );
            //      if (result == null) {
            //        ScaffoldMessenger.of(context).showSnackBar(
            //            SnackBar(content: Text("No Files Selected")));
            //        return;
            //      }
            //      var path = result.files.single.path;
            //      var fileName = result.files.single.name;
            //      uploadFile(path!, fileName);
            //    }, child:
            UserAccountsDrawerHeader(
              accountName: Text("Ibrahim Shah"),
              accountEmail: Text("Eziline@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text("Contact Us"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
