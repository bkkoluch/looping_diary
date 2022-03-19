import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.message);

  final String? message;

  @override
  List<Object> get props => [message ?? ''];

  @override
  String toString() => message ?? '<<< No message provided for this Failure: $runtimeType >>>';
}

class LocalFailure extends Failure {
  const LocalFailure(String message) : super(message);
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}
