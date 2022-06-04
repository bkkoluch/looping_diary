abstract class OnboardingRepository {
  Future<void> markOnboardingAsSeen();

  bool getOnboardingSeen();
}
