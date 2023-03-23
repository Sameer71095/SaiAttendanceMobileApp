/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:sai_attendance/viewmodels/home_viewmodel.dart';
import 'package:sai_attendance/widgets/app_drawer/app_drawer.dart';
import 'package:sai_attendance/widgets/base_model_widget.dart';

import '../../utils/Home_Clipper.dart';
import '../../widgets/app_drawer/Drawer_Screen.dart';
import 'home_view.dart';
import 'dart:math';

class HomeMobilePortrait extends BaseModelWidget<HomeViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, HomeViewModel model) {

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(left: 60, top: 60),
                child: model.button1 ? _buildPageWidget(model) : Container()),

            ///
            ///
            /// Create Appbar
            ///
            ///
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding:
                const EdgeInsets.only(top: 40.0, left: 80.0, right: 20.0),
                child: _customAppBar(),),),
            Container(
              color: HexColor('484848'),
              height: MediaQuery.of(context).size.height,
              width: 60,
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_, __, ___) =>
                          new drawerProfileScreen()));
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(bottom: 16, top: 17.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Icon(Icons.menu),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ///
            ///
            /// Create left bottom nav bar
            ///
            ///
            Positioned(
              bottom: 200,
              child: Transform.rotate(
                angle: 3.141592653589793 / 2,
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        _buildMenu("Fash Food", 0,model),
                        _buildMenu("Healty Food", 1,model),
                      ],
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: EdgeInsets.only(left: model.paddingLeft),
                      width: 150,
                      height: 75,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: ClipPath(
                              clipper: AppClipper(),
                              child: Container(
                                width: 150,
                                height: 60,
                                color: HexColor('484848'),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Transform.rotate(
                              angle: 3.141592653589793 / 2,
                              child: const Padding(
                                padding: EdgeInsets.only(right: 40),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenu(String menu, int index,HomeViewModel model) {
    return GestureDetector(
      onTap: () {
        model.buildMenu(index);
      },
      child: Container(
        width: 150,
        padding: const EdgeInsets.only(top: 16),
        child: Center(
          child: Text(
            menu,
            style: const TextStyle(
                fontSize: 18, color: Colors.white, fontFamily: "Sofia"),
          ),
        ),
      ),
    );
  }

  Widget _customAppBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RichText(
            text: TextSpan(
              text: "Hello,\n",
              style: const TextStyle(
                  color: Colors.black, fontFamily: "Sofia", fontSize: 17.0),
              children: [
                TextSpan(
                  text: "Muhammad Sameer",
                  style: TextStyle(
                    color: HexColor('f47320'),
                    fontWeight: FontWeight.bold,
                    fontSize: 19.0,
                    height: 1.0,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            height: 50.0,
            width: 50.0,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      "https://media.licdn.com/dms/image/C5603AQFs8d7ns-mD2g/profile-displayphoto-shrink_400_400/0/1605026303861?e=1683763200&v=beta&t=_ngBHfnnyWfAJbrvL9MsdlG3VR7c48YsHaiSg0043Ww",
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(150.0))),
          ),
        ],
      ),
    );
  }

  Widget _buildPageWidget(HomeViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(child:
          Container(
            height: 130.0,
            width: MediaQuery.of(model.context).size.width-15,
            margin: const EdgeInsets.only(
              top: 20,
              bottom: 20,
              left: 10,
              right: 10

            ),
            padding: const EdgeInsets.only(
                left: 5, top: 20.0, right: 5),
            decoration: BoxDecoration(
              color: const Color(0xFF5FBD84).withOpacity(0.1),
              borderRadius: const BorderRadius.all(
                Radius.circular(32),
              ),
            ),
            child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Text(
                          DateFormat('dd MMM yyyy').format(DateTime.now()),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: "Sofia"),

                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Checked in at 9:00 AM' ,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              fontFamily: "Sofia"),

                        ),
                        const SizedBox(height: 5.0),
                        const Text(
                          'Shift ends at 6:00 PM' ,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              fontFamily: "Sofia"),

                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        const Text(
                          'Current Status',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 16.0),
                        model.isLoading
                            ? const CircularProgressIndicator()
                            : model.isCheckedIn
                            ? GestureDetector(
                          onTap: () {
                            // Handle container click
                       //     model.loginClicked();
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              color: HexColor('#f56624'),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child:   Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: HexColor('484948'),
                              ),
                              child: const Center(
                                child: AutoSizeText("Check-Out", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              ),
                            ),),)

                  :  GestureDetector(
                          onTap: () {
                            // Handle container click
                       //     model.loginClicked();
                            model.onCheckInClicked();
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              color: HexColor('#f56624'),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child:   Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: HexColor('484948'),
                              ),
                              child: const Center(
                                child: AutoSizeText("Check-In", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              ),
                            ),),),

                      ],
                    ),
                  ],
                ),

          ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40),
            child: Text(
              "History",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                  fontFamily: "Sofia"),
            ),
          ),
          _buildList(model),
        ],
      ),
    );
  }

  Widget _buildList(HomeViewModel model) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: model.attendanceList.length,
      padding: const EdgeInsets.only(
        left: 40,
        bottom: 16,
        right: 5,
        top: 20,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {

          },
          child: Container(
            padding: const EdgeInsets.only(left: 8, top: 10.0, bottom: 10.0),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF5FBD84).withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            child: Row(
              children: <Widget>[
                /*   Image(
                  width: 80.0,
                  height: 80.0,
                  image: NetworkImage(model.attendanceList[index].imgPath!),
                ),
                SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${foodHealtyList[index].name}",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Sofia",
                          fontWeight: FontWeight.w700),
                    ),
                    Container(
                      width: 150.0,
                      child: Text(
                        "Spesial menu from foodie apps",
                        style: TextStyle(
                            fontFamily: "Sofia",
                            fontWeight: FontWeight.w400,
                            color: Colors.black38),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "\$${foodHealtyList[index].price!.toInt()}",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF5FBD84),
                        fontFamily: "Sofia",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                )*/
              ],
            ),
          ),
        );
      },
    );
  }

}

class HomeMobileLandscape extends BaseModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SecondView(key: new Key("test"),)));
        },
      ),
      body: Row(
        children: <Widget>[
          const AppDrawer(),
          Expanded(
            child: Center(
              child: Text(
                model.title,
                style: const TextStyle(fontSize: 35),
              ),
            ),
          )
        ],
      ),
    );
  }
}
