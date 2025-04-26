import 'package:flutter/material.dart';
import 'pages/currency_converter_page_material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key}); // super class constructor initalization
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CurrencyConverterPageMaterial__statefull());
  }
}
