import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_app/common/constants/text_styles.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController inputController;
  final double height, width;
  final String title;
  final bool isEditable;
  final bool isText;
  final int maxLength;
  final bool isCalender, rightSquared, leftSquared;
  final TextInputType inputType;
  MyTextField({
    Key? key,
    required this.inputController,
    required this.title,
    required this.height,
    required this.width,
    this.isEditable = true,
    this.isText = true,
    this.maxLength = 100,
    this.isCalender = false,
    this.inputType = TextInputType.text,
    this.leftSquared = false,
    this.rightSquared = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color(0xffC5C5C5);
    Color errorColor = Theme.of(context).errorColor;

    return SizedBox(
      height: height.h,
      width: width.w,
      child: TextFormField(
        controller: inputController,
        keyboardType: isText ? TextInputType.text : TextInputType.number,
        readOnly: isEditable ? false : true,
        //! validation
        validator: (value) {
          return "";
        },
        focusNode: isCalender ? AlwaysDisabledFocusNode() : null,
        onTap: isCalender
            ? () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: inputController.text != ""
                      ? DateFormat('dd-MM-yyy').parse(inputController.text)
                      : DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: Color(0xff1B419B),
                          onPrimary: Colors.white,
                          onSurface: Color(0xff1B419B),
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            foregroundColor: Color(0xff1B419B),
                            textStyle:
                                MyTextStyles.largeLightTextTheme.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('dd-MM-yyy').format(pickedDate);
                  inputController.text = formattedDate;
                } else {}
              }
            : () {},
        onChanged: (value) {
          if (value.length == maxLength) {
            FocusScope.of(context).unfocus();
          }
        },
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w700,
              color: isEditable ? null : Color(0xff888888),
            ),
        decoration: InputDecoration(
          label: Text(title),
          suffixIcon: isCalender
              ? Icon(
                  Icons.calendar_month,
                  size: 18.w,
                  color: Color(0xff1B419B),
                )
              : null,
          labelStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w700, color: primaryColor),
          // hintText: title,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w700, color: primaryColor),
          contentPadding:
              EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0.w),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 1.0),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(rightSquared ? 0 : 4.r),
              topLeft: Radius.circular(leftSquared ? 0 : 4.r),
              bottomLeft: Radius.circular(leftSquared ? 0 : 4.r),
              bottomRight: Radius.circular(rightSquared ? 0 : 4.r),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 1.0),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(rightSquared ? 0 : 4.r),
              topLeft: Radius.circular(leftSquared ? 0 : 4.r),
              bottomLeft: Radius.circular(leftSquared ? 0 : 4.r),
              bottomRight: Radius.circular(rightSquared ? 0 : 4.r),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: errorColor, width: 1.0),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(rightSquared ? 0 : 4.r),
              topLeft: Radius.circular(leftSquared ? 0 : 4.r),
              bottomLeft: Radius.circular(leftSquared ? 0 : 4.r),
              bottomRight: Radius.circular(rightSquared ? 0 : 4.r),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 1.0),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(rightSquared ? 0 : 4.r),
              topLeft: Radius.circular(leftSquared ? 0 : 4.r),
              bottomLeft: Radius.circular(leftSquared ? 0 : 4.r),
              bottomRight: Radius.circular(rightSquared ? 0 : 4.r),
            ),
          ),
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
