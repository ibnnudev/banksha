import 'package:another_flushbar/flushbar.dart';
import 'package:banksha/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void showFlushbar(BuildContext context, String message) {
  Flushbar(
    message: message,
    duration: const Duration(seconds: 3),
    backgroundColor: redColor,
    flushbarPosition: FlushbarPosition.TOP,
  ).show(context);
}

String formatCurrency(
  num number, {
  String symbol = 'Rp ',
}) {
  return NumberFormat.currency(
    locale: 'id',
    decimalDigits: 0,
    symbol: symbol,
  ).format(
    int.tryParse(
          number.toString().replaceAll(RegExp(r'[^0-9]'), ''),
          radix: 10,
        ) ??
        0,
  );
}
