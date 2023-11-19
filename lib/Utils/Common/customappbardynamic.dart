// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techmeegapplication/Utils/Common/sized_box.dart';

class CustomAppBarDynamic extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBarDynamic(
      {Key? key,
      required this.titleTxt,
      this.col,
      this.customWidget,
      this.useCustomWidget,
      required this.preferredSize,
      this.backArrow})
      : super(key: key);
  final String titleTxt;
  final Color? col;
  final Widget? customWidget;
  final bool? useCustomWidget;
  final bool? backArrow;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        height: 50,
        decoration: const BoxDecoration(),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Row(
        children: [
          sizedBoxWidth(backArrow == null ? 0 : 16.w),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              titleTxt,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.spMin,
                fontFamily: 'AvenirNextCyr',
                fontWeight: FontWeight.w700,
                color: col ?? Color(0xFF373434),
              ),
            ),
          ),
        ],
      ),
      leading: backArrow == null
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: 35.h,
                width: 35.h,
                decoration: ShapeDecoration(
                  color: Color(0xFFFEF3F8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: Color(0xFFEF2B7B),
                ),
              ),
              iconSize: 22.spMin,
            )
          : null,
      bottom: useCustomWidget ?? false
          ? PreferredSize(preferredSize: preferredSize, child: customWidget!)
          : null,
    );
  }
}