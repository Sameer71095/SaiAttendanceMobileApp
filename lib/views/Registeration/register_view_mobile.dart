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
      child:  WillPopScope(
        onWillPop: ()async{
          model.willPopScopeNavigation();
          return true;
        },

        child: Scaffold(
          body: Stack(
            children: [
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

                      Image.asset(
                          'assets/images/login/loginElement.png',
                          height: height*0.12


                      ),
                      Text(
                        'Register',
                        style: TextStyle(
                          fontFamily: 'Iceland',
                          color: Colors.white,
                          fontSize: width * 0.117,
                        ),
                      ),
                      // SizedBox(height: height*0.008,),
                      Stack(
                        children: [
                          Image.asset('assets/images/register/Register.png',fit: BoxFit.cover,width: width,height: height*0.678,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(

                              children: [
                                SizedBox(height: height*0.052,),
                                //username
                                Column(


                            crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Name',
                                        style: TextStyle(
                                          color: AppColor.backgroundColor,
                                          fontSize: fontSize,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: sizeBoxlabel,),
                                    TextField(
                                      controller: model.nameController,
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
                                        hintStyle: const TextStyle(
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
                                        hintStyle: const TextStyle(
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
                                      controller: model.contactController,
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
                                        hintStyle: const TextStyle(
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
                                        'Company Name',
                                        style: TextStyle(
                                          color: AppColor.backgroundColor,
                                          fontSize: fontSize,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: sizeBoxlabel),
                                    TextField(
                                      controller: model.companyNameController,
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
                                        hintStyle: const TextStyle(
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
                                        hintStyle: const TextStyle(
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


                                SizedBox(height: height * 0.017),
                                GestureDetector(
                                  onTap: () {
                                    model.isLoadinTrue();
                                    // model.searchedClicked();
                                    model.registerClicked();

                                  },
                                  child: Container(
                                    height: height * 0.055,
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
                                    child: Center(child: model.isLoading==true?CircularProgressIndicator(color: AppColor.backgroundColor,strokeWidth: 3,):Text('Register',style: theme.displayMedium?.copyWith(

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
                  SizedBox(height: height*0.01,),
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
              ),
              // SizedBox(height: height*0.1,)

            ],
          ),
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
