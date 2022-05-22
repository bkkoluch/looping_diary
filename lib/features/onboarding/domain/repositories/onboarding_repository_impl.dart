import 'package:injectable/injectable.dart';
import 'package:looping_diary/features/onboarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:looping_diary/features/onboarding/data/data_sources/onboarding_remote_data_source.dart';
import 'package:looping_diary/features/onboarding/data/repositories/onboarding_repository.dart';

@Injectable(as: OnboardingRepository)
class OnboardingRepositoryImpl implements OnboardingRepository {
  const OnboardingRepositoryImpl(this.onboardingRemoteDataSource, this.onboardingLocalDataSource);

  final OnboardingRemoteDataSource onboardingRemoteDataSource;
  final OnboardingLocalDataSource onboardingLocalDataSource;

  @override
  Future<void> markOnboardingAsSeen() async {
    await onboardingLocalDataSource.markOnboardingAsSeenLocally();
    return await onboardingRemoteDataSource.markOnboardingAsSeenRemotely();
  }

  @override
  Future<bool> getMarkOnboardingSeen() async =>
      await onboardingRemoteDataSource.getOnboardingSeen() ?? onboardingLocalDataSource.getOnboardingSeen();
}
