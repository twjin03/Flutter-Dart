import 'package:flutter/material.dart';

import 'package:expense_tracker/expenses.dart';


void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Expenses(),
    ),
  );
}