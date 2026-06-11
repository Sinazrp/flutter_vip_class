class FormValidators {
  // Name Validators
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name.';
    }

    final trimmedValue = value.trim();

    if (trimmedValue.length < 2) {
      return 'Name must be at least 2 characters.';
    }

    if (trimmedValue.length > 50) {
      return 'Name must not exceed 50 characters.';
    }

    // Check if name contains only letters and spaces
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(trimmedValue)) {
      return 'Name can only contain letters and spaces.';
    }

    return null;
  }

  // Age Validators
  static String? validateAge(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your age.';
    }

    final trimmedValue = value.trim();

    // Check if value contains only digits
    if (!RegExp(r'^\d+$').hasMatch(trimmedValue)) {
      return 'Age must contain only numbers.';
    }

    final age = int.tryParse(trimmedValue);

    if (age == null) {
      return 'Please enter a valid age.';
    }

    if (age < 1) {
      return 'Age must be greater than 0.';
    }

    if (age > 150) {
      return 'Please enter a valid age (max 150).';
    }

    return null;
  }

  // Email Validators (optional for future use)
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter an email address.';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email address.';
    }

    return null;
  }

  // Password Validators (optional for future use)
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password.';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters.';
    }

    if (value.length > 20) {
      return 'Password must not exceed 20 characters.';
    }

    return null;
  }

  // Phone Number Validators (optional for future use)
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a phone number.';
    }

    final phoneRegex = RegExp(r'^[0-9\-\+\s\(\)]{7,}$');

    if (!phoneRegex.hasMatch(value.trim())) {
      return 'Please enter a valid phone number.';
    }

    return null;
  }

  

  // Generic non-empty validator
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your $fieldName.';
    }
    return null;
  }
}
