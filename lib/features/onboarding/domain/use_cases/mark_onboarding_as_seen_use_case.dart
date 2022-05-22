import 'package:looping_diary/core/domain/use_case.dart';
import 'package:looping_diary/features/onboarding/data/repositories/onboarding_repository.dart';

class MarkOnboardingAsSeenUseCase implements UseCase<Future<void>, NoParams> {
  const MarkOnboardingAsSeenUseCase(this.onboardingRepository);

  final OnboardingRepository onboardingRepository;

  @override
  Future<void> call([NoParams? noParams]) async => await onboardingRepository.markOnboardingAsSeen();
}
