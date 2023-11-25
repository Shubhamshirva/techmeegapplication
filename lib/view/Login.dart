import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmeegapplication/Global.dart';
import 'package:techmeegapplication/Utils/Common/customnextbutton.dart';
import 'package:techmeegapplication/Utils/Common/customtextformfield.dart';
import 'package:techmeegapplication/Utils/Common/dialog.dart';
import 'package:techmeegapplication/Utils/Common/sized_box.dart';
import 'package:techmeegapplication/Utils/Common/text.dart';
import 'package:techmeegapplication/Utils/base_manager.dart';
import 'package:techmeegapplication/Utils/themedata.dart';
import 'package:techmeegapplication/resources/routes/route_name.dart';
import 'package:techmeegapplication/view/viewmodel.dart/postapi.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController emailidcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  DateTime timebackPressed = DateTime.now();

//  Uploadata() async {
//     utils.loader();
//     Map<String, dynamic> updata = {
//       "requestType": "login",
//       "username": emailidcontroller.text,
//       "password": passwordcontroller.text,
//       "SecureID" : "",
//       "UUID" : "",
//       "deviceid" : "",
//       "devicename" : "",

//     };
//     final data = await Postapi().Loginpostapi(updata);
//     if (data.status == ResponseStatus.SUCCESS) {
//       Get.back();
//       print("Login done");
//       print(data.message);
//       Map<String, dynamic> res = json.decode(data.message);
//       print(res);
//       Future.delayed(Duration(seconds: 2),() async {
//         final SharedPreferences prefs = await SharedPreferences.getInstance();
//          await prefs.setBool(
//         'LogedIn', true);
                                               
                                     
//       });
//       Get.toNamed(RouteName.homepage);
//       return utils.showToast(data.message);
//     } else {
//       Get.back();
//       print("Login failed");
//       return utils.showToast(data.message);
//     }
//   }

