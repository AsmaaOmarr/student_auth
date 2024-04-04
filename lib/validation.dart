class Validation {
  // validate required fields
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    // Add specific validations here if needed
    return null;
  }


  static String? incorrectPassword(
      bool correct, String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    } else if (correct == false) {
      return 'Incorrect Password';
    }
    // Add specific validations here if needed
    return null;
  }

  // validate email for sign up page
  // email shouldn't be exist before
  static String? validateEmailSignUp(
      String? value, String fieldName, bool emailExist) {
    RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    } else if (!emailRegex.hasMatch(value)) {
      return "Invalid Email";
    } else if (emailExist) {
      return 'Email already exists';
    }
    return null;
  }

  //validate email for login page
  // email should be exist
  static String? validateEmailLogin(
      String? value, String fieldName, bool emailExist) {
    RegExp emailRegex = RegExp(r'^\d{8}@stud\.fci-cu\.edu\.eg$');;

    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    } else if (!emailRegex.hasMatch(value)) {
      return "Invalid Email";
    } else if (!emailExist) {
      return 'Email doesn\'t exists';
    }
    return null;
  }

  // validate password while 'sign up'
  //and while reset password #not done yet
  static String? validatePassword(String? value, String fieldName) {
    RegExp minLengthRegex = RegExp(r'^.{8,}$');
    RegExp digitRegex = RegExp(r'^(?=.*\d)');
    RegExp letterCaseRegex =
        RegExp(r'^(?=.*[A-Z])' // At least one uppercase letter
            r'(?=.*[a-z])' // At least one lowercase letter
            );
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    } else if (!minLengthRegex.hasMatch(value)) {
      return "Password shouldn't be less than 8 characters";
    } else if (!digitRegex.hasMatch(value)) {
      return "Password Should contain Numbers";
    } else if (!letterCaseRegex.hasMatch(value)) {
      return "Password Should contain lowercase and uppercase letters";
    }
    return null;
  }

  // validate confirm password
  static String? validateConfirmPassword(
      String? value, String? password, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    } else if (value != password) {
      return 'Confirm Password doesn\'t Match Password ';
    }
    return null;
  }

  //validate phone number
  static String? validationPhone(String? value, String fieldName) {
    RegExp validPhonePrefixes = RegExp(r'^(011|012|015|010)');
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    } else if (!validPhonePrefixes.hasMatch(value)) {
      return 'Phone Number is Invalid';
    }
    return null;
  }
}
