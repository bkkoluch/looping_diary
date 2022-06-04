import 'package:looping_diary/core/domain/use_case.dart';
import 'package:looping_diary/features/onboarding/data/repositories/onboarding_repository.dart';

class GetOnboardingSeenUseCase implements UseCase<bool, NoParams> {
  const GetOnboardingSeenUseCase(this.onboardingRepository);

  final OnboardingRepository onboardingRepository;

  @override
  bool call([NoParams? params]) => onboardingRepository.getOnboardingSeen();
}
