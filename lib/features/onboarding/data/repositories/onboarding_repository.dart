abstract class OnboardingRepository {
  Future<void> markOnboardingAsSeen();

  Future<bool> getOnboardingSeen();
}
