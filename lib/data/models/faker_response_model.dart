import 'package:equatable/equatable.dart';

final class FakerResponseModel extends Equatable {
  final List<FakeItemModel> items;

  const FakerResponseModel({
    required this.items,
  });

  factory FakerResponseModel.fromJson(Map<String, dynamic> json) {
    return FakerResponseModel(
      items: List<FakeItemModel>.from(
        json['items'].map((dynamic x) => FakeItemModel.fromJson(x)),
      ),
    );
  }

  @override
  List<Object?> get props => [items];
}

final class FakeItemModel extends Equatable {
  final String id;
  final String name;
  final List<String> message;
  final DateTime sendDate;

  const FakeItemModel({
    required this.id,
    required this.name,
    required this.message,
    required this.sendDate,
  });

  factory FakeItemModel.fromJson(Map<String, dynamic> json) {
    return FakeItemModel(
      id: json['id'],
      name: json['name'],
      message: List<String>.from(json['message']),
      sendDate: DateTime.parse(json['sendDate']),
    );
  }

  @override
  List<Object?> get props => [id, name, message, sendDate];
}
