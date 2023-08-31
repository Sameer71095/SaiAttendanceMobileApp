import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/viewmodels/register_viewmodel.dart';
import 'package:ClockSpotter/views/Registeration/register_view.dart';
import 'package:ClockSpotter/widgets/app_drawer/app_drawer.dart';
import 'package:ClockSpotter/widgets/base_model_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class RegisterMobilePortrait extends BaseModelWidget<RegisterViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, RegisterViewModel model) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final isKeyboard=MediaQuery.of(context).viewInsets.bottom!=0;
    var theme = Theme.of(context).textTheme;
    double fontSize=12;
    double sizeBoxTextField=height*0.016;
    double sizeBoxlabel=height*0.007;



    return SafeArea(
      child:  Scaffold(
        body: Stack(
          children: [
            // if(!isKeyboard)
            Container(
              // height: height * 0.49,
              decoration: BoxDecoration(
                color: AppColor.loginBackground,
                // borderRadius: BorderRadius.only(
                //   bottomLeft: Radius.circular(60),
                //   bottomRight: Radius.circular(60),
                // ),
              ),
            ),

            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // if(!isKeyboard)

                    // if(!isKeyboard)
                    Image.asset(
                        'assets/images/login/loginElement.png',


                    ),
                    // SizedBox(height: height*0.008,),
                    Text(
                      'Register',
                      style: TextStyle(
                        fontFamily: 'Iceland',
                        color: Colors.white,
                        fontSize: width * 0.117,
                      ),
                    ),
                    Stack(
                      children: [
                        Image.asset('assets/images/register/Register.png',fit: BoxFit.cover,width: width,height: height*0.687,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              SizedBox(height: height*0.06,),
                              //username
                              Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Username',
                                      style: TextStyle(
                                        color: AppColor.backgroundColor,
                                        fontSize: fontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: sizeBoxlabel,),
                                  TextField(
                                    decoration: InputDecoration(
                                      enabledBorder:  OutlineInputBorder(
                                        borderRadius:  BorderRadius.circular(8.0),
                                        borderSide:  BorderSide(color: AppColor.backgroundColor ),

                                      ),
                                      focusedBorder:  OutlineInputBorder(
                                        borderRadius:  BorderRadius.circular(8.0),
                                        borderSide:  BorderSide(color: AppColor.backgroundColor ),

                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: height * 0.015,
                                        horizontal: width * 0.04,
                                      ),
                                      filled: true,
                                      fillColor: AppColor.backgroundContainer,
                                      // hintText: 'Username',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      prefixIcon: Icon(

                                        Icons.person,
                                        color: AppColor.backgroundColor,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: sizeBoxTextField ),
                             //email
                              Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Email',
                                      style: TextStyle(
                                        color: AppColor.backgroundColor,
                                        fontSize: fontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: sizeBoxlabel),
                                  TextField(
                                    controller: model.emailController,
                                    decoration: InputDecoration(
                                      enabledBorder:  OutlineInputBorder(
                                        borderRadius:  BorderRadius.circular(8.0),
                                        borderSide:  BorderSide(color: AppColor.backgroundColor ),

                                      ),
                                      focusedBorder:  OutlineInputBorder(
                                        borderRadius:  BorderRadius.circular(8.0),
                                        borderSide:  BorderSide(color: AppColor.backgroundColor ),

                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: height * 0.015,
                                        horizontal: width * 0.04,
                                      ),
                                      filled: true,
                                      fillColor: AppColor.backgroundContainer,
                                      // hintText: 'Username',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.alternate_email,
                                        color: AppColor.backgroundColor,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: sizeBoxTextField  ),
                              //Mobile Number
                              Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Mobile Number',
                                      style: TextStyle(

                                        color: AppColor.backgroundColor,
                                        fontSize: fontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: sizeBoxlabel,),
                                  TextField(
                                    keyboardType:TextInputType.number,
                                    decoration: InputDecoration(
                                      enabledBorder:  OutlineInputBorder(
                                        borderRadius:  BorderRadius.circular(8.0),
                                        borderSide:  BorderSide(color: AppColor.backgroundColor ),

                                      ),
                                      focusedBorder:  OutlineInputBorder(
                                        borderRadius:  BorderRadius.circular(8.0),
                                        borderSide:  BorderSide(color: AppColor.backgroundColor ),

                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: height * 0.015,
                                        horizontal: width * 0.04,
                                      ),
                                      filled: true,
                                      fillColor: AppColor.backgroundContainer,
                                      // hintText: 'Username',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.phone,
                                        color: AppColor.backgroundColor,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: sizeBoxTextField ),
                              //Company Name
                              Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Comapany Name',
                                      style: TextStyle(
                                        color: AppColor.backgroundColor,
                                        fontSize: fontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: sizeBoxlabel),
                                  TextField(
                                    decoration: InputDecoration(
                                      enabledBorder:  OutlineInputBorder(
                                        borderRadius:  BorderRadius.circular(8.0),
                                        borderSide:  BorderSide(color: AppColor.backgroundColor ),

                                      ),
                                      focusedBorder:  OutlineInputBorder(
                                        borderRadius:  BorderRadius.circular(8.0),
                                        borderSide:  BorderSide(color: AppColor.backgroundColor ),

                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: height * 0.015,
                                        horizontal: width * 0.04,
                                      ),
                                      filled: true,
                                      fillColor: AppColor.backgroundContainer,
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.work,
                                        color: AppColor.backgroundColor,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: sizeBoxTextField ),
                              //password
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Password',
                                      style: TextStyle(
                                        color: AppColor.backgroundColor,
                                        fontSize: fontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: sizeBoxlabel,),
                                  TextField(
                                    obscureText: model.passwordVisible,
                                    controller: model.passwordController,
                                    decoration: InputDecoration(
                                      enabledBorder:  OutlineInputBorder(
                                        borderRadius:  BorderRadius.circular(8.0),
                                        borderSide:  BorderSide(color: AppColor.backgroundColor ),

                                      ),
                                      focusedBorder:  OutlineInputBorder(
                                        borderRadius:  BorderRadius.circular(8.0),
                                        borderSide:  BorderSide(color: AppColor.backgroundColor ),

                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: height * 0.015,
                                        horizontal: width * 0.04,
                                      ),
                                      filled: true,
                                      fillColor: AppColor.backgroundContainer,
                                      // hintText: 'Password',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: AppColor.backgroundColor,
                                      ),
                                      suffixIcon: IconButton(
                                        color: AppColor.backgroundColor,
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
                                ],
                              ),


                              SizedBox(height: height * 0.018),
                              GestureDetector(
                                onTap: () {
                                },
                                child: Container(
                                  height: height * 0.057,
                                  width: width * 0.35,
                                  decoration: BoxDecoration(
                                    color: AppColor.backgroundContainerSmall,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColor.backgroundColor.withOpacity(
                                            0.5), // shadow color
                                        spreadRadius:
                                        2, // how spread out the shadow is
                                        blurRadius:
                                        5, // how blurry the shadow is
                                        offset: Offset(
                                            0, 1), // offset of the shadow
                                      ),
                                    ],),
                                  child: Center(child: Text('Register',style: theme.displayMedium?.copyWith(

                                      color: AppColor.backgroundColor,
                                      fontWeight: FontWeight.bold
                                  ),),),
                                ),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),

                    Padding(
                      padding:  EdgeInsets.only(top: height*0.007,left: height*0.02),
                      child: Row(
                        children: [
                          Text(
                        "Already have an account? ",
                            style: TextStyle(
                              color: AppColor.textColorWhite,
                              fontSize: width * 0.044,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              model.alreadyClicked();
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: AppColor.textColorWhite,
                                fontSize: width * 0.054,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


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
//   }
// }



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
