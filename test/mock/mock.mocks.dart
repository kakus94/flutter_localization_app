// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_localization_app/test/mock/mock.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:io' as _i6;

import 'package:dartz/dartz.dart' as _i2;
import 'package:flutter_localization_app/core/error/failures.dart' as _i5;
import 'package:flutter_localization_app/features/file_managment/domain/entities/localization.dart'
    as _i8;
import 'package:flutter_localization_app/features/file_managment/domain/repositories/file_repository.dart'
    as _i3;
import 'package:flutter_localization_app/features/localization_managment/domain/repositories/localization_repository.dart'
    as _i7;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [FileRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockFileRepository extends _i1.Mock implements _i3.FileRepository {
  MockFileRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> getFile(String? path) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFile,
          [path],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, String>>.value(
            _FakeEither_0<_i5.Failure, String>(
          this,
          Invocation.method(
            #getFile,
            [path],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, String>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> selectFolder(String? path) =>
      (super.noSuchMethod(
        Invocation.method(
          #selectFolder,
          [path],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #selectFolder,
            [path],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.FileSystemEntity>>> getFiles() =>
      (super.noSuchMethod(
        Invocation.method(
          #getFiles,
          [],
        ),
        returnValue: _i4
            .Future<_i2.Either<_i5.Failure, List<_i6.FileSystemEntity>>>.value(
            _FakeEither_0<_i5.Failure, List<_i6.FileSystemEntity>>(
          this,
          Invocation.method(
            #getFiles,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.FileSystemEntity>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> createUpdateFile(
    String? lang,
    String? content,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #createUpdateFile,
          [
            lang,
            content,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #createUpdateFile,
            [
              lang,
              content,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> deleteFile(String? path) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteFile,
          [path],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #deleteFile,
            [path],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);
}

/// A class which mocks [LocalizationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalizationRepository extends _i1.Mock
    implements _i7.LocalizationRepository {
  MockLocalizationRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, Map<String, dynamic>>>
      getMapLocalizationByLang(String? lang) => (super.noSuchMethod(
            Invocation.method(
              #getMapLocalizationByLang,
              [lang],
            ),
            returnValue:
                _i4.Future<_i2.Either<_i5.Failure, Map<String, dynamic>>>.value(
                    _FakeEither_0<_i5.Failure, Map<String, dynamic>>(
              this,
              Invocation.method(
                #getMapLocalizationByLang,
                [lang],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, Map<String, dynamic>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, Map<String, Map<String, dynamic>>>>
      getMapLocalization() => (super.noSuchMethod(
            Invocation.method(
              #getMapLocalization,
              [],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.Failure,
                        Map<String, Map<String, dynamic>>>>.value(
                _FakeEither_0<_i5.Failure, Map<String, Map<String, dynamic>>>(
              this,
              Invocation.method(
                #getMapLocalization,
                [],
              ),
            )),
          ) as _i4.Future<
              _i2.Either<_i5.Failure, Map<String, Map<String, dynamic>>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> saveEntity({
    required List<_i8.LocalizationEntity>? entities,
    required String? lang,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveEntity,
          [],
          {
            #entities: entities,
            #lang: lang,
          },
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #saveEntity,
            [],
            {
              #entities: entities,
              #lang: lang,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);
}
