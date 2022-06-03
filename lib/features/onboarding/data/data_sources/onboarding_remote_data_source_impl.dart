import 'package:injectable/injectable.dart';
import 'package:looping_diary/core/data/endpoints.dart';
import 'package:looping_diary/core/errors/remote_exceptions.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/network/firebase_json_converter.dart';
import 'package:looping_diary/core/network/firebase_rest_client.dart';
import 'package:looping_diary/features/onboarding/data/data_sources/onboarding_remote_data_source.dart';

@Injectable(as: OnboardingRemoteDataSource)
class OnboardingRemoteDataSourceImpl implements OnboardingRemoteDataSource {
  const OnboardingRemoteDataSourceImpl(this.firebaseRestClient);

  final FirebaseRestClient firebaseRestClient;

  final String onboardingSeenField = 'onboardingSeen';

  @override
  Future<void> markOnboardingAsSeenRemotely() async {
    try {
      await firebaseRestClient.patchWithQueryParameters(
        Endpoints.userMilestones,
        getIt<FirebaseJsonConverter>().convertToFirebaseJson(
          onboardingSeenField,
          {onboardingSeenField: true},
        ),
        {
          updateMaskFieldPathsString: [onboardingSeenField]
        },
      );
    } catch (e) {
      throw ServerException('An error occurred in $markOnboardingAsSeenRemotely: $e');
    }
  }

  @override
  Future<bool?> getOnboardingSeen() async {
    try {
      final Map<String, dynamic> result = (await firebaseRestClient.get(Endpoints.userMilestones)) ?? {};
      return Future.value(result[onboardingSeenField]);
    } catch (e) {
      throw ServerException('An error occurred in $getOnboardingSeen: $e');
    }
  }
}
