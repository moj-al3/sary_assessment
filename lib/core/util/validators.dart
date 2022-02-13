class Validators {
  static String? isRequiredNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Required";
    }
    if (double.tryParse(value) == null) {
      return "Only numbers are accepted";
    }
    return null;
  }

  static String? isNumber(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    if (double.tryParse(value) == null) {
      return "Only numbers are accepted";
    }
    return null;
  }


  static String? isRequiredText(String? value) {
    if (value == null || value.isEmpty) {
      return "Required";
    }
    return null;
  }

  static String? isRequiredObject(Object? value) {
    if (value == null) {
      return "Required";
    }
    return null;
  }

}
