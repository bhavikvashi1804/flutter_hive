import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';

import './contact_page.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  runApp(MyApp());

  //first time you need to await and then next time you can use it no need to provide async
  final contactsBox = await Hive.openBox('contacts');

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //after first time open you have  not to provide await to open box
    //final contactsBox=Hive.openBox('contacts');
    //but you have to close the box after the app is closed
    //the better idea is to open the box per page
    return MaterialApp(
      title: 'Hive Tutorial',
      home: FutureBuilder(

        builder: (context, snapshot) => ContactPage(),
        
      ),
    );
  }
}
