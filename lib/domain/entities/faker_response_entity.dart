import 'package:equatable/equatable.dart';

final class FakerResponseEntity extends Equatable {
  final List<FakeItemEntity> items;

  const FakerResponseEntity({
    required this.items,
  });

  @override
  List<Object?> get props => [items];
}

final class FakeItemEntity extends Equatable {
  final String id;
  final String name;
  final List<String> message;
  final DateTime sendDate;
  final bool isLiked;

  const FakeItemEntity({
    required this.id,
    required this.name,
    required this.message,
    required this.sendDate,
    this.isLiked = false,
  });
  FakeItemEntity copyWith({
    String? id,
    String? name,
    List<String>? message,
    DateTime? sendDate,
    bool? isLiked,
  }) {
    return FakeItemEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      message: message ?? this.message,
      sendDate: sendDate ?? this.sendDate,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  @override
  List<Object?> get props => [id, name, message, sendDate, isLiked];
}
