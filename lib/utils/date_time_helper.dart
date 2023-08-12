import 'package:intl/intl.dart';

class DateTimeHelper {
  static const second = 1000;
  static const fifteenSeconds = 15 * second;

  static const formatFull = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
  static const formatFull2 = "yyyy-MM-dd'T'HH:mm:ss.SSS";
  static const formatSimple = "dd MMM yyyy";
  static const formatDefault = "dd MMM yyyy, HH:mm";
  static const formatSimpleFullMonth = "dd MMMM yyyy";
  static const formatMonthOnly = "MM";
  static const formatDayOnly = "EEEE";
  static const formatYearOnly = "yyyy";
  static const formatDateWithTime = "dd MMMM yyyy 'at' HH:mm";
  static const formatTransaction = "EEEE, dd MMM yyyy | kk:mm";

  static const locale = 'id_ID';

  static String translateDateTime(String dateTime, {
    String fromFormat = formatFull,
    String retryFormat = formatFull2,
    String toFormat = formatSimple,
  }) {
    try {
      var dt = DateTime.parse(dateTime);
      return DateFormat(toFormat, locale).format(dt);
    } on FormatException catch (_) {
      try {
        var dt = DateFormat(fromFormat).parse(dateTime);
        return DateFormat(toFormat, locale).format(dt);
      } on FormatException catch (_) {
        try {
          var dt = DateFormat(formatFull2).parse(dateTime);
          return DateFormat(toFormat, locale).format(dt);
        } on FormatException catch (_) {
          return dateTime;
        }
      }
    }
  }

  static String getCurrentDateRomawi() {
    var today = DateTime.now();
    var dateFormat = DateFormat(formatMonthOnly);
    String currentDate = dateFormat.format(today);

    var month = "";
    switch (currentDate) {
      case '01':
        {
          month = "I";
        }
        break;
      case '02':
        {
          month = "II";
        }
        break;
      case '03':
        {
          month = "III";
        }
        break;
      case '04':
        {
          month = "IV";
        }
        break;
      case '05':
        {
          month = "V";
        }
        break;
      case '06':
        {
          month = "VI";
        }
        break;
      case '07':
        {
          month = "VII";
        }
        break;
      case '08':
        {
          month = "VIII";
        }
        break;
      case '09':
        {
          month = "IX";
        }
        break;
      case '10':
        {
          month = "X";
        }
        break;
      case '11':
        {
          month = "XI";
        }
        break;
      case '12':
        {
          month = "XII";
        }
        break;
    }
    return month;
  }

  static String formatTglIndo(String date) {
    DateTime dateTime = DateFormat("yyyy-MM-dd").parse(date);

    var m = DateFormat('MM').format(dateTime);
    var d = DateFormat('dd').format(dateTime).toString();
    var Y = DateFormat('yyyy').format(dateTime).toString();
    var month = "";
    switch (m) {
      case '01':
        {
          month = "Januari";
        }
        break;
      case '02':
        {
          month = "Februari";
        }
        break;
      case '03':
        {
          month = "Maret";
        }
        break;
      case '04':
        {
          month = "April";
        }
        break;
      case '05':
        {
          month = "Mei";
        }
        break;
      case '06':
        {
          month = "Juni";
        }
        break;
      case '07':
        {
          month = "Juli";
        }
        break;
      case '08':
        {
          month = "Agustus";
        }
        break;
      case '09':
        {
          month = "September";
        }
        break;
      case '10':
        {
          month = "Oktober";
        }
        break;
      case '11':
        {
          month = "November";
        }
        break;
      case '12':
        {
          month = "Desember";
        }
        break;
    }
    return "$d $month $Y";
  }

  static String getCurrentDay() {
    var today = DateTime.now();
    var dateFormat = DateFormat(formatDayOnly);
    String currentDate = dateFormat.format(today);

    var month = "";
    switch (currentDate) {
      case 'Monday':
        {
          month = "Senin";
        }
        break;
      case 'Tuesday':
        {
          month = "Selasa";
        }
        break;
      case 'Wednesday':
        {
          month = "Rabu";
        }
        break;
      case 'Thursday':
        {
          month = "Kamis";
        }
        break;
      case 'Friday':
        {
          month = "Jumat";
        }
        break;
      case 'Saturday':
        {
          month = "Sabtu";
        }
        break;
      case 'Sunday':
        {
          month = "Minggu";
        }
        break;
    }
    return month;
  }

  static String getTimeNow({String format = formatDefault}) {
    var today = DateTime.now();
    var dateFormat = DateFormat(format);
    String currentDate = dateFormat.format(today);
    return currentDate;
  }

  static int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
}
