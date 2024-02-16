import 'package:faker/faker.dart';
import 'package:flutter_demo/data/models/faker_response_model.dart';

final class FakerDataSource {
  final Faker _faker;

  FakerDataSource(this._faker);

  Map<String, dynamic> _getFakeDataFromJson(int dataCount) {
    return {
      'items': List.generate(
        dataCount,
        (index) => {
          'id': _faker.guid.guid(),
          'name': _faker.person.name(),
          'message': _faker.lorem.sentences(3),
          'sendDate': _faker.date
              .dateTime(
                minYear: DateTime.now().year - 10,
                maxYear: DateTime.now().year,
              )
              .toIso8601String(),
        },
      ),
    };
  }

  FakerResponseModel getFakeData(int dataCount) {
    return FakerResponseModel.fromJson(_getFakeDataFromJson(dataCount));
  }
}
