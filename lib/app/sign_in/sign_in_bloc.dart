import 'dart:async';

class SignInBloc {
  final StreamController<bool> _isLoadingController = StreamController<bool>();
  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  void dispose() {
    _isLoadingController.close();
    // remove controller when sign in page is removed from the widget tree and
    // we do not longer need the bloc
  }
  void setIsLoading(bool isLoading) => _isLoadingController.add(isLoading);
}