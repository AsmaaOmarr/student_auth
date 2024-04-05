import 'package:flutter/material.dart';
import 'package:mobile_assignment_1/constant.dart';
import 'package:mobile_assignment_1/features/profile/persentation/views/profile_view.dart';
import 'package:mobile_assignment_1/snak_bar.dart';
import 'package:mobile_assignment_1/shared_prefs.dart';
import 'package:mobile_assignment_1/validation.dart';
import '../signup_view.dart';
import '../../../../../widgets/custom_button.dart';
import '../../../../../widgets/custom_pass_textField.dart';
import 'custom_spacer.dart';
import '../../../../../widgets/custom_textfield.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;
  bool showEmailNotExist = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              Image.asset("assets/images/login_img.png"),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "  LogIn",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    fontFamily: Constant.kFontFamily,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Email',
                hint: 'Enter your email',
                onChanged: (value) {
                  email = value;
                  print(value);
                },
                validator: (value) => Validation.validateEmailLogin(
                  value,
                  "Email",
                  showEmailNotExist,
                ),
                icon: Icons.email_rounded,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 8),
              CustomPasswordTextField(
                label: 'Password',
                hint: 'Enter your password',
                onChanged: (value) {
                  password = value;
                  print(password);
                },
                validator: (value) =>
                    Validation.validateRequired(value, "Password"),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forget password?   ",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Constant.kPink,
                    fontFamily: Constant.kFontFamily,
                  ),
                ),
              ),
              const SizedBox(height: 36),
              CustomButton(
                buttonName: "Login",
                onPressed: () async {
                  bool isExist =
                      await SharedPreferencesService.doesEmailExist(email!);
                  print("Email is exist = $isExist");
                  setState(() {
                    isExist
                        ? showEmailNotExist = false
                        : showEmailNotExist = true;
                  });
                  if (formKey.currentState != null &&
                      formKey.currentState!.validate()) {
                    print(email);
                    print(password);
                    bool isEmailAndPasswordMatch =
                        await SharedPreferencesService.doEmailAndPasswordMatch(
                            email!, password!);
                    print(isEmailAndPasswordMatch);
                    if (isEmailAndPasswordMatch) {
                      SnakBar.showSnakBar(
                        context,
                        "Login successfully",
                        Colors.green,
                        Icons.check_circle,
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileView(email: email!),
                        ),
                      );
                    } else {
                      SnakBar.showSnakBar(
                        context,
                        "Email and password don't match",
                        Colors.red,
                        Icons.error,
                      );
                    }
                  }
                },
              ),
              const SizedBox(height: 40),
              const CustomSpacer(),
              const SizedBox(height: 40),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Don\'t have an account?",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                      fontFamily: Constant.kFontFamily,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpView(),
                        ),
                      );
                    },
                    child: const Text(
                      " Sign Up",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Constant.kPink,
                        fontFamily: Constant.kFontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
