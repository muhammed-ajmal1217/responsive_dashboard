  import 'package:dashboard/widgets/custom_text.dart';
import 'package:flutter/material.dart';

TableRow tableRow(String product, String lastPurchase, String time,
      String price, String qty) {
    return TableRow(
      children: [
        tableItems(product),
        tableItems(lastPurchase),
        tableItems(time),
        tableItems(price),
        tableItems(qty),
      ],
    );
  }

  Widget tableHeader(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomText(
        text: text,
        fontWeight: FontWeight.w600,
        size: 14,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget tableItems(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomText(
        size: 14,
        text: text,
        textAlign: TextAlign.center,
      ),
    );
  }