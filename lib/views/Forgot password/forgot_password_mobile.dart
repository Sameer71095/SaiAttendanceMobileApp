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
        final double height = constraints.maxHeight;
        final double width = constraints.maxWidth;

        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                if (!isKeyboard)
                  Container(
                    height: height * 0.43,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade700,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.all(width * 0.05),
                  child: Stack(
                    children: [
                      if (!isKeyboard)
                        Positioned(
                          top: height * 0.05,
                          left: width * 0.03,
                          child: Container(
                            child: Image.asset(
                              'assets/images/login/forgotElement.png',
                              width: width * 0.9,
                            ),
                          ),
                        ),
                      Positioned(
                        top: height * 0.01,
                        child: IconButton(
                          onPressed: () {
                          Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      CustomScrollView(
                        scrollDirection: Axis.vertical,
                        slivers: [
                          SliverFillRemaining(
                              hasScrollBody: false,
                              child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: !isKeyboard
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(width * 0.04),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (isKeyboard)
                                                Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Container(
                                                    child: Image.asset(
                                                      'assets/images/login/forgotElement.png',
                                                      width: width * 0.4,
                                                    ),
                                                  ),
                                                ),
                                              Text(
                                                'Forgot \nPassword ?',
                                                style: TextStyle(
                                                  color: Colors.blue.shade900,
                                                  fontSize: width * 0.1,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: height * 0.03),
                                              TextField(
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical:
                                                              height * 0.02,
                                                          horizontal:
                                                              width * 0.04),
                                                  filled: true,
                                                  fillColor:
                                                      Colors.grey.shade300,
                                                  hintText: 'Email',
                                                  hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                  prefixIcon: Icon(
                                                    Icons.alternate_email,
                                                    color: Colors.grey,
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            height * 0.1),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: height * 0.03),
                                              GestureDetector(
                                                onTap: () {
                                                  // Perform submit action
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: height * 0.015),
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            height * 0.2),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Submit',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: width * 0.05,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.02,
                                      ),
                                    ],
                                  ))),
                        ],
                      ),
                    ],
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

class LoginMobileLandscape extends BaseModelWidget<LoginViewModel> {
  @override
  Widget build(BuildContext context, LoginViewModel model) {
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
