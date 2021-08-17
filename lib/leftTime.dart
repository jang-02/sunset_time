import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:sunset_time/src/model/sunsetTime.dart';

class LeftTime extends StatelessWidget {
  const LeftTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Widget leftTimeWidget() {
    String frontDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    String t = SunSetTimeModel().sunset ?? '';
    String frontString = t.substring(0, 2);
    String backString = t.substring(2);
    String sunsetStr = frontDate + ' ' + frontString + ':' + backString;
    DateTime dt = new DateFormat('yyyy-MM-dd HH:mm').parse(sunsetStr);

    Duration diff = dt.difference(DateTime.now());
    // print('inMinutes: ${diff.inMinutes} \r\n');
    int lm = diff.inMinutes.toInt() + 1;
    String km = lm.toString();
    // if (lm <= 60) {
    //   return Container(
    //     height: 200,
    //     child: Text("노을까지 $km분 남았습니다."),
    //   );
    // } else {
    //   return Container();
    // }
    return Container(
      height: 300,
      child: Text('hi'),
    );
  }
}