Uploadata() async {
  utils.loader();
  Map<String, dynamic> updata = {
    "requestType": "login",
    "username": emailidcontroller.text,
    "password": passwordcontroller.text,
    "SecureID": "",
    "UUID": "",
    "deviceid": "",
    "devicename": "",
  };

  try {
    final data = await Postapi().Loginpostapi(updata);

    if (data.status == ResponseStatus.SUCCESS) {
      Get.back();
      print("Login done");
      print(data.message);

      // Parse the string response as dynamic
      dynamic parsedData = json.decode(data.message);

      if (parsedData is Map<String, dynamic>) {
        // If it's a map, print it
       

        // Perform additional tasks after successful login
        await Future.delayed(Duration(seconds: 2), () async {
          final SharedPreferences prefs =
              await SharedPreferences.getInstance();
          await prefs.setBool('LogedIn', true);
          Map<String, dynamic> res = parsedData;
        print("res is  ${res}");

        await prefs.setString('Username', res["UserName"]);
        await prefs.setString('UserID', res["UserID"]);
        await prefs.setString('VendorID', res["VendorID"]);
        await prefs.setString('UserType', res["UserType"]);
        await prefs.setString('password', res["password"]);
        await prefs.setString('user_type', res["user_type"]);
        await prefs.setString('name', res["name"]);

        username = res["UserName"];
        name = res["name"];
        userid = res["UserID"];
        vendorid = res["VendorID"];
        usertype = res["UserType"];
        password = res["password"];
        usertype1 = res["user_type"];

        print("username is ${username}");
        print("name is ${name}");
        print("user id is ${userid}");
        print("vendor id is ${vendorid}");
        print("user typr is ${usertype}");
        print("password is ${password}");
        print("user_type is ${usertype1}");



           Get.toNamed(RouteName.homepage);
           utils.showToast("Login successful: ${res["message"]}");

          // Add more tasks if needed
        });       
      } else if (parsedData is List<dynamic> && parsedData.isNotEmpty) {
        // If it's a list, handle it accordingly
        print("Response is a List: $parsedData");

        await Future.delayed(Duration(seconds: 2), () async {
          final SharedPreferences prefs =
              await SharedPreferences.getInstance();
          await prefs.setBool('LogedIn', true);
          Map<String, dynamic> firstItem = parsedData[0];
        print("first iem is ${firstItem}");

         String responseMessage = firstItem["message"];

        await prefs.setString('Username', firstItem["UserName"]);
        await prefs.setString('UserID', firstItem["UserID"]);
        await prefs.setString('VendorID', firstItem["VendorID"]);
        await prefs.setString('UserType', firstItem["UserType"]);
        await prefs.setString('password', firstItem["password"]);
        await prefs.setString('user_type', firstItem["user_type"]);
        await prefs.setString('name', firstItem["name"]);

        username = firstItem["UserName"];
        name = firstItem["name"];
        userid = firstItem["UserID"];
        vendorid = firstItem["VendorID"];
        usertype = firstItem["UserType"];
        password = firstItem["password"];
        usertype1 = firstItem["user_type"];

        print("username is ${username}");
        print("name is ${name}");
        print("user id is ${userid}");
        print("vendor id is ${vendorid}");
        print("user typr is ${usertype}");
        print("password is ${password}");
        print("user_type is ${usertype1}");



           Get.toNamed(RouteName.homepage);
           utils.showToast(responseMessage);

          // Add more tasks if needed
        });
        // Add logic for handling lists if needed
      } else {
        print("Unexpected response type: ${parsedData.runtimeType}");
        // Handle other unexpected types if needed
      }
    } else {
      Get.back();
      print("Login failed");
      return utils.showToast(data.message);
    }
  } catch (e) {
    Get.back();
    print("Error in Loginpostapi: $e");
    // Handle the error as needed
    return utils.showToast("An error occurred");
  }
}


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timebackPressed);
        final isExitWarning = difference >= Duration(seconds: 2);

        timebackPressed = DateTime.now();

        if (isExitWarning) {
          final message = "Press back again to exit";
          Fluttertoast.showToast(
            msg: message,
            fontSize: 18.sp,
          );
          return false;
        } else {
          Fluttertoast.cancel();
          SystemNavigator.pop();
          return true;
        }
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: AppColors.bluebackgroundcolor,
          body: SafeArea(
            child: SingleChildScrollView(
              // padding: ,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: Center(
                  child: Form(
                    key: _form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        sizedBoxHeight(60.h),
                        textWhite16W6000Mon("LOGIN"),
                        // sizedBoxHeight(10.h),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 10.h),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Image.asset(""),
                                    sizedBoxHeight(5.h),
                                    textBlue14W5000Mon("Techmeeg POS"),
                                    sizedBoxHeight(10.h),
                                    CustomTextFormField(
                                      hintText: "Enter mail",
                                      validatorText: "Enter mail",
                                      texttype: TextInputType.name,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(20),
                                      ],
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter your email address';
                                        }
                                        // if (!RegExp(
                                        //         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                        //     .hasMatch(value)) {
                                        //   return 'Enter a Valid Email address';
                                        // }
                                        return null;
                                      },
                                      textEditingController: emailidcontroller,
                                      isInputPassword: Icon(
                                        Icons.mail,
                                        color: AppColors.bluebackgroundcolor,
                                      ),
                                    ),
                                    sizedBoxHeight(10.h),
                                    TextFormField(
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                      ),
                                      cursorColor: const Color(0xFF1B8DC9),
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      obscureText: true,
                                      controller: passwordcontroller,
                                      decoration: InputDecoration(
                                          errorStyle:
                                              TextStyle(fontSize: 12.sp),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10.h, horizontal: 20),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: AppColors
                                                    .bluebackgroundcolor,
                                                width: 1),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: AppColors
                                                    .bluebackgroundcolor,
                                                width: 1),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: AppColors
                                                    .bluebackgroundcolor,
                                                width: 1),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.red, width: 1),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.red, width: 1),
                                          ),
                                          hintStyle: TextStyle(
                                              color:
                                                  AppColors.bluebackgroundcolor,
                                              fontSize: 16.sp,
                                              fontFamily: "Poppins"),
                                          hintText: "Enter password",
                                          suffixIcon: Icon(
                                            Icons.lock,
                                            color:
                                                AppColors.bluebackgroundcolor,
                                          )),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please Enter Password";
                                        }
                                        return null;
                                      },
                                    ),
                                    sizedBoxHeight(40.h),
                                    SizedBox(
                                      width: 150.w,
                                      child: CustomNextButton(
                                        text: "LOGIN",
                                        ontap: () {
                                          Uploadata();
                                        },
                                      ),
                                    ),

                                    sizedBoxHeight(15.h)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        sizedBoxHeight(60.h),
                        textWhite16W6000Mon("Developed by Techmeeg")
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
