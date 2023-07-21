import 'package:ClockSpotter/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TaskTile extends StatelessWidget {
  final String name;
  final String date;
  final String totalHours;
  final int index;
  final List<Map<bool?, String>> timeEntries;

  const TaskTile({
    Key? key,
    required this.name,
    required this.date,
    required this.totalHours,
    required this.timeEntries, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;

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
                  Text(name, style: TextStyle(fontSize: 16)),
                  Text(date, style:TextStyle(fontSize: 16, fontWeight: FontWeight.bold) ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      children: [
                        TextSpan(text: 'Hours: '),
                        TextSpan(text: totalHours.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: timeEntries.map((entry) {

                  String checkedTime = entry.values.first;
                  bool isCheckedOut = entry.keys.first!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isCheckedOut)
                        InkWell(
                          onTap: (){
                          },
                          child: Container(
                            child: Center(
                              child: index==0? Text(
                                  'Mark as Done!',
                                  style: theme.headlineSmall?.copyWith(
                                      color: Colors.white
                                  )
                              ): Icon(Icons.check,color: Colors.white,),
                            ),
                            height: 35,
                            width:  index==0?130:50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.green
                              ),

                              borderRadius:
                              BorderRadius.circular(10),


                              color: Colors.green.shade500,
                            ),
                          ),
                        ),

                        // RichText(
                        //   text: TextSpan(
                        //     style: TextStyle(fontSize: 16, color: Colors.black),
                        //     children: [
                        //       TextSpan(text: 'Out - '),
                        //       TextSpan(text: checkedTime, style: TextStyle(fontWeight: FontWeight.bold)),
                        //     ],
                        //   ),
                        // ),
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
