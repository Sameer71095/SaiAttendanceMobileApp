
import 'package:ClockSpotter/views/leaveRequest/leaverequest_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ClockSpotter/utils/Constants.dart';
import 'package:ClockSpotter/views/login/login_view.dart';
import 'package:ClockSpotter/views/registerface/registerface_view.dart';

import '../../api/secureCacheManager.dart';

class drawerProfileScreen extends StatefulWidget {
  drawerProfileScreen({Key? key}) : super(key: key);

  @override
  _drawerProfileScreenState createState() => _drawerProfileScreenState();
}

class _drawerProfileScreenState extends State<drawerProfileScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //brightness: Brightness.dark,
        elevation: 0.0,
        backgroundColor: HexColor('484848'),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300.0,
              color: HexColor('484848'),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  <Widget>[
                          Text(constants.loginData.name!,
                            style: const TextStyle(
                                fontFamily: "Sofia",
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 19.0),),
                          Text("Email: ${constants.loginData.email}",
                              style: const TextStyle(
                                  fontFamily: "Sofia",
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                  fontSize: 16.0)),
                          SizedBox(
                            height: 20.0,
                          ),
                          /*               Container(
                            height: 35.0,
                            width: 90.0,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white, width: 1.1)),
                            child: Center(
                              child: Text(
                                "EDIT",
                                style: TextStyle(
                                    fontFamily: "Sofia",
                                    color: Colors.white,
                                    fontSize: 13.0),
                              ),
                            ),
                          )*/
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Container(
                        height: 70.0,
                        width: 70.0,
                        decoration: const BoxDecoration(
                        /*    image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  "https://media.licdn.com/dms/image/C5603AQFs8d7ns-mD2g/profile-displayphoto-shrink_400_400/0/1605026303861?e=1683763200&v=beta&t=_ngBHfnnyWfAJbrvL9MsdlG3VR7c48YsHaiSg0043Ww",
                                ),
                                fit: BoxFit.cover),*/
                            borderRadius:
                            BorderRadius.all(Radius.circular(150.0))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0)),
                    color: Colors.white),
                child: Padding(
                  padding:
                  const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        /*   InkWell(
                            onTap: () {
                              Navigator.of(context).push(PageRouteBuilder(
                                  pageBuilder: (_, __, ___) =>
                                      LoginView()));
                            },
                            child: _listText("My Bag", Icons.shopping_basket)),*/
                       /* _listText("Notification", Icons.notifications),
                        _listText("Settings", Icons.settings),*/
                        InkWell(onTap: () async {  // Navigate to home screen
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              transitionDuration: const Duration(milliseconds: 300),
                              pageBuilder: (context, animation, secondaryAnimation) => LeaveRequestView(),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                return SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(-1.0, 0.0),
                                    end: Offset.zero,
                                  ).animate(animation),
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                          child: _listText("Leave Request", Icons.leave_bags_at_home),
                        ),
                        InkWell(onTap: () async {  // Navigate to home screen
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              transitionDuration: const Duration(milliseconds: 300),
                              pageBuilder: (context, animation, secondaryAnimation) => RegisterFaceView(),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                return SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(-1.0, 0.0),
                                    end: Offset.zero,
                                  ).animate(animation),
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                          child: _listText("Re-Register Face", Icons.face),
                        ),
                        InkWell(onTap: () async {  // Navigate to home screen
                          await storage.deleteAll(); // Delete all existing keys and values
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              transitionDuration: const Duration(milliseconds: 300),
                              pageBuilder: (context, animation, secondaryAnimation) => LoginView(),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                return SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(-1.0, 0.0),
                                    end: Offset.zero,
                                  ).animate(animation),
                                  child: child,
                                );
                              },
                            ),
                          );},
                          child: _listText("Logout", Icons.exit_to_app),
                        )
                        ,],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _listText(String _text, IconData _iconData) {
  return Padding(
    padding: EdgeInsets.only(bottom: 30.0),
    child: Row(
      children: <Widget>[
        Container(
          height: 45.0,
          width: 45.0,
          decoration: BoxDecoration(
            color: Colors.black12.withOpacity(0.03),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          child: Center(
            child: Icon(
              _iconData,
              color: Colors.black38,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Text(
          _text,
          style: TextStyle(
              fontFamily: "Sofia",
              fontWeight: FontWeight.w600,
              color: Colors.black87.withOpacity(0.6),
              fontSize: 16.0),
        )
      ],
    ),
  );
}

