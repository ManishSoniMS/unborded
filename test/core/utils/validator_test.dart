import 'package:flutter_test/flutter_test.dart';
import 'package:unbordered/src/core/utils/enums/enums.dart';
import 'package:unbordered/src/core/utils/validator/validator.dart';

void main() {
  test('min/max order limits are inclusive and reject non-numbers', () {
    final min = MinOrderValueValidator(
      amount: Currency.INR.min,
      currency: Currency.INR,
    );
    final max = MaxOrderValueValidator(
      amount: Currency.INR.max,
      currency: Currency.INR,
    );

    expect(min.isValid('999.99'), isFalse);
    expect(min.isValid('1000'), isTrue);
    expect(max.isValid('500000'), isTrue);
    expect(max.isValid('500000.01'), isFalse);
    expect(min.isValid('abc'), isFalse);
  });

  test('FormValidator returns first failing rule message', () {
    final form = FormValidator([
      RequiredValidator(),
      MinOrderValueValidator(amount: 10, currency: Currency.USD),
      MaxOrderValueValidator(amount: 10000, currency: Currency.USD),
    ]);

    expect(form('500'), isNull);
    expect(form(''), 'This field is required.');
    expect(form('5'), startsWith('Minimum'));
    expect(form('20000'), startsWith('Maximum'));
  });
}
