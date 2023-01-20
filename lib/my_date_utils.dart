import 'package:intl/intl.dart';

class MyDateUtils {
  static String formatDateNews(String inputDateString) {

    DateFormat inputDateFormatter = DateFormat('yyyy-MM-ddThh:mm:ssZ'); // api datetime format
    DateFormat outputDateFormatter = DateFormat('yyyy/MMM/dd - hh:mm a');

    DateTime inputDate = inputDateFormatter.parse(inputDateString);
    String outputDateString = outputDateFormatter.format(inputDate);

    return outputDateString;
  }
}
