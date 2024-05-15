import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ar_app/src/model/explore_card/explore_card.dart';
import 'package:flutter_ar_app/core/resources/content/content.dart';

part 'content_events.dart';
part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  ContentBloc()
      : super(const ContentState(
          status: ContentStatus.initial,
          artifacts: [],
          category: ContentCategory.all,
        )) {
    on<ContentFetched>(_onContentFetched);
  }

  Future<void> _onContentFetched(
    ContentFetched event,
    Emitter<ContentState> emit,
  ) async {
    switch (event.category) {
      case ContentCategory.all:
        await _onFetchedAllContent(emit);
        break;
      case ContentCategory.location:
        await _onFetchedLocationContent(emit);
        break;
      case ContentCategory.plane:
        await _onFetchedPlaneContent(emit);
        break;
      case ContentCategory.weapon:
        await _onFetchedWeaponContent(emit);
        break;
    }
  }

  Future<void> _onFetchedAllContent(
    Emitter<ContentState> emit,
  ) async {
    emit(state.copyWith(status: ContentStatus.loading));

    try {
      //merge 3 list into one
      List<MuseumArtifactModel> allList = [];
      allList.addAll(planeList);
      allList.addAll(locationList);
      allList.addAll(weaponList);
      final List<MuseumArtifactModel> artifacts = allList;
      emit(state.copyWith(
        status: ContentStatus.success,
        artifacts: artifacts,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: ContentStatus.failure,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onFetchedLocationContent(
    Emitter<ContentState> emit,
  ) async {
    emit(state.copyWith(status: ContentStatus.loading));

    try {
      final List<MuseumArtifactModel> artifacts = locationList;
      emit(state.copyWith(
        status: ContentStatus.success,
        artifacts: artifacts,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: ContentStatus.failure,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onFetchedPlaneContent(
    Emitter<ContentState> emit,
  ) async {
    emit(state.copyWith(status: ContentStatus.loading));

    try {
      final List<MuseumArtifactModel> artifacts = planeList;
      emit(state.copyWith(
        status: ContentStatus.success,
        artifacts: artifacts,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: ContentStatus.failure,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onFetchedWeaponContent(
    Emitter<ContentState> emit,
  ) async {
    emit(state.copyWith(status: ContentStatus.loading));

    try {
      final List<MuseumArtifactModel> artifacts = weaponList;
      emit(state.copyWith(
        status: ContentStatus.success,
        artifacts: artifacts,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: ContentStatus.failure,
        error: e.toString(),
      ));
    }
  }
}
