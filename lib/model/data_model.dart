import 'package:hive/hive.dart';

part 'data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String course;
  @HiveField(3)
  String address;
  @HiveField(4)
  String image;

  StudentModel({
    required this.name,
    required this.course,
    required this.address,
    required this.id,
    required this.image,
  });
}
