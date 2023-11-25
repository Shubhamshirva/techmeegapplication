import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:techmeegapplication/Utils/Common/sized_box.dart';
import 'package:techmeegapplication/Utils/Common/text.dart';
import 'package:techmeegapplication/Utils/themedata.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

Future<bool> _backbuttonpressed(BuildContext context) async {
    bool? exitapp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(15.w),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)),
            insetPadding: const EdgeInsets.symmetric(vertical: 10),
            title: Text(
              "Exit App",
              style: TextStyle(
                  fontFamily: 'Studio Pro',
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  color: const Color(0xff3B3F43)),
            ),
            content: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Are you sure you want to Exit App?",
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16.sp,
                    color: const Color(0xff54595F)),
              ),
            ),
            actions: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  "No",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: const Color(0xff000000)),
                ),
              ),
              sizedBoxWidth(15.sp),
              InkWell(
                onTap: () {
                  SystemNavigator.pop();
                  Navigator.pop(context);
                },
                child: Text(
                  "Yes",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: const Color(0xffB90101)),
                ),
              ),
              sizedBoxWidth(15.sp),
            ],
          ),
        );
      },
    );
    return exitapp ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
       onWillPop: () => _backbuttonpressed(context),
      child: Scaffold(
        backgroundColor: AppColors.bluebackgroundscaffold,
        body: SafeArea(child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textBlack20W7000Mon("Login done")
            ],
          ),
        )),
      ),
    );
  }
}