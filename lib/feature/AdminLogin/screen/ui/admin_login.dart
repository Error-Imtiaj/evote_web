import 'package:evote_web/app/core/app_button.dart';
import 'package:evote_web/app/core/app_text_field.dart';
import 'package:evote_web/app/utils/app_routes.dart';
import 'package:evote_web/feature/AdminLogin/bloc/admin_bloc.dart';
import 'package:evote_web/feature/Home/screen/widget/app_to_bar.dart';
import 'package:evote_web/app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final TextEditingController emailctrl = TextEditingController();
  final TextEditingController passctrl = TextEditingController();
  final GlobalKey _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminBloc, AdminState>(
      listener: (context, state) {
        if (state is AdminLoginSuccessState) {
          final msg = state.successMessage['message'] ?? 'Login Successful ✅';
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(msg)));
          context.go(AppRoutes.adminPortalRoutePath);
        } else if (state is AdminLoginFailedState) {
          final msg = state.failedMessage['detail'] ?? 'Login Failed ❌';
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(msg)));
        }
      },
      builder: (context, state) {
        if (state is AdminLoginLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          backgroundColor: AppColor.bgColor,
          appBar: AppToBar(text: 'System Administrator Login'),
          body: Center(
            child: Container(
              padding: EdgeInsets.all(24.r),
              decoration: BoxDecoration(
                color: AppColor.appbarBgColor,
                //borderRadius: BorderRadius.circular(24.r),
                border: Border(
                  bottom: BorderSide(width: 8.r, color: AppColor.buttonColor),
                  right: BorderSide(width: 8.r, color: AppColor.buttonColor),
                ),
              ),
              width: 600.r,
              height: 500.r,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Gap(40.r),
                    homeTitle(),
                    Gap(40.r),
                    // textfield
                    AppTextField(
                      textEditingController: emailctrl,
                      hintText: "Enter Your Email",
                    ),
                    Gap(28.r),
                    AppTextField(
                      textEditingController: passctrl,
                      hintText: "Enter Your Password",
                      obsecureText: true,
                    ),

                    Spacer(),
                    AppButton(
                      btnText: "Login",
                      onTap: () => context.read<AdminBloc>().add(
                        AdminLoginEvent(
                          email: emailctrl.text.trim(),
                          pass: passctrl.text.trim(),
                        ),
                      ),
                    ),
                    Gap(28.r),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget homeTitle() {
    return Text(
      "It's Good To Have You Back!",
      style: TextStyle(
        color: AppColor.bgColor,
        fontSize: 32.r,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
