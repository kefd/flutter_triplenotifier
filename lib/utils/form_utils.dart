class FormUtils {
  static bool _hasMatch(String? value, String pattern) =>
      value == null ? false : RegExp(pattern).hasMatch(value);

  static bool _isEmail(String s) => _hasMatch(s,
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  static String? textFieldEmailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Campo Obrigatório';
    } else if (!_isEmail(value)) {
      return 'Campo requer um Email válido';
    }
  }

  static String? textFieldPasswordValidator(String? value) {
    if (value!.isEmpty) {
      return 'Campo Obrigatório';
    } else if (value.length < 6) {
      return 'Campo requer um mínimo de 6 caracteres';
    }
  }

  static String? textFieldNameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Campo Obrigatório';
    }
  }
}
