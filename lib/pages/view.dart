import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "../util/nepali_date.dart";

class DateView extends StatefulWidget {
  const DateView({super.key});

  @override
  State<DateView> createState() => _DateViewState();
}

class _DateViewState extends State<DateView> {
  @override
  Widget build(BuildContext context) {
    var today = NepaliDate.fromGregorian(DateTime.now());
    var gregorianToday = DateTime.now();

    String formattedGregorian = DateFormat("MMMM d, y").format(gregorianToday);
    var textStyle = TextStyle(fontSize: 24);
    var dateStyle = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Theme.of(context).colorScheme.primary);

    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Today's date is ", style: textStyle),
        Text(today.toString(), style: dateStyle)
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("English date is ", style: textStyle),
        Text(formattedGregorian, style: dateStyle)
      ]),
    ]));
  }
}
