import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AttendanceTile extends StatelessWidget {
  final String name;
  final String date;
  final double totalHours;
  final List<Map<bool?, String>> timeEntries;

  const AttendanceTile({
    Key? key,
    required this.name,
    required this.date,
    required this.totalHours,
    required this.timeEntries,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(date, style: TextStyle(fontSize: 16)),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      children: [
                        TextSpan(text: 'hours: '),
                        TextSpan(text: '${totalHours.toStringAsFixed(1)}', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: timeEntries.map((entry) {

                  String checkedTime = entry.values.first;
                  bool isCheckedOut = entry.keys.first!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isCheckedOut)
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 16, color: Colors.black),
                            children: [
                              TextSpan(text: 'In -    '),
                              TextSpan(text: checkedTime, style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      if (isCheckedOut)
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 16, color: Colors.black),
                            children: [
                              TextSpan(text: 'Out - '),
                              TextSpan(text: checkedTime, style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
