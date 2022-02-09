import 'package:flutter/material.dart';
import 'package:sary_assessment/models/item.dart';
import 'package:sary_assessment/models/transaction.dart';

const Color xprimaryColor = Color(0xFF5044B8);
const Color xbgColor = Color.fromARGB(255, 240, 238, 238);

const double xdefaultBorderRadius = 12.0;

const Color xHeadingFontColor = Color(0xFF404040);
const Color xnormalFontColor = Color(0xFF636363);

final transactions = [
  Transaction(
    id: 1,
    type: "inbound",
    itemId: 2,
    quantity: 1,
    date: "20/01/2022",
  ),
  Transaction(
    id: 2,
    type: "outbound",
    itemId: 2,
    quantity: 45,
    date: "20/01/2022",
  ),
  Transaction(
    id: 3,
    type: "inbound",
    itemId: 2,
    quantity: 45,
    date: "20/01/2022",
  ),
  Transaction(
    id: 3,
    type: "inbound",
    itemId: 2,
    quantity: 45,
    date: "20/01/2022",
  ),
  Transaction(
    id: 3,
    type: "inbound",
    itemId: 2,
    quantity: 45,
    date: "20/01/2022",
  ),
  Transaction(
    id: 3,
    type: "inbound",
    itemId: 2,
    quantity: 45,
    date: "20/01/2022",
  ),
  Transaction(
    id: 1,
    type: "inbound",
    itemId: 1,
    quantity: 45,
    date: "20/01/2022",
  ),
  Transaction(
    id: 2,
    type: "outbound",
    itemId: 2,
    quantity: 45,
    date: "20/01/2022",
  ),
  Transaction(
    id: 3,
    type: "inbound",
    itemId: 2,
    quantity: 45,
    date: "20/01/2022",
  ),
  Transaction(
    id: 3,
    type: "inbound",
    itemId: 2,
    quantity: 45,
    date: "20/01/2022",
  ),
  Transaction(
    id: 3,
    type: "inbound",
    itemId: 2,
    quantity: 45,
    date: "20/01/2022",
  ),
  Transaction(
    id: 3,
    type: "inbound",
    itemId: 2,
    quantity: 45,
    date: "20/01/2022",
  ),
];

final items = [
  Item(
    id: 1,
    name: "Barbican Beer Drink",
    price: 92.61,
    sku: "PRO-SA1",
    description: "320 x 6 ml",
    image: "assets/images/Barbican.png",
  ),
  Item(
    id: 2,
    name: "Afia Corn Oil",
    price: 12.13,
    sku: "PRO-SA2",
    description: "6 x 320 ml",
    image: "assets/images/Afia.png",
  ),
  Item(
    id: 3,
    name: "Pringles Barbeque Potato Chips",
    price: 100.25,
    sku: "PRO-SA3",
    description: "165 GM x 19",
    image: "assets/images/Pringles.png",
  ),
  Item(
    id: 4,
    name: "Barbican Beer Drink",
    price: 92.61,
    sku: "PRO-SA4",
    description: "320 x 6 ml",
    image: "assets/images/Barbican.png",
  ),
  Item(
    id: 5,
    name: "Afia Corn Oil",
    price: 12.13,
    sku: "PRO-SA5",
    description: "6 x 320 ml",
    image: "assets/images/Afia.png",
  ),
  Item(
    id: 6,
    name: "Pringles Barbeque Potato Chips",
    price: 100.25,
    sku: "PRO-SA6",
    description: "165 GM x 19",
    image: "assets/images/Pringles.png",
  ),
];
