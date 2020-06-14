import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './new_contact_form.dart';
import './models/contact.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hive Tutorial'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: _buildListView()),
            NewContactForm(),
          ],
        ));
  }

  Widget _buildListView() {

    final contactsBox=Hive.box('contacts');

    return WatchBoxBuilder(
      box: contactsBox, 
      builder: (context, box) {
         return ListView.builder(
          itemCount: contactsBox.length,
          itemBuilder: (context, index) {
            final Contact oneContact=contactsBox.getAt(index) as Contact;
            return ListTile(
              title: Text(oneContact.name),
              subtitle: Text(oneContact.age.toString()),
            );
          } 
        
        );
      },
    ); 
    
   
  }
}
