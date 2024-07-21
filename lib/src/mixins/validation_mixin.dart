mixin ValidationMixin {
  String? validatePassword(value) {
    if (value!.length < 4) {
      return 'Enter a valid password dummy';
    }
    return null;
  }

  String? validateEmail(value) {
    if (value!.length < 4) {
      return 'Enter a valid password dummy';
    }
    return null;
  }
}
