import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';

import './contact_page.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose() {
    Hive.box('contacts').close();
    //or to close all box call Hive.close()
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //after first time open you have  not to provide await to open box
    //final contactsBox=Hive.openBox('contacts');
    //but you have to close the box after the app is closed
    //the better idea is to open the box per page
    return MaterialApp(
      title: 'Hive Tutorial',
      home: FutureBuilder(
        future: Hive.openBox('contacts'),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.done){
            if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }
            else{
              return ContactPage();
            }
          }
          else{
            return Scaffold(
              appBar: AppBar(
                title: Text('Hive Tutorial'),
              ),
              body: Center(
                child:Text(
                  'Loading...',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 40,
                    fontStyle: FontStyle.italic
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
