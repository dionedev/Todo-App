import 'package:intl/intl.dart';

class Services {
  static String formatDate() {
    final now = DateTime.now();

    final formatter = DateFormat('EEEE dd, yyyy', 'pt_BR');
    return capitalizeFirstLetter(formatter.format(now));
  }

  static String capitalizeFirstLetter(String text) {
    if (text.isNotEmpty) {
      return text[0].toUpperCase() + text.substring(1);
    }
    return text;
  }
}
