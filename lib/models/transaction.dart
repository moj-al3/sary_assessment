import 'package:hive/hive.dart';
import 'package:sary_assessment/models/item.dart';

part 'transaction.g.dart';

@HiveType(typeId: 1)
class Transaction {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String type;
  @HiveField(2)
  final Item item;
  @HiveField(3)
  final int quantity;
  @HiveField(4)
  final DateTime date;

  Transaction({
    required this.id,
    required this.type,
    required this.item,
    required this.quantity,
    required this.date,
  });
}
