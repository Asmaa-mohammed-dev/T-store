import 'dart:core';
import 'package:intl/intl.dart';

class TFormatter {
  static String formatData(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$')
        .format(amount); // Customize the currency locale and symbol as needed
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Assuming a 10-digit US phone format: (123) 456-7890
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)}-${phoneNumber.substring(7)}';
    }
    return phoneNumber; // Return the original number if it doesn't match expected formats
  }

  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Remove any non-digit characters from the phone number
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Ensure that the number has at least a country code
    if (digitsOnly.length < 3) return phoneNumber;

    // Extract the country code dynamically (assume first 1-3 digits)
    String countryCode;
    int countryCodeLength =
        (digitsOnly.startsWith('1')) ? 1 : 2; // US is 1 digit, others are 2+
    countryCode = '+${digitsOnly.substring(0, countryCodeLength)}';
    digitsOnly = digitsOnly.substring(countryCodeLength);

    // Ensure there's enough length for area code and number
    if (digitsOnly.length < 7) return phoneNumber;

    // Extract the area code (first 3 digits after country code)
    String areaCode = digitsOnly.substring(0, 3);
    String remainingNumber = digitsOnly.substring(3);

    // Format the rest of the phone number
    final formattedNumber = StringBuffer();
    formattedNumber.write('$countryCode ($areaCode) ');

    int i = 0;
    while (i < remainingNumber.length) {
      int groupLength = (i == 0) ? 3 : 2;
      int end = i + groupLength;
      if (end > remainingNumber.length) {
        end = remainingNumber.length;
      }
      formattedNumber.write(remainingNumber.substring(i, end));
      if (end < remainingNumber.length) {
        formattedNumber.write(' ');
      }
      i = end;
    }

    return formattedNumber.toString();
  }
}
