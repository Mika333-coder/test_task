import 'package:flutter/services.dart';

class PriceInputFormatter extends TextInputFormatter {
  final String symbol;
  final int decimalDigits;

  PriceInputFormatter({required this.symbol, this.decimalDigits = 2});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove non-digits characters
    String newText = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Add decimal point if needed
    if (newText.length > decimalDigits) {
      newText =
          '${newText.substring(0, newText.length - decimalDigits)}.${newText.substring(newText.length - decimalDigits)}';
    } else {
      newText = '0'; // Pad with leading zeros
    }

    // Add symbol
    newText = '$newText $symbol';

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length - symbol.length - 1),
    );
  }
}
