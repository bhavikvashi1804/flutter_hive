import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'models/contact.dart';

class NewContactForm extends StatefulWidget {
  @override
  _NewContactFormState createState() => _NewContactFormState();
}

class _NewContactFormState extends State<NewContactForm> {
  final _formKey = GlobalKey<FormState>();

  String _name;
  String _age;

  void addContact(Contact contact) {
    print('Name: ${contact.name}, Age: ${contact.age}');
    //There are two methods to insert the data
    //1. Hive.box().put() key value
    //2. Hive.box().add()

    //1st method
    //Hive.box().put() key and value pair
    //Hive.box('contacts').put(1, contact);

    //2nd method
    //Hive automatically assign the key and it will start from 0 
    Hive.box('contacts').add(contact);

  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  onSaved: (value) => _name = value,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _age = value,
                ),
              ),
            ],
          ),
          RaisedButton(
            child: Text('Add New Contact'),
            onPressed: () {
              _formKey.currentState.save();
              final newContact = Contact(_name, int.parse(_age));
              addContact(newContact);
            },
          ),
        ],
      ),
    );
  }
}
