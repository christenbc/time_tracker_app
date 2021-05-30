import 'package:flutter_test/flutter_test.dart';
import 'package:time_tracker/app/sign_in/validators.dart';

void main() {
  test('non empty string', () {
    final validator = NonEmptyStringValidator();
    expect(validator.isValid('test'), true);
  });
}
