import 'package:flutter/material.dart';
import 'package:flutter_demo/core/cubit/base_cubit.dart';
import 'package:flutter_demo/core/utils/helpers/debounce.dart';
import 'package:flutter_demo/domain/entities/faker_response_entity.dart';
import 'package:flutter_demo/domain/use_cases/get_fake_data_use_case.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@injectable
final class HomeCubit extends BaseCubit<HomeState> {
  final GetFakeDataUseCase _getFakeDataUseCase;
  HomeCubit(this._getFakeDataUseCase) : super(HomeInitial());

  final int _fakeDataCount = 5;

  final _likeDebounce = Debounce();
  bool canUseLikeButton = true;

  @override
  void onBindingCreated() {
    super.onBindingCreated();
    getFakeData();
  }

  void getFakeData() {
    emit(HomeLoading());

    Future.delayed(const Duration(milliseconds: 500), () {
      final res = _getFakeDataUseCase(_fakeDataCount);

      emit(HomeLoaded(res.items));
    });
  }

  void likeItem(FakeItemEntity item) {
    if (canUseLikeButton) {
      canUseLikeButton = false;

      final likedData = (state as HomeLoaded).fakeData.map((entity) {
        if (entity.id == item.id) {
          return entity.copyWith(isLiked: !entity.isLiked);
        }

        return entity;
      }).toList();

      emit((state as HomeLoaded).copyWith(fakeData: likedData));

      _likeDebounce.call(() {
        canUseLikeButton = true;
      });
    }
  }

  @override
  Future<void> close() {
    _likeDebounce.dispose();
    return super.close();
  }
}
