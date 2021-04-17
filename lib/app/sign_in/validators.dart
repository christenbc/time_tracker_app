abstract class StringValidator {
  bool isValid(String value);
}

class NonEmptyStringValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

class EmailAndPasswordValidators { // this is the mixin
  final StringValidator emailValidator = NonEmptyStringValidator();
  final StringValidator passwordValidator = NonEmptyStringValidator();
}