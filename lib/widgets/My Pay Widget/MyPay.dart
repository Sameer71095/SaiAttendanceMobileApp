import 'package:ClockSpotter/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';

class MyPayTile extends StatelessWidget {
  final String name;
   final String date;

   MyPayTile({
    Key? key,
      required this.name,
     required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    var theme = Theme.of(context).textTheme;

    return  Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(
                0.5), // shadow color
            spreadRadius:
            2, // how spread out the shadow is
            blurRadius:
            5, // how blurry the shadow is
            offset: Offset(
                0, 1), // offset of the shadow
          ),
        ],
        color: AppColor.backgroundContainerSmall,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text( DateFormat('dd MMM yyyy').format(DateTime.now()),style: theme.titleSmall,),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Container(
                    constraints:  BoxConstraints(maxWidth: 150),
                    child: Text(
                      'Name :Sameer Masood',overflow:TextOverflow.ellipsis, style: theme.displayMedium,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    constraints:  BoxConstraints(maxWidth: 150),
                    child: Text(
                      "salary : 50,000",overflow:TextOverflow.ellipsis,style: theme.displayMedium,
                    ),
                  ),

                ],

              ),

              InkWell(
                onTap: (){
                },
                child: Container(
                  child: Center(
                    child: Text(
                        'Paid',
                        style: theme.headlineSmall?.copyWith(
                            color: Colors.white
                        )
                    ),
                  ),
                  height: 30,
                  width: 90,
                  decoration: BoxDecoration(

                    borderRadius:
                    BorderRadius.circular(10),


                    color: AppColor.tapColor,
                  ),
                ),
              )
            ],
          ),



        ],
      ),
    );

  }
}
