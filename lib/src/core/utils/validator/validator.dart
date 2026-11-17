import '../enums/enums.dart';
import '../extensions/extensions.dart';

abstract class Validator<T> {
  new(this.message);

  final String message;

  bool isValid(T? val);
}

class RequiredValidator extends Validator<String> {
  RequiredValidator({String? message})
    : super(message ?? "This field is required.");

  @override
  bool isValid(String? val) => val?.trim().isNotEmpty ?? false;
}

class MinOrderValueValidator extends Validator<String> {
  MinOrderValueValidator({
    String? message,
    required this.amount,
    required this.currency,
  }) : super(message ?? "Minimum: ${currency.sign}${amount.toAmount}");

  final num amount;
  final Currency currency;

  @override
  bool isValid(String? val) {
    final value = double.tryParse(val?.trim() ?? '');

    if (value == null) return false;

    return value >= amount;
  }
}

class MaxOrderValueValidator extends Validator<String> {
  MaxOrderValueValidator({
    String? message,
    required this.amount,
    required this.currency,
  }) : super(message ?? "Maximum: ${currency.sign}${amount.toAmount}");

  final num amount;
  final Currency currency;

  @override
  bool isValid(String? val) {
    final value = double.tryParse(val?.trim() ?? '');

    if (value == null) return false;

    return value <= amount;
  }
}

class FormValidator {
  const FormValidator(this.validators);
  final List<Validator<dynamic>> validators;

  String? call(String? value) {
    for (var validator in validators) {
      if (!validator.isValid(value)) {
        return validator.message;
      }
    }
    return null;
  }
}
