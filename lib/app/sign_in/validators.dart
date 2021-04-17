abstract class StringValidator {
  bool isValid(String value);
}

class NonEmptyStringValidator implements StringValidator {
  @override
  bool isValid(String value) {
    // TODO: implement isValid
    throw UnimplementedError();
  }
}