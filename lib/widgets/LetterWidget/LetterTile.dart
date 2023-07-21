import 'package:ClockSpotter/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LetterTile extends StatelessWidget {
  final String name;
  final String date;
  final String totalHours;
  final int index;
  final List<Map<bool?, String>> timeEntries;

  const LetterTile({
    Key? key,
    required this.name,
    required this.date,
    required this.totalHours,
    required this.timeEntries, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;

    return Column(

      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 13, color: Colors.black),
                children: [
                  TextSpan(text: date, style:TextStyle(fontSize: 16, fontWeight: FontWeight.bold) ),
                  TextSpan(text:'| Letter Type :Regular', style:TextStyle(fontSize: 16, fontWeight: FontWeight.bold) ),

                ],
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      Text("Starting Date:"+date, style:TextStyle(fontSize: 12, fontWeight: FontWeight.bold) ),
                      SizedBox(height: 5,),
                      Text("Requested On:"+date, style:TextStyle(fontSize: 12,fontWeight: FontWeight.bold) ),
                      SizedBox(height: 5,),

                      Text("Approved On:"+date, style:TextStyle(fontSize: 12, fontWeight: FontWeight.bold) ),

                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  flex: 2,
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
                              child:index==0? Container(
                                child: Center(
                                  child:  Text(
                                      'Approved!',
                                      style: theme.headlineSmall?.copyWith(
                                          color: Colors.white,
                                        fontSize: 14
                                      )
                                  )
                                ),
                                height: 35,
                                width:  100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.green
                                  ),

                                  borderRadius:
                                  BorderRadius.circular(10),


                                  color: Colors.green.shade500,
                                ),
                              ): Container(
                                child: Center(
                                    child:  Text(
                                        'Pending!',
                                        style: theme.headlineSmall?.copyWith(
                                            color: Colors.white,
                                            fontSize: 14
                                        )
                                    )
                                ),
                                height: 35,
                                width:  100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColor.tapBorder

                                  ),

                                  borderRadius:
                                  BorderRadius.circular(10),


                                  color: AppColor.tapColor
                                ),
                              ),
                            ),

                           index==0? Padding(
                             padding: EdgeInsets.all(5),
                             child: Text('Download Letter',style: TextStyle(fontSize:12,color: AppColor.primaryColor,decoration: TextDecoration.underline),),
                           ):Text('')
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
