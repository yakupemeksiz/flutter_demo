part of 'home_cubit.dart';

sealed class HomeState extends BaseState {
  const HomeState();

  Widget when({
    required Widget Function() initial,
    required Widget Function() loading,
    required Widget Function(HomeLoaded state) loaded,
  }) {
    return switch (this) {
      HomeInitial() => initial(),
      HomeLoading() => loading(),
      HomeLoaded() => loaded(this as HomeLoaded)
    };
  }
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<FakeItemEntity> fakeData;

  const HomeLoaded(this.fakeData);

  HomeLoaded copyWith({
    List<FakeItemEntity>? fakeData,
  }) {
    return HomeLoaded(
      fakeData ?? this.fakeData,
    );
  }
}
