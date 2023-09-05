import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/viewmodels/login_viewmodel.dart';
import 'package:ClockSpotter/views/login/login_view.dart';
import 'package:ClockSpotter/widgets/app_drawer/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:ClockSpotter/viewmodels/forgot_viewmodel.dart';
import 'package:ClockSpotter/widgets/base_model_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';

class ForgotMobilePortrait extends BaseModelWidget<ForgotViewModel>
    with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, ForgotViewModel model) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return LayoutBuilder(
      builder: (context, constraints) {
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
        var theme = Theme.of(context).textTheme;


        return SafeArea(
          child: WillPopScope(
            onWillPop: ()async{
              model.willPopScopeNavigation();
              return true;
            },
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
                            'Forgot Account? ',
                            style: TextStyle(
                              fontFamily: 'Iceland',
                              color: Colors.white,
                              fontSize: width * 0.11,
                            ),
                          ),
                          SizedBox(height: height*0.02,),
                          Stack(
                            children: [
                              Image.asset('assets/images/login/loginRect.png',fit: BoxFit.cover,width: width,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    SizedBox(height: height*0.06,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Please enter your email address or HR Id to search for your account.'
                                          ,style: theme.displayMedium?.copyWith(


                                      color: AppColor.backgroundColor,
                                          fontWeight: FontWeight.bold
                                      ),
                                      ),
                                    ),
                                    SizedBox(height: height*0.04,),

                                    Column(

                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text(
                                            'Email / HR Id.',
                                            style: TextStyle(
                                              color: AppColor.backgroundColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: height*0.01,),
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
                                             hintText: 'Email Address or HR Id',
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                            ),
                                            prefixIcon: Icon(
                                              Icons.search,
                                              color: AppColor.backgroundColor,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height * 0.03  ),

                                    SizedBox(height: height * 0.024),
                                    GestureDetector(
                                      onTap: () {
                                        model.isLoading=true;
                                        model.forgetClicked();


                                      },
                                      child: Container(
                                        height: height * 0.06,
                                        width: width * 0.37,
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
                                        child: Center(child:model.isLoading==true?CircularProgressIndicator(strokeWidth: 3,color: AppColor.backgroundColor,) :Text('Reset Password',style: theme.displayMedium?.copyWith(

                                            color: AppColor.backgroundColor,
                                            fontWeight: FontWeight.bold
                                        ),
                                        ),
                                        ),
                                      ),
                                    ),

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
                                  "Remembered the password? Switch to ",
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
                                    'Login',
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

class ForgotMobileLandscape extends BaseModelWidget<ForgotViewModel> {
  @override
  Widget build(BuildContext context, ForgotViewModel model) {
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
