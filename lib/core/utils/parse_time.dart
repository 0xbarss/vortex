String toTime(DateTime dateTime) {
  String hour = dateTime.hour < 10 ? '0${dateTime.hour}': '${dateTime.hour}';
  String minute = dateTime.minute < 10 ? '0${dateTime.minute}': '${dateTime.minute}';
  return '$hour:$minute';
}