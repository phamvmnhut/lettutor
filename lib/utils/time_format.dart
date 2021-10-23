import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

String dayFormat() {
  DateTime dateTime = DateTime.now();
  final formatter = DateFormat('EEE, dd MMM yy');
  return formatter.format(dateTime);
}

String timeAgo(DateTime time) => timeago.format(time);

List<DateTime> getNext7Days() =>
    List.generate(7, (index) => DateTime.now().add(Duration(days: index)));

String scheduleDate(DateTime dateTime) {
  final formatter = DateFormat('dd/MM\nEEE');
  return formatter.format(dateTime);
}

String fullDayDetail(DateTime dateTime) {
  final formatter = DateFormat('EEEE, dd MMMM yyyy');
  return formatter.format(dateTime);
}

String fullDayWithTimeDetail(DateTime dateTime) {
  final formatter = DateFormat('EEEE, dd MMMM yyyy, hh:mm');
  return formatter.format(dateTime);
}

String fullTimeDetail(DateTime dateTime) {
  final formatter = DateFormat('hh:mm');
  return formatter.format(dateTime);
}
