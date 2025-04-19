
class Failure {
  final String message;

  Failure(this.message);
}

class ServiceFailure extends Failure {
  ServiceFailure({required String message}) : super(message);
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure() : super("Unexpected Error");
}
