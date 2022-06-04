import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/core/data/endpoints.dart';
import 'package:looping_diary/core/errors/remote_exceptions.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/network/firebase_json_converter.dart';
import 'package:looping_diary/core/network/firebase_rest_client.dart';
import 'package:looping_diary/features/onboarding/data/data_sources/onboarding_remote_data_source.dart';
import 'package:looping_diary/features/onboarding/data/data_sources/onboarding_remote_data_source_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_data.dart';
import '../../../../test_setup.dart';

void main() {
  late FirebaseRestClient firebaseRestClient;
  late OnboardingRemoteDataSource onboardingRemoteDataSource;

  const String onboardingSeenField = 'onboardingSeen';

  setUpAll(() {
    baseSetup();

    firebaseRestClient = MockFirebaseRestClient();
    onboardingRemoteDataSource = OnboardingRemoteDataSourceImpl(firebaseRestClient);
  });

  group('markOnboardingAsSeenRemotely', () {
    test(
      'should call patchWithQueryParameters on a successful call without error',
      () async {
        // Arrange
        when(
          () => firebaseRestClient.patchWithQueryParameters(
            captureAny(),
            captureAny(),
            captureAny(),
          ),
        ).thenAnswer((_) async => null);

        // Act
        await onboardingRemoteDataSource.markOnboardingAsSeenRemotely();

        // Assert
        verify(
          () => firebaseRestClient.patchWithQueryParameters(
            Endpoints.userMilestones,
            getIt<FirebaseJsonConverter>().convertToFirebaseJson(
              onboardingSeenField,
              {onboardingSeenField: true},
            ),
            {
              'updateMask.fieldPaths': [onboardingSeenField]
            },
          ),
        ).called(1);
        verifyNoMoreInteractions(firebaseRestClient);
      },
    );

    test(
      'should throw ServerException on an unsuccessful call',
      () async {
        // Arrange
        when(
          () => firebaseRestClient.patchWithQueryParameters(
            captureAny(),
            captureAny(),
            captureAny(),
          ),
        ).thenThrow(tServerFailure);

        // Act
        final result = onboardingRemoteDataSource.markOnboardingAsSeenRemotely;

        // Assert
        expect(() async => await result(), throwsA(isA<ServerException>()));
      },
    );
  });

  group('getOnboardingSeen', () {
    test(
      'should return onboardingSeen value on a successful call',
      () async {
        // Arrange
        when(() => firebaseRestClient.get(captureAny())).thenAnswer((_) async => {onboardingSeenField: true});

        // Act
        final result = await onboardingRemoteDataSource.getOnboardingSeen();

        // Assert
        verify(() => firebaseRestClient.get(Endpoints.userMilestones)).called(1);
        expect(result, isTrue);
      },
    );

    test(
      'should throw ServerException on an unsuccessful call',
      () async {
        // Arrange
        when(() => firebaseRestClient.get(captureAny())).thenThrow(tServerException);

        // Act
        final result = onboardingRemoteDataSource.getOnboardingSeen;

        // Assert
        expect(() async => await result(), throwsA(isA<ServerException>()));
        verify(() => firebaseRestClient.get(Endpoints.userMilestones)).called(1);
      },
    );
  });
}
