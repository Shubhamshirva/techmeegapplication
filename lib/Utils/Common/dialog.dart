import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:techmeegapplication/Utils/themedata.dart';

class utils {
  static showToast(String? msg) {
    if (msg != null && msg != "null" && msg.isNotEmpty) {
      Fluttertoast.showToast(msg: msg);
    }
  }

  static loader() {
    Get.dialog(
      Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: WillPopScope(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: AppColors.bluebackgroundcolor,
                  ),
                ],
              ),
            ),
            onWillPop: () async => false),
      ),
      barrierDismissible: false,
    );
  }
}