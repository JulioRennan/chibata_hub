import 'package:get/get.dart';

String? validatorConfirmPassword(String? value, String password) {
  value = value ?? "";
  if (password != value) {
    return "As senhas não são correspondentes.";
  }
  return null;
}

String? validatorPassword(String? value) {
  String? msgError = _validateFieldRequired(value);
  if (msgError != null) return msgError;
  if (value!.length <= 5) {
    return "Coloque uma senha mais segura";
  }
  return null;
}

String? validatorGeneric(
  String? value, {
  String? messageError,
  int minLenght = 0,
  int? lenght,
}) {
  if ((value?.trim() ?? '').isEmpty) {
    return "Esse campo é obrigatório";
  }
  if (lenght != null) {
    if (value!.length != lenght) {
      return messageError ?? '';
    }
  }
  if (value!.length <= minLenght) {
    return messageError ?? '';
  }
  return null;
}

String? _validateFieldRequired(
  String? value, {
  String? messageError,
}) {
  if ((value?.trim() ?? '').isEmpty) {
    return messageError ?? 'Esse campo é obrigatório.';
  }
  return null;
}

String? validateEmail(String? value) {
  String? msgError = _validateFieldRequired(value);
  if (msgError != null) return msgError;

  if (!GetUtils.isEmail(value!)) {
    return "Email inválido";
  }

  return null;
}
