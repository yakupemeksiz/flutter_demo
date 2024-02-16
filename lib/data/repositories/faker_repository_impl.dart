import 'package:flutter_demo/data/data_sources/faker_data_source.dart';
import 'package:flutter_demo/domain/entities/faker_response_entity.dart';
import 'package:flutter_demo/domain/repositories/faker_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FakerRepository)
final class FakerRepositoryImpl implements FakerRepository {
  final FakerDataSource _dataSource;

  FakerRepositoryImpl(this._dataSource);

  @override
  FakerResponseEntity getFakerData(int dataCount) {
    final res = _dataSource.getFakeData(dataCount);
    return FakerResponseEntity(
      items: res.items
          .map(
            (e) => FakeItemEntity(
              id: e.id,
              name: e.name,
              message: e.message,
              sendDate: e.sendDate,
            ),
          )
          .toList(),
    );
  }
}
