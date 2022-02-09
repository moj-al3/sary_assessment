import 'package:hive/hive.dart';

part 'item.g.dart';

@HiveType(typeId: 0)
class Item {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final String sku;
  @HiveField(4)
  final String description;
  @HiveField(5)
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.sku,
    required this.description,
    required this.image,
  });
}
