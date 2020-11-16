import 'package:json_annotation/json_annotation.dart';
part 'contact.g.dart';
@JsonSerializable()
class Contact{
  String id;
  String name;
  String job;
  String age;
  Contact(this.id,this.name,this.job,this.age);

  factory Contact.fromJson(Map<String,dynamic> json) => _$ContactFromJson(json);
  Map<String,dynamic> toJson() => _$ContactToJson(this);

}