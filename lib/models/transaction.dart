class Transaction {
  final int id;
  final String type;
  final int itemId;
  final int quantity;
  final String date;

  Transaction({
    required this.id,
    required this.type,
    required this.itemId,
    required this.quantity,
    required this.date,
  });
}
