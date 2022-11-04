import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/common/constants/text_styles.dart';

class MyButton extends StatefulWidget {
  final String title;
  final VoidCallback ontap;
  final double height, width;
  final bool isDisabled;
  final bool isLoading;
  const MyButton({
    Key? key,
    required this.ontap,
    required this.title,
    required this.height,
    required this.width,
    this.isDisabled = false,
    this.isLoading = false,
  }) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.isLoading ? () {} : widget.ontap,
      child: Container(
        width: widget.width.w,
        height: widget.height.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border:
              widget.isDisabled ? Border.all(color: Color(0xff1B419B)) : null,
          color: Color(0xff1B419B),
        ),
        child: Center(
          child: widget.isLoading
              ? CircularProgressIndicator()
              : Text(
                  widget.title,
                  style: MyTextStyles.normalLightTextTheme.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
