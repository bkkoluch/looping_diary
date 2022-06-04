import 'package:injectable/injectable.dart';
import 'package:looping_diary/features/onboarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:looping_diary/features/onboarding/data/repositories/onboarding_repository.dart';

@Injectable(as: OnboardingRepository)
class OnboardingRepositoryImpl implements OnboardingRepository {
  const OnboardingRepositoryImpl(this.onboardingLocalDataSource);

  final OnboardingLocalDataSource onboardingLocalDataSource;

  @override
  Future<void> markOnboardingAsSeen() async {
    await onboardingLocalDataSource.markOnboardingAsSeenLocally();
  }

  @override
  bool getOnboardingSeen() => onboardingLocalDataSource.getOnboardingSeen();
}
