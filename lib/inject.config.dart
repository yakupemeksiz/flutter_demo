// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_demo/data/data_sources/faker_data_source.dart' as _i3;
import 'package:flutter_demo/data/repositories/faker_repository_impl.dart'
    as _i5;
import 'package:flutter_demo/domain/repositories/faker_repository.dart' as _i4;
import 'package:flutter_demo/domain/use_cases/get_fake_data_use_case.dart'
    as _i6;
import 'package:flutter_demo/inject.dart' as _i8;
import 'package:flutter_demo/presentation/views/home/cubit/home_cubit.dart'
    as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.FakerDataSource>(() => registerModule.fakerDataSource);
    gh.factory<_i4.FakerRepository>(
        () => _i5.FakerRepositoryImpl(gh<_i3.FakerDataSource>()));
    gh.factory<_i6.GetFakeDataUseCase>(
        () => _i6.GetFakeDataUseCase(gh<_i4.FakerRepository>()));
    gh.factory<_i7.HomeCubit>(
        () => _i7.HomeCubit(gh<_i6.GetFakeDataUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i8.RegisterModule {}
