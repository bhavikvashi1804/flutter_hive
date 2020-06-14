import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType(typeId: 1)
class Contact {

  static const int typeId = 1;
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int age;

  Contact(this.name, this.age);
}


//to generate own adapter so that Hive can undertand the Contact data type use Hive Generator package