import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techmeegapplication/Utils/themedata.dart';

class CustomNextButton extends StatelessWidget {
  const CustomNextButton({
    Key? key,
    GlobalKey<FormState>? form,
    this.ontap,
    required this.text,
    this.colorchange = false,
    this.productid,
  }) : super(key: key);

  final bool colorchange;
  final GestureTapCallback? ontap;
  final String text;
  final String? productid;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          shadowColor: Color.fromARGB(255, 220, 220, 226),

          backgroundColor: AppColors.bluebackgroundscaffold,

          //  color: Color(0xFFFFB600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.h),
          ),
        ),
        onPressed: () {
          ontap!();
          // productid;
          // UploadData();
        },
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }
}
