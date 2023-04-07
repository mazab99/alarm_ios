import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';

import '../helpers/local_notifcation2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          PaddedElevatedButton(
              buttonText: "change location", onPressed: getLocation),
          PaddedElevatedButton(buttonText: "set to week", onPressed: setTimeDaily),
          PaddedElevatedButton(buttonText: "test", onPressed: test),
        ],
      ),
    ));
  }

  void getLocation() {
    // AwesomeLocalNotificationsHelperV2.localNotificationsHelper.checkGps();
  }

  void setTimeDaily() {
    // AwesomeLocalNotificationsHelperV2.localNotificationsHelper.showAdhansNotificationsToWeek();
    // LocalNotificationsHelper.localNotificationsHelper.showAdhansNotificationsToWeek();
    LocalNotificationsHelper2.localNotificationsHelper.showAdhansNotificationsToWeek();
  }

  void test() {
    // Coordinates myLocaion = Coordinates(30.0594838, 31.2934839);// egypt
    Coordinates myLocaion = Coordinates(52.5069312,13.7049182); // germany
    final nyDate = DateTime.now();
    // final nyParams = CalculationMethod.Egyptian();
    for (var element in listPar) {
      final nyPrayerTimes = PrayerTimes(myLocaion, nyDate, element);
      print(
          "fajr : ${converDate(nyPrayerTimes.fajr)} , dhuhr : ${converDate(nyPrayerTimes.dhuhr)}, asr : ${converDate(nyPrayerTimes.asr)}, maghrib : ${converDate(nyPrayerTimes.maghrib)}, isha : ${converDate(nyPrayerTimes.isha)} | ${element.method}");
      print("---------------------------------------------------------");
    }


    // final nyPrayerTimes = PrayerTimes(myLocaion, nyDate, nyParams);
    // print(
    //     " fajr : ${converDate(nyPrayerTimes.fajr)} , dhuhr : ${converDate(nyPrayerTimes.dhuhr)}, asr : ${converDate(nyPrayerTimes.asr)}, maghrib : ${converDate(nyPrayerTimes.maghrib)}, isha : ${converDate(nyPrayerTimes.isha)}");
    // print("---------------------------------------------------------");
  }
  List<CalculationParameters> listPar = [
  CalculationMethod.MuslimWorldLeague(),
  CalculationMethod.Egyptian(),
  CalculationMethod.Karachi(),
  CalculationMethod.UmmAlQura(),
  CalculationMethod.Dubai(),
  CalculationMethod.MoonsightingCommittee(),
  CalculationMethod.NorthAmerica(),
  CalculationMethod.Kuwait(),
  CalculationMethod.Qatar(),
  CalculationMethod.Singapore(),
  CalculationMethod.Tehran(),
  CalculationMethod.Turkey(),
  CalculationMethod.Morocco(),
  CalculationMethod.Other(),

  ];

  String converDate(DateTime? d) {
    if(d == null) return "null";
    d = d.toLocal();
    return "${d.hour}:${d.minute}:${d.second}";
  }
}

class PaddedElevatedButton extends StatelessWidget {
  const PaddedElevatedButton({
    required this.buttonText,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(buttonText),
        ),
      );
}
