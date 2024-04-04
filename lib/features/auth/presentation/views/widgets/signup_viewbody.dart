import 'package:flutter/material.dart';
import 'package:mobile_assignment_1/features/auth/presentation/views/login_view.dart';
import 'package:mobile_assignment_1/models/user.dart';
import 'package:mobile_assignment_1/shared_prefs.dart';
import 'package:mobile_assignment_1/widgets/custom_button.dart';
import 'package:mobile_assignment_1/widgets/custom_pass_textField.dart';
import 'package:mobile_assignment_1/features/auth/presentation/views/widgets/custom_spacer.dart';
import 'package:mobile_assignment_1/features/profile/persentation/views/profile_view.dart';
import 'package:mobile_assignment_1/validation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../constant.dart';
import '../../../../../widgets/Gender_selection.dart';
import '../../../../../widgets/custom_dropdown.dart';
import '../../../../../widgets/custom_textfield.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? fullName, email, password, studentID, gender, cPassword;
  String? level = "Select Level";
  bool showEmailExist = false;

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
              const SizedBox(height: 10),
              Image.asset("assets/images/signup_image.png"),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "  SignUp",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    fontFamily: Constant.kFontFamily,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Full name',
                hint: 'Enter your full name',
                onChanged: (value) {
                  fullName = value;
                  print(fullName);
                },
                validator: (value) => Validation.validateRequired(
                  value,
                  "Name",
                ),
                icon: Icons.person_2_rounded,
              ),
              const SizedBox(height: 8),
              CustomTextField(
                label: 'Email',
                hint: 'studentID@stud.fci-cu.edu.eg',
                onChanged: (value) {
                  email = value;
                  print(value);
                },
                validator: (value) => Validation.validateEmailSignUp(
                  value,
                  "Email",
                  showEmailExist,
                ),
                icon: Icons.email_rounded,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 8),
              CustomTextField(
                label: 'Student ID',
                hint: 'Enter your student Id',
                onChanged: (value) {
                  studentID = value;
                  print(value);
                },
                validator: (value) => Validation.validateRequired(
                  value,
                  "Student ID",
                ),
                icon: Icons.account_circle_rounded,
                keyboardType: TextInputType.number,
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
                    Validation.validatePassword(value, "Password"),
              ),
              const SizedBox(height: 8),
              CustomPasswordTextField(
                label: 'Confirm password',
                hint: 'Rewrite your password',
                onChanged: (value) {
                  cPassword = value;
                  print(cPassword);
                },
                validator: (value) => Validation.validateConfirmPassword(
                    value, password, "Confirm Password"),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "  Gender",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w600,
                      fontFamily: Constant.kFontFamily,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // initial like "female" or "male"
                  GenderSelection(
                    initialSelection: "",
                    onChanged: (String value) {
                      gender = value;
                      print(value);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              CustomDropdownButton(
                value: level,
                onChanged: (value) {
                  setState(() {
                    level = value;
                  });
                  print(value);
                },
              ),
              const SizedBox(height: 38),
              CustomButton(
                buttonName: "Sign Up",
                onPressed: () async {
                  bool isExist =
                      await SharedPreferencesService.doesEmailExist(email!);
                  print("Email is exist = $isExist");
                  setState(() {
                    isExist ? showEmailExist = true : showEmailExist = false;
                  });
                  if (formKey.currentState != null &&
                      formKey.currentState!.validate() &&
                      !isExist) {
                    User user = User(
                      name: fullName!,
                      email: email!,
                      studentId: studentID!,
                      password: password!,
                      gender: gender,
                      level: level,
                    );
                    print(user);
                    //await SharedPreferencesService.addUser(user);
                    await SharedPreferencesService.removeUser(email!);
                    // List<User> users =
                    //     await SharedPreferencesService.getAllUsers();
                    // print(users.length);

                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const ProfileView(),
                    //   ),
                    // );
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
                    "Joined us before?",
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
                          builder: (context) => const LoginView(),
                        ),
                      );
                    },
                    child: const Text(
                      " Log In",
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
              const SizedBox(height: 40),
            ],
          ),
        )),
      ),
    );
  }
}
