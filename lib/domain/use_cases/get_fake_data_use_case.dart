import 'package:flutter_demo/domain/entities/faker_response_entity.dart';
import 'package:flutter_demo/domain/repositories/faker_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
final class GetFakeDataUseCase {
  final FakerRepository _repository;

  const GetFakeDataUseCase(this._repository);

  FakerResponseEntity call(int dataCount) {
    return _repository.getFakerData(dataCount);
  }
}
