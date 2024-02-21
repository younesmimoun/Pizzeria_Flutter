import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PizzeriaStyle{

  static final baseTextStyle = TextStyle(fontWeight: FontWeight.bold);

  static final TextStyle pageTitleTextStyle = baseTextStyle.copyWith(
    fontSize: 26.0,
  );
  static final TextStyle headerTextStyle = baseTextStyle.copyWith(
    fontSize: 20.0,
  );

  static final TextStyle regularTextStyle = baseTextStyle.copyWith(
    fontSize: 18.0,
  );

  static final TextStyle subHeaderTextStyle =
      baseTextStyle.copyWith(fontSize: 26.0);
  static final TextStyle itemPriceTextStyle = const TextStyle(color : Colors.blueGrey);
  static final subPriceTextStyle = baseTextStyle.copyWith(
    color: Colors.indigo,
    fontSize: 20.0,
  );
  static final TextStyle priceSubTotalStyle = baseTextStyle.copyWith(
    color: Colors.blueGrey,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle priceTotalTextStyle = baseTextStyle.copyWith(
    color: Colors.indigo,
    fontSize: 22.0,
  );
  static final TextStyle errorTextStyle = baseTextStyle.copyWith(
    color: Colors.red,
    fontSize: 22.0
  );
}