abstract class OnboardingRemoteDataSource {
  Future<void> markOnboardingAsSeenRemotely();

  Future<bool?> getOnboardingSeen();
}
