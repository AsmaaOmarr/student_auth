import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_assignment_1/constant.dart';
import 'package:mobile_assignment_1/models/user.dart';
import 'package:mobile_assignment_1/utils/snak_bar.dart';
import 'package:mobile_assignment_1/utils/shared_prefs.dart';
import 'package:mobile_assignment_1/utils/validation.dart';
import 'package:mobile_assignment_1/widgets/Gender_selection.dart';
import 'package:mobile_assignment_1/widgets/custom_button.dart';
import 'package:mobile_assignment_1/widgets/custom_dropdown.dart';
import '../../../../../widgets/custom_pass_textField.dart';
import '../../../../../widgets/custom_textfield.dart';
import 'custom_changing_buttton.dart';
import 'profile_image.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key, required this.email});

  final String email;

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  User? user;
  bool showEmailExist = false;
  bool isButtonEnabled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserByEmailFromSharedPref();
  }

  void getUserByEmailFromSharedPref() async {
    // Call SharedPreferencesService to get user by email
    User? fetchedUser =
        await SharedPreferencesService.getUserByEmail(widget.email);
    if (fetchedUser != null) {
      setState(() {
        user = fetchedUser;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: user == null
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    // Image.asset(
                    //   "assets/images/welcome.png",
                    //   height: 100,
                    //   width: 200,
                    // ),
                    const SizedBox(height: 10),
                    ProfileImage(),
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
                        user!.name = value;
                        print(value);
                        setState(() => isButtonEnabled = true);
                      },
                      validator: (value) => Validation.validateRequired(
                        value,
                        "Name",
                      ),
                      icon: Icons.person_2_rounded,
                      controller: TextEditingController(text: user!.name),
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      label: 'Email',
                      hint: 'studentID@stud.fci-cu.edu.egl',
                      onChanged: (value) {
                        user!.email = value;
                        setState(() => isButtonEnabled = true);
                        print(value);
                      },
                      validator: (value) => Validation.validateEmailSignUp(
                        value,
                        "Email",
                        showEmailExist,
                      ),
                      icon: Icons.email_rounded,
                      keyboardType: TextInputType.emailAddress,
                      controller: TextEditingController(text: user!.email),
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      label: 'Student ID',
                      hint: 'Enter your student Id',
                      onChanged: (value) {
                        user!.studentId = value;
                        setState(() => isButtonEnabled = true);
                        print(value);
                      },
                      validator: (value) => Validation.validateRequired(
                        value,
                        "Student ID",
                      ),
                      icon: Icons.account_circle_rounded,
                      keyboardType: TextInputType.number,
                      controller: TextEditingController(text: user!.studentId),
                    ),
                    const SizedBox(height: 8),
                    CustomPasswordTextField(
                        label: 'Password',
                        hint: 'Enter your password',
                        onChanged: (value) {
                          user!.password = value;
                          print(user!.password);
                          setState(() => isButtonEnabled = true);
                        },
                        validator: (value) =>
                            Validation.validatePassword(value, "Password"),
                        controller:
                            TextEditingController(text: user!.password)),
                    const SizedBox(height: 8),
                    CustomPasswordTextField(
                      label: 'Confirm password',
                      hint: 'Rewrite your password',
                      onChanged: (value) {
                        print(value);
                      },
                      validator: (value) => Validation.validateConfirmPassword(
                          value, user!.password, "Confirm Password"),
                      controller: TextEditingController(text: user!.password),
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
                          initialSelection: user!.gender ?? "",
                          onChanged: (value) {
                            user!.gender = value;
                            setState(() => isButtonEnabled = true);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    CustomDropdownButton(
                      value: user!.level,
                      onChanged: (value) {
                        setState(() {
                          user!.level = value;
                        });
                        setState(() => isButtonEnabled = true);
                        print(value);
                      },
                    ),
                    const SizedBox(height: 38),
                    // CustomButton(
                    //   buttonName: "Save",
                    //   onPressed: () async {
                    //     bool isExist =
                    //         await SharedPreferencesService.doesEmailExist(user.email);
                    //     print("Email is exist = $isExist");
                    //     setState(() {
                    //       isExist && widget.email != user.email
                    //           ? showEmailExist = true
                    //           : showEmailExist = false;
                    //     });
                    //     if (formKey.currentState != null &&
                    //         formKey.currentState!.validate() &&
                    //         !isExist) {
                    //       print(user);
                    //     }
                    //   },
                    // ),
                    CustomColorChangingButton(
                      isButtonEnabled: isButtonEnabled,
                      onPressed: () async {
                        bool isExist =
                            await SharedPreferencesService.doesEmailExist(
                                user!.email);
                        print("Email is exist = $isExist");
                        setState(() {
                          isExist && widget.email != user!.email
                              ? showEmailExist = true
                              : showEmailExist = false;
                        });
                        if (formKey.currentState != null &&
                            formKey.currentState!.validate()) {
                          print(user);
                          setState(() => isButtonEnabled = false);
                          await SharedPreferencesService.updateUserByEmail(
                              widget.email, user!);
                          SnakBar.showSnakBar(
                            context,
                            "profile updated successfully",
                            Colors.green,
                            Icons.check_circle,
                          );

                          List<User> userss =
                              await SharedPreferencesService.getAllUsers();
                          print(userss);
                        } else {
                          SnakBar.showSnakBar(
                            context,
                            "Failed to update profile",
                            Colors.red,
                            Icons.error,
                          );
                        }
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

