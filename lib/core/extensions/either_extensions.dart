import 'package:dartz/dartz.dart';

extension EitherExtensions<L, R> on Either<L, R> {
  R? foldOrNull() => fold((_) => null, id);

  R foldOr(R value) => fold((_) => value, id);

  // This should only be called when you are sure the value equals Left
  L extractLeft() {
    assert(isLeft());
    return fold((f) => f, (_) => null)!;
  }

  // This should only be called when you are sure the value equals Right
  R extractRight() {
    assert(isRight());
    return toOption().toNullable()!;
  }
}
