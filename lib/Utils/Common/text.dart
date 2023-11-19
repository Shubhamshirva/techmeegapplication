import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techmeegapplication/Utils/themedata.dart';

Widget textBlack20W7000Mon(String text) {
  return Text(
    text,
    style: TextStyle(
        fontSize: 20.sp,
        color: AppColors.cardDark,
        fontWeight: FontWeight.w700,
        fontFamily: "AvenirNextCyr"),
  );
}
