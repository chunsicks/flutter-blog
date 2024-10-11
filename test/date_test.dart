import 'package:intl/intl.dart';

void main(){
  String createdAt = "2024-10-11 09:17:31";

  String datePart = createdAt.split("")[0];
  DateTime dt = DateTime.parse(datePart);
  print(dt);

  //하루 더하기
  DateTime dts = DateTime.parse(createdAt);
  dts = dts.add(Duration(days: 1));
  String formatDt = DateFormat("yyyy.MM.dd").format(dt);
  print(formatDt);
}