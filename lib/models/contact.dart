import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType()
class Contact {

  @HiveField(0)
  final String name;
  @HiveField(1)
  final int age;

  Contact(this.name, this.age);
}


//to generate own adapter so that Hive can undertand the Contact data type use Hive Generator package