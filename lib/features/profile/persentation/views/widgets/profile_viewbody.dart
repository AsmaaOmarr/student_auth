import 'package:flutter/material.dart';
import 'package:mobile_assignment_1/constant.dart';
import 'package:mobile_assignment_1/validation.dart';
import 'package:mobile_assignment_1/widgets/Gender_selection.dart';
import 'package:mobile_assignment_1/widgets/custom_button.dart';
import 'package:mobile_assignment_1/widgets/custom_dropdown.dart';
import '../../../../../widgets/custom_pass_textField.dart';
import '../../../../../widgets/custom_textfield.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;
  String? dropDownValue = "Level 4";
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
              Image.asset("assets/images/welcome.png"),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "  Profile",
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
                controller: TextEditingController(text: "Asmaa Omar"),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                label: 'Email',
                hint: 'studentID',
                onChanged: (value) {
                  email = value;
                  print(value);
                },
                validator: (value) => Validation.validateEmailSignUp(
                  value,
                  "Email",
                ),
                icon: Icons.email_rounded,
                keyboardType: TextInputType.emailAddress,
                controller:
                    TextEditingController(text: "20201019@stud.fci-cu.edu.eg"),
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
                  "Student ID",
                ),
                icon: Icons.account_circle_rounded,
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: "20201019"),
              ),
              const SizedBox(height: 8),
              // CustomPasswordTextField(
              //   label: 'Password',
              //   hint: 'Enter your password',
              //   onChanged: (value) {
              //     password = value;
              //     print(password);
              //   },
              //   validator: (value) =>
              //       Validation.validateRequired(value, "Password"),
              // ),
              // const SizedBox(height: 8),
              // CustomPasswordTextField(
              //   label: 'Confirm password',
              //   hint: 'Rewrite your password',
              //   onChanged: (value) {
              //     password = value;
              //     print(password);
              //   },
              //   validator: (value) =>
              //       Validation.validateRequired(value, "Confirm Password"),
              // ),
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
                    initialSelection: "female",
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
                buttonName: "Save",
                onPressed: () {
                  // if (formKey.currentState != null &&
                  //     formKey.currentState!.validate()) {
                  //   print(email);
                  //   print(password);
                  // }
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        )),
      ),
    );
  }
}
