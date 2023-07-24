import 'package:ClockSpotter/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';

class MyPayTile extends StatelessWidget {
  final String name;
  final String date;
  final String totalHours;
  final List<Map<bool?, String>> timeEntries;

  const MyPayTile({
    Key? key,
    required this.name,
    required this.date,
    required this.totalHours,
    required this.timeEntries,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    var theme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(5),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(date, style:TextStyle(fontSize: 16, fontWeight: FontWeight.bold) ),
                  SizedBox(height: height*0.02,),
                  Container(
                    child: Text(
                      'Name :Sameer',style: theme.displayMedium,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text(
                      "salary : 50,000",overflow:TextOverflow.ellipsis,style: theme.displayMedium,
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
              children: [
                InkWell(
                  onTap: (){
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                          'Paid!',
                          style: theme.headlineSmall?.copyWith(
                              color: Colors.white
                          )
                      ),
                    ),
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(

                      borderRadius:
                      BorderRadius.circular(10),


                      color: AppColor.tapColor,
                    ),
                  ),
                ),
              ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
