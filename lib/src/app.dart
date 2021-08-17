import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sunset_time/src/controller/sunsetTime_controller.dart';
import 'package:sunset_time/src/geo/loading.dart';
import 'package:sunset_time/leftTime.dart';
import '../leftTime.dart';

class App extends GetView<SunSetTimeController> {
  const App({Key? key}) : super(key: key);

  Widget infoWidget(String title, String value) {
    // final frontDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    // String k = controller.sunsetTime.value.sunset ?? '';
    // String frontString1 = k.substring(0, 2);
    // String backString1 = k.substring(2);
    // String sunsetStr = frontDate + ' ' + frontString1 + ':' + backString1;
    // // DateTime dt = new DateFormat('yyyy-MM-dd HH:mm').parse(sunsetStr);

    // Duration diff = dt.difference(DateTime.now());
    // print('inMinutes: ${diff.inMinutes} \r\n');
    // int lm = diff.inMinutes.toInt() + 1;
    // String km = lm.toString();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Text('$km분 남았어용 '),
          // Text(sunsetStr),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(
            " : $value",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  // Widget leftTimeWidget() {
  //   if (lm <= 60) {
  //     return Container(
  //       height: 80,
  //       child: Text("노을까지 $lm분 남았습니다."),
  //     );
  //   } else {
  //     return Container(
  //       height: 0,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('오늘의 일출 일몰'),
        centerTitle: true,
      ),
      body: Container(
        height: 500,
        padding: const EdgeInsets.all(15),
        child: Obx(() {
          var info = controller.sunsetTime.value;
          return Column(
            children: [
              LeftTime(),
              Loading(),
              infoWidget("날짜", info.locdate ?? ''),
              infoWidget("일출", info.sunrise ?? ''),
              infoWidget("일몰", info.sunset ?? ''),
            ],
          );
        }),
      ),
    );
  }
}
