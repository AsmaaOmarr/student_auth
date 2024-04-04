import 'package:flutter/material.dart';
import 'package:mobile_assignment_1/features/auth/presentation/views/login_view.dart';
import 'package:mobile_assignment_1/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:mobile_assignment_1/features/auth/presentation/views/widgets/custom_pass_textField.dart';
import 'package:mobile_assignment_1/features/auth/presentation/views/widgets/custom_spacer.dart';
import 'package:mobile_assignment_1/validation.dart';
import '../../../../../constant.dart';
import 'Gender_selection.dart';
import 'custom_dropdown.dart';
import 'custom_textfield.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;
  String? dropDownValue = "Select Level";
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
                  email = value;
                  print(value);
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
                validator: (value) => Validation.validateEmailLogin(
                  value,
                  "Email",
                  true,
                ),
                icon: Icons.email_rounded,
              ),
              const SizedBox(height: 8),
              CustomTextField(
                label: 'Student ID',
                hint: 'Enter your student Id',
                onChanged: (value) {
                  email = value;
                  print(value);
                },
                validator: (value) => Validation.validateRequired(
                  value,
                  "Email",
                ),
                icon: Icons.account_circle_rounded,
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
              const SizedBox(height: 8),
              CustomPasswordTextField(
                label: 'Confirm password',
                hint: 'Rewrite your password',
                onChanged: (value) {
                  password = value;
                  print(password);
                },
                validator: (value) =>
                    Validation.validateRequired(value, "Password"),
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
                    onChanged: (String) {},
                  ),
                ],
              ),
              const SizedBox(height: 12),
              CustomDropdownButton(
                value: dropDownValue,
                onChanged: (value) {
                  setState(() {
                    dropDownValue = value;
                  });
                  print(value);
                },
              ),
              const SizedBox(height: 38),
              CustomButton(
                buttonName: "Sign Up",
                onPressed: () {
                  if (formKey.currentState != null &&
                      formKey.currentState!.validate()) {
                    print(email);
                    print(password);
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
