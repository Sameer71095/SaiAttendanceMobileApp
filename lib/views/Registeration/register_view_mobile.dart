/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'package:ClockSpotter/viewmodels/register_viewmodel.dart';
import 'package:ClockSpotter/views/Registeration/register_view.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ClockSpotter/viewmodels/login_viewmodel.dart';
import 'package:ClockSpotter/views/login/login_view.dart';
import 'package:ClockSpotter/widgets/app_drawer/app_drawer.dart';
import 'package:ClockSpotter/widgets/base_model_widget.dart';
import 'dart:math';
import 'dart:async';
import 'package:flutter_svg/svg.dart';

class RegisterMobilePortrait extends BaseModelWidget<RegisterViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, RegisterViewModel model) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height * 0.21,
            decoration: BoxDecoration(
              color: Colors.blue.shade700,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Positioned(
                  top: 155,
                  right: 60,
                  child: Image.asset(
                    'assets/images/login/1b.png',
                    width: 200,
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 20,
                  child: Container(
                    child: Image.asset(
                      'assets/images/login/loginElement.png',
                      height: 270,
                      width: 300,
                    ),
                  ),
                ),
                Positioned(
                  top: 260,
                  left: 20,
                  child: Container(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 16), // Adjust the padding as needed

                          filled: true,
                          fillColor: Colors.grey.shade300,
                          hintText: 'Username',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 16), // Adjust the padding as needed

                          filled: true,
                          fillColor: Colors.grey.shade300,
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          prefixIcon: Icon(
                            Icons.alternate_email,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 16), // Adjust the padding as needed

                          filled: true,
                          fillColor: Colors.grey.shade300,
                          hintText: 'Mobile Number',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 16), // Adjust the padding as needed

                          filled: true,
                          fillColor: Colors.grey.shade300,
                          hintText: 'Company Name',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          prefixIcon: Icon(
                            Icons.work,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        obscureText: model.passwordVisible,
                        controller: model.passwordController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 16), // Adjust the padding as needed

                          filled: true,
                          fillColor: Colors.grey.shade300,
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          suffixIcon: IconButton(
                            color: Colors.grey,
                            icon: Icon(

                              model.passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              model.onPasswordVisibility();
                            },
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // TextField(
                      //   obscureText: true,
                      //   decoration: InputDecoration(
                      //     contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16), // Adjust the padding as needed
                      //
                      //     filled: true,
                      //     fillColor: Colors.grey.shade300,
                      //     hintText: 'Confirm Password',
                      //     hintStyle: TextStyle(
                      //       color: Colors.grey,
                      //     ),
                      //     prefixIcon: Icon(
                      //       Icons.lock,
                      //       color: Colors.grey,
                      //     ),
                      //     suffixIcon: Icon(
                      //       Icons.visibility_off,
                      //       color: Colors.grey,
                      //     ),
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(30),
                      //     ),
                      //   ),
                      // ),

                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          model.registerClicked();
                          // Perform login action
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              model.alreadyClicked();
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    // return Scaffold(
    //     backgroundColor: Colors.white,
    //     body: SingleChildScrollView(
    //       child: Column(
    //         children: <Widget>[
    //           Container(
    //             height: 180,
    //             decoration: const BoxDecoration(
    //                 image: DecorationImage(
    //                     image: AssetImage('assets/images/login/bg.png'),
    //                     fit: BoxFit.fill)),
    //             child: Container(
    //               color: Colors.black.withOpacity(0.3),
    //               child: Stack(
    //                 children: <Widget>[
    //                   Positioned(
    //                     left: 30,
    //                     width: 80,
    //                     height: 90,
    //                     child: Container(
    //                       decoration: const BoxDecoration(
    //                           image: DecorationImage(
    //                               image: AssetImage(
    //                                   'assets/images/login/light-1.png'))),
    //                     ),
    //                   ),
    //                   Positioned(
    //                     left: 140,
    //                     width: 80,
    //                     height: 60,
    //                     child: Container(
    //                       decoration: const BoxDecoration(
    //                           image: DecorationImage(
    //                               image: AssetImage(
    //                                   'assets/images/login/light-2.png'))),
    //                     ),
    //                   ),
    //                   Positioned(
    //                     right: 40,
    //                     top: 40,
    //                     width: 30,
    //                     height: 50,
    //                     child: Container(
    //                       decoration: const BoxDecoration(
    //                           image: DecorationImage(
    //                               image: AssetImage(
    //                                   'assets/images/login/clock.png'))),
    //                     ),
    //                   ),
    //                   Positioned(
    //                     child: Container(
    //                       margin: const EdgeInsets.only(top: 80),
    //                       child: const Center(
    //                         child: Text(
    //                           "Register",
    //                           style: TextStyle(
    //                               color: Colors.white,
    //                               fontSize: 40,
    //                               fontWeight: FontWeight.bold),
    //                         ),
    //                       ),
    //                     ),
    //                   )
    //                 ],
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(30.0),
    //             child: Column(
    //               children: <Widget>[
    //                 Container(
    //                   padding: const EdgeInsets.all(5),
    //                   decoration: BoxDecoration(
    //                       color: Colors.white,
    //                       borderRadius: BorderRadius.circular(10),
    //                       boxShadow: const [
    //                         BoxShadow(
    //                             color: Color.fromRGBO(143, 148, 251, .2),
    //                             blurRadius: 20.0,
    //                             offset: Offset(0, 10))
    //                       ]),
    //                   child: Column(
    //                     children: <Widget>[
    //                       Container(
    //                         padding: const EdgeInsets.all(8.0),
    //                         decoration: BoxDecoration(
    //                             border: Border(
    //                                 bottom:
    //                                     BorderSide(color: Colors.grey[100]!))),
    //                         child: TextField(
    //                           controller: model.nameController,
    //                           decoration: InputDecoration(
    //                               border: InputBorder.none,
    //                               hintText: "Name",
    //                               hintStyle:
    //                                   TextStyle(color: Colors.grey[400])),
    //                         ),
    //                       ),
    //                       Container(
    //                         padding: const EdgeInsets.all(8.0),
    //                         decoration: BoxDecoration(
    //                             border: Border(
    //                                 bottom:
    //                                     BorderSide(color: Colors.grey[100]!))),
    //                         child: TextField(
    //                           controller: model.emailController,
    //                           decoration: InputDecoration(
    //                               border: InputBorder.none,
    //                               hintText: "Email",
    //                               hintStyle:
    //                                   TextStyle(color: Colors.grey[400])),
    //                         ),
    //                       ),
    //                       Container(
    //                         padding: const EdgeInsets.all(8.0),
    //                         decoration: BoxDecoration(
    //                             border: Border(
    //                                 bottom:
    //                                     BorderSide(color: Colors.grey[100]!))),
    //                         child: TextField(
    //                           controller: model.contactController,
    //                           decoration: InputDecoration(
    //                               border: InputBorder.none,
    //                               hintText: "Contact",
    //                               hintStyle:
    //                                   TextStyle(color: Colors.grey[400])),
    //                         ),
    //                       ),
    //                       Container(
    //                         padding: const EdgeInsets.all(8.0),
    //                         decoration: BoxDecoration(
    //                             border: Border(
    //                                 bottom:
    //                                     BorderSide(color: Colors.grey[100]!))),
    //                         child: TextField(
    //                           controller: model.companyNameController,
    //                           decoration: InputDecoration(
    //                               border: InputBorder.none,
    //                               hintText: "Company Name",
    //                               hintStyle:
    //                                   TextStyle(color: Colors.grey[400])),
    //                         ),
    //                       ),
    //                       Container(
    //                         padding: const EdgeInsets.all(8.0),
    //                         child: TextField(
    //                           controller: model.passwordController,
    //                           obscureText: !model.passwordVisible,
    //                           decoration: InputDecoration(
    //                             border: InputBorder.none,
    //                             hintText: "Password",
    //                             hintStyle: TextStyle(color: Colors.grey[400]),
    //                             suffixIcon: IconButton(
    //                               icon: Icon(
    //                                 model.passwordVisible
    //                                     ? Icons.visibility
    //                                     : Icons.visibility_off,
    //                               ),
    //                               onPressed: () {
    //                                 model.onPasswordVisibility();
    //                               },
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 const SizedBox(
    //                   height: 30,
    //                 ),
    //
    //                 // You can adjust the space between Login and Register button
    //                 GestureDetector(
    //                   onTap: () {
    //                     model.showDialog(context: context, builder: (BuildContext context) => OTPDialogBox());
    //                     // Navigate to register page or handle container click
    //                     //     model.registerClicked();
    //                   },
    //                   child: Ink(
    //                     decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(10.0),
    //                       border: Border.all(
    //                           color: HexColor(
    //                               '484948')), // Let's make the Register button with border only
    //                     ),
    //                     child: Container(
    //                       height: 50,
    //                       decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(10),
    //                         color: Colors
    //                             .white, // Let's make the Register button with white background
    //                       ),
    //                       child: Center(
    //                         child: Text(
    //                           "Register",
    //                           style: TextStyle(
    //                               color: HexColor('484948'),
    //                               fontWeight: FontWeight.bold),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 const SizedBox(
    //                   height: 20,
    //                 ),
    //                 GestureDetector(
    //                   onTap: () {
    //                     // Handle container click
    //                     model.alreadyClicked();
    //                   },
    //                   child: Ink(
    //                     decoration: BoxDecoration(
    //                       color: HexColor('#f56624'),
    //                       borderRadius: BorderRadius.circular(10.0),
    //                     ),
    //                     child: Container(
    //                       height: 50,
    //                       decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(10),
    //                         color: HexColor('484948'),
    //                       ),
    //                       child: const Center(
    //                         child: Text(
    //                           "Already have an account",
    //                           style: TextStyle(
    //                               color: Colors.white,
    //                               fontWeight: FontWeight.bold),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 const SizedBox(
    //                   height: 70,
    //                 ),
    //                 //  const Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ));
  }
}

class OTPDialogBox extends BaseModelWidget<RegisterViewModel> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context, RegisterViewModel model) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Enter OTP',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                hintText: 'Enter OTP',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey[400]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[400]!,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Ink(
                      child: Text(
                    'Cancel',
                    style: TextStyle(
                        color: HexColor('484948'), fontWeight: FontWeight.bold),
                  )),
                ),
                SizedBox(width: 17.0),
                GestureDetector(
                  child: Ink(
                    decoration: BoxDecoration(
                      color: HexColor('#f56624'),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      height: 40,
                      width: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor('484948'),
                      ),
                      child: const Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterMobileLandscape extends BaseModelWidget<RegisterViewModel> {
  @override
  Widget build(BuildContext context, RegisterViewModel model) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => RegisterSecondView(
                    key: new Key("test"),
                  )));
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
          ),
        ],
      ),
    );
  }
}
