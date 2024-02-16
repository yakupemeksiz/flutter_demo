import 'package:faker/faker.dart';
import 'package:flutter_demo/data/data_sources/faker_data_source.dart';
import 'package:flutter_demo/inject.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.init();
}

@module
abstract class RegisterModule {
  final FakerDataSource fakerDataSource = FakerDataSource(Faker());
}
