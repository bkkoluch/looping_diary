import 'package:injectable/injectable.dart';
import 'package:looping_diary/features/onboarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:looping_diary/utils/shared_prefs_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: OnboardingLocalDataSource)
class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  const OnboardingLocalDataSourceImpl(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  Future<void> markOnboardingAsSeenLocally() async =>
      await sharedPreferences.setBool(SharedPrefsKeys.onboardingSeen(), true);

  @override
  bool getOnboardingSeen() => sharedPreferences.getBool(SharedPrefsKeys.onboardingSeen()) ?? false;
}
