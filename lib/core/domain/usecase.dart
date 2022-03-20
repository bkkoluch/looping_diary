import 'package:dartz/dartz.dart';
import 'package:looping_diary/core/errors/failures.dart';

/// A UseCase callable class
///
/// Can be used in two forms
/// Ex: UseCase()() or UseCase().call()
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class StreamUseCase<Type, Params> {
  Stream<Type> call(Params param);
}

class NoParams {
  const NoParams();
}
