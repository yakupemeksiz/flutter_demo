import 'package:flutter_demo/domain/entities/faker_response_entity.dart';

abstract interface class FakerRepository {
  FakerResponseEntity getFakerData(int dataCount);
}
