class Validator {
  static String? requiredValidator(String? param) =>
      param == null || param.isEmpty ? 'This field can`t be null' : null;
}
