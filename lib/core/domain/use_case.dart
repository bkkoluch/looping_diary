/// A UseCase callable class
///
/// Can be used in two forms
/// Ex: UseCase()() or UseCase().call()
abstract class UseCase<Type, Params> {
  Type call(Params params);
}

class NoParams {
  const NoParams();
}
