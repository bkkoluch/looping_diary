import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/features/user/data/datasources/user_local_data_source.dart';
import 'package:looping_diary/features/user/data/repositories/user_repository_impl.dart';
import 'package:looping_diary/features/user/domain/repositories/user_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_data.dart';
import '../../../../test_mocks.dart';
import '../../../../test_setup.dart';

void main() {
  late UserLocalDataSource mockedUserLocalDataSource;
  late UserRepository userRepository;

  setUpAll(baseSetup);

  setUp(() {
    mockedUserLocalDataSource = MockUserLocalDataSource();
    userRepository = UserRepositoryImpl(mockedUserLocalDataSource);
  });

  tearDownAll(baseTearDown);

  group('getUserId', () {
    test(
      'should return user id when UserLocalDataSource.getUserId is not null',
      () async {
        // arrange
        when(() => mockedUserLocalDataSource.getUserId()).thenAnswer((_) => tId);

        // act
        final result = userRepository.getUserId();

        // assert
        expect(result, tId);
        verify(() => mockedUserLocalDataSource.getUserId()).called(1);
        verifyNoMoreInteractions(mockedUserLocalDataSource);
      },
    );

    test(
      'should return null when UserLocalDataSource.getUserId is null',
      () async {
        // arrange
        when(() => mockedUserLocalDataSource.getUserId()).thenAnswer((_) => null);

        // act
        final result = userRepository.getUserId();

        // assert
        expect(result, null);
        verify(() => mockedUserLocalDataSource.getUserId()).called(1);
        verifyNoMoreInteractions(mockedUserLocalDataSource);
      },
    );
  });
}
