import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/features/user/data/datasources/user_local_data_source.dart';
import 'package:looping_diary/features/user/data/repositories/user_repository_impl.dart';
import 'package:looping_diary/features/user/domain/repositories/user_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_data.dart';
import '../../../../test_setup.dart';

class MockUserLocalDataSource extends Mock implements UserLocalDataSource {}

void main() {
  late UserLocalDataSource _mockedUserLocalDataSource;
  late UserRepository _userRepository;

  setUpAll(baseSetup);

  setUp(() {
    _mockedUserLocalDataSource = MockUserLocalDataSource();
    _userRepository = UserRepositoryImpl(_mockedUserLocalDataSource);
  });

  tearDownAll(baseTearDown);

  group('getUserId', () {
    test(
      'should return user id when UserLocalDataSource.getUserId is not null',
      () async {
        // arrange
        when(() => _mockedUserLocalDataSource.getUserId()).thenAnswer((_) => tId);

        // act
        final result = _userRepository.getUserId();

        // assert
        expect(result, tId);
        verify(() => _mockedUserLocalDataSource.getUserId()).called(1);
        verifyNoMoreInteractions(_mockedUserLocalDataSource);
      },
    );

    test(
      'should return null when UserLocalDataSource.getUserId is null',
      () async {
        // arrange
        when(() => _mockedUserLocalDataSource.getUserId()).thenAnswer((_) => null);

        // act
        final result = _userRepository.getUserId();

        // assert
        expect(result, null);
        verify(() => _mockedUserLocalDataSource.getUserId()).called(1);
        verifyNoMoreInteractions(_mockedUserLocalDataSource);
      },
    );
  });
}
