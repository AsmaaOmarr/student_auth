class Validation {
  // validate required fields
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    // Add specific validations here if needed
    return null;
  }
  // validate email for sign up page
  // email shouldn't be exist before
  static String? validateEmailSignUp(String? value, String fieldName) {
    RegExp emailRegex = RegExp(r'^\d{8}@stud\.fci-cu\.edu\.eg$');

    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    } else if (!emailRegex.hasMatch(value)) {
      return "Invalid Email";
    }
    return null;
  }

  //validate email for login page
  // email should be exist
  static String? validateEmailLogin(
      String? value, String fieldName, bool emailExist) {
    RegExp emailRegex = RegExp(r'^\d{8}@stud\.fci-cu\.edu\.eg$');

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

    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    } else if (!minLengthRegex.hasMatch(value)) {
      return "Password should be at least 8 characters";
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
}
