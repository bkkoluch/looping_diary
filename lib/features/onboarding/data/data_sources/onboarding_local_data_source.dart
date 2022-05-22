abstract class OnboardingLocalDataSource {
  Future<void> markOnboardingAsSeenLocally();

  bool getOnboardingSeen();
}
