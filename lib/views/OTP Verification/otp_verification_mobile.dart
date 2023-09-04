import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/utils/ui_utils.dart';
import 'package:ClockSpotter/viewmodels/login_viewmodel.dart';
import 'package:ClockSpotter/viewmodels/otp_viewmodel.dart';
import 'package:ClockSpotter/views/login/login_view.dart';
import 'package:ClockSpotter/widgets/app_drawer/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:ClockSpotter/viewmodels/forgot_viewmodel.dart';
import 'package:ClockSpotter/widgets/base_model_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class OTPMobilePortrait extends BaseModelWidget<OTPViewModel>
    with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, OTPViewModel model) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return LayoutBuilder(
      builder: (context, constraints) {
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
        var theme = Theme.of(context).textTheme;


        return SafeArea(
          child: Scaffold(
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
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            child: Image.asset(
                                'assets/images/login/loginElement.png',
                                height: height*0.14


                            ),
                          ),
                        ),
                        SizedBox(height: height*0.02,),
                        Text(
                          'Verification Code',
                          style: TextStyle(
                            fontFamily: 'Iceland',
                            color: Colors.white,
                            fontSize: width * 0.11,
                          ),
                        ),
                        SizedBox(height: height*0.02,),
                        Stack(
                          children: [
                            Image.asset('assets/images/login/OTPRect.png',fit: BoxFit.cover,width: width,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  SizedBox(height: height*0.06,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'We have sent OTP on your WhatsApp  '
                                        ,style: theme.displayMedium?.copyWith(


                                    color: AppColor.backgroundColor,
                                        fontWeight: FontWeight.bold
                                    ),
                                    ),
                                  ),
                                  SizedBox(height: height*0.02,),

                                  Column(

                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      SizedBox(height: height*0.01,),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 40),
                                        child:model.isLoading==true?CircularProgressIndicator(color: AppColor.backgroundColor,): PinCodeTextField(
                                            // controller: model.textEditingController,
                                          appContext: context,
                                            cursorColor: Colors.black,
                                          length: 4,
                                          obscureText: false,
                                          animationType: AnimationType.fade,
                                          pinTheme: PinTheme(
                                            inactiveColor: AppColor.backgroundColor,
                                            activeColor: AppColor.backgroundColor,
                                            inactiveFillColor: Colors.white,
                                            activeFillColor: Colors.white,

                                            shape: PinCodeFieldShape.box,
                                            borderRadius: BorderRadius.circular(5),
                                            fieldHeight: 40,
                                            fieldWidth: 40,
                                          ),
                                          animationDuration: Duration(milliseconds: 300),
                                            boxShadows: [
                                              BoxShadow(
                                                color: Colors.orange.withOpacity(
                                                    0.5), // shadow color
                                                spreadRadius:
                                                2, // how spread out the shadow is
                                                blurRadius:
                                                5, // how blurry the shadow is
                                                offset: Offset(
                                                    0, 1), // offset of the shadow
                                              ),
                                            ],

                                          onCompleted: (v) {
                                            model.handleOTPVerification();
                                          },

                                          onChanged: (value) {

                                          },
                                          beforeTextPaste: (text) {
                                            print("Allowing to paste $text");
                                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                            return true;
                                          }
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: height * 0.02  ),
                                  RichText(
                                    text: TextSpan(
                                      text: ' Didn’t receive an OTP ? ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black
                                      ),
                                      children:  <TextSpan>[
                                        TextSpan(text: 'Resend OTP', style: TextStyle( color:Colors.blue,fontWeight: FontWeight.bold)
                                        ),

                                      ],
                                    ),
                                  ),

                                  SizedBox(height: height * 0.024),

                                ],
                              ),
                            )
                          ],
                        ),

                        Padding(
                          padding:  EdgeInsets.only(top: height*0.03,left: height*0.02),
                          child: Row(
                            children: [
                              Text(
                                "Incorrect mobile number? ",
                                style: TextStyle(
                                  color: AppColor.textColorWhite,
                                  fontSize: width * 0.04,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  model.rememberedPassword();
                                },
                                child: Text(
                                  'go to Register',
                                  style: TextStyle(
                                    color: AppColor.textColorWhite,
                                    fontSize: width * 0.048,
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
      },
    );
  }
}

// return Scaffold(
//     backgroundColor: Colors.white,
//     body: SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           Container(
//             height: 400,
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage('assets/images/login/bg.png'),
//                     fit: BoxFit.fill
//                 )
//             ),
//             child:Container(
//               color: Colors.black.withOpacity(0.3),
//               child: Stack(
//                 children: <Widget>[
//                   Positioned(
//                     left: 30,
//                     width: 80,
//                     height: 200,
//                     child:  Container(
//                       decoration: const BoxDecoration(
//                           image: DecorationImage(
//                               image: AssetImage('assets/images/login/light-1.png')
//                           )
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 140,
//                     width: 80,
//                     height: 150,
//                     child:Container(
//                       decoration: const BoxDecoration(
//                           image: DecorationImage(
//                               image: AssetImage('assets/images/login/light-2.png')
//                           )
//                       ),
//                     ),
//
//                   ),
//                   Positioned(
//                     right: 40,
//                     top: 40,
//                     width: 80,
//                     height: 150,
//                     child: Container(
//                       decoration: const BoxDecoration(
//                           image: DecorationImage(
//                               image: AssetImage('assets/images/login/clock.png')
//                           )
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     child: Container(
//                       margin: const EdgeInsets.only(top: 50),
//                       child: const Center(
//                         child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
//                       ),
//                     ),
//                   )
//                 ],
//               ),),
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
//                             offset: Offset(0, 10)
//                         )
//                       ]
//                   ),
//                   child: Column(
//                     children: <Widget>[
//                       Container(
//                         padding: const EdgeInsets.all(8.0),
//                         decoration: BoxDecoration(
//                             border: Border(bottom: BorderSide(color: Colors.grey[100]!))
//                         ),
//                         child: TextField(
//                           controller: model.emailController,
//                           decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: "Email",
//                               hintStyle: TextStyle(color: Colors.grey[400])
//                           ),
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
//                                 model.passwordVisible ? Icons.visibility : Icons.visibility_off,
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
//                 const SizedBox(height: 30,),
//                 GestureDetector(
//                   onTap: () {
//                     // Handle container click
//                     model.loginClicked();
//                   },
//                   child: Ink(
//                     decoration: BoxDecoration(
//                       color: HexColor('#f56624'),
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child:   Container(
//                       height: 50,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: HexColor('484948'),
//                       ),
//                       child: const Center(
//                         child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
//                       ),
//                     ),),),
//
//                 const SizedBox(height: 20,), // You can adjust the space between Login and Register button
//                 GestureDetector(
//                   onTap: () {
//                     // Navigate to register page or handle container click
//                       model.RegisterClicked();
//                   },
//                   child: Ink(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10.0),
//                       border: Border.all(color: HexColor('484948')), // Let's make the Register button with border only
//                     ),
//                     child: Container(
//                       height: 50,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.white, // Let's make the Register button with white background
//                       ),
//                       child:  Center(
//                         child: Text("Register", style: TextStyle(color: HexColor('484948'), fontWeight: FontWeight.bold),),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 70,),
//                 //  const Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),),
//               ],
//             ),
//           ),
//         ],
//       ),
//     )
// );
//   }
// }

class OTPMobileLandscape extends BaseModelWidget<OTPViewModel> {
  @override
  Widget build(BuildContext context, OTPViewModel model) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LoginSecondView(
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
