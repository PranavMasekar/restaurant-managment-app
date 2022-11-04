import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/common/constants/text_styles.dart';
import 'package:restaurant_app/common/widgets/my_button.dart';
import 'package:restaurant_app/common/widgets/my_snackbar.dart';
import 'package:restaurant_app/common/widgets/text_field.dart';
import 'package:restaurant_app/viewmodels/login_viewmodel.dart';
import 'package:restaurant_app/views/home_view.dart';

import 'base_view.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late LoginViewModel _model;

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      onModelReady: (model) {
        _model = model;
      },
      builder: (context, model, _) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: model.isLoading
                  ? CircularProgressIndicator()
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.w, vertical: 30.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/login.png"),
                          SizedBox(height: 22.h),
                          Text(
                            "Log In",
                            style: MyTextStyles.largeLightTextTheme,
                          ),
                          SizedBox(height: 22.h),
                          MyTextField(
                            inputController: emailController,
                            title: "Email",
                            height: 48.h,
                            width: 285.w,
                          ),
                          SizedBox(height: 22.h),
                          MyTextField(
                            inputController: passwordController,
                            title: "Password",
                            height: 48.h,
                            width: 285.w,
                          ),
                          SizedBox(height: 22.h),
                          MyButton(
                            ontap: () async {
                              await model.login(
                                emailController.text,
                                passwordController.text,
                              );
                              if (model.errorMsg == "") {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyHomePage(),
                                  ),
                                );
                              } else {
                                showSnackBar(context, model.errorMsg);
                              }
                            },
                            title: "Log In",
                            height: 50.h,
                            width: 140.w,
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
