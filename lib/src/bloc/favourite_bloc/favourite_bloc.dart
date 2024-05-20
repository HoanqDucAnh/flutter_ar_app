import 'package:flutter_ar_app/src/bloc/content_bloc/content_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ar_app/src/model/explore_card/explore_card.dart';
import 'package:flutter_ar_app/core/resources/content/content.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favourite_events.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  late SharedPreferences prefs;
  List<MuseumArtifactModel> allList = [];

  FavouriteBloc()
      : super(const FavouriteState(
          status: FavouriteStatus.initial,
          artifacts: [],
          category: ContentCategory.all,
        )) {
    on<FavouriteInit>(_onFavouriteInit);
    on<FavouriteLoad>(_onFavouriteLoad);
  }

  Future<void> _onFavouriteInit(
    FavouriteInit event,
    Emitter<FavouriteState> emit,
  ) async {
    emit(state.copyWith(status: FavouriteStatus.initial));
    prefs = await SharedPreferences.getInstance();
    allList.addAll(locationList);
    allList.addAll(planeList);
    allList.addAll(weaponList);

    await _onFetchedAllFavourite(emit);
  }

  Future<void> _onFavouriteLoad(
    FavouriteLoad event,
    Emitter<FavouriteState> emit,
  ) async {
    switch (event.category) {
      case ContentCategory.all:
        await _onFetchedAllFavourite(emit);
        break;
      case ContentCategory.location:
        await _onFetchedLocationFavourite(emit);
        break;
      case ContentCategory.plane:
        await _onFetchedPlaneFavourite(emit);
        break;
      case ContentCategory.weapon:
        await _onFetchedWeaponFavourite(emit);
        break;
    }
  }

  Future<void> _onFetchedAllFavourite(
    Emitter<FavouriteState> emit,
  ) async {
    emit(state.copyWith(status: FavouriteStatus.loading));

    try {
      List<String> favouriteStringFromPrefs =
          prefs.getStringList('myFavourite') ?? [];
      List<MuseumArtifactModel> allFavouriteList = allList
          .where((element) => favouriteStringFromPrefs.contains(element.title))
          .toList();
      emit(state.copyWith(
        status: FavouriteStatus.success,
        artifacts: allFavouriteList,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: FavouriteStatus.failure,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onFetchedLocationFavourite(
    Emitter<FavouriteState> emit,
  ) async {
    emit(state.copyWith(status: FavouriteStatus.loading));

    try {
      List<String> favouriteStringFromPrefs =
          prefs.getStringList('myFavourite') ?? [];
      final List<MuseumArtifactModel> favouriteArtifacts = locationList
          .where((element) => favouriteStringFromPrefs.contains(element.title))
          .toList();
      emit(state.copyWith(
        status: FavouriteStatus.success,
        artifacts: favouriteArtifacts,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: FavouriteStatus.failure,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onFetchedPlaneFavourite(
    Emitter<FavouriteState> emit,
  ) async {
    emit(state.copyWith(status: FavouriteStatus.loading));

    try {
      List<String> favouriteStringFromPrefs =
          prefs.getStringList('myFavourite') ?? [];
      final List<MuseumArtifactModel> favouriteArtifacts = planeList
          .where((element) => favouriteStringFromPrefs.contains(element.title))
          .toList();
      emit(state.copyWith(
        status: FavouriteStatus.success,
        artifacts: favouriteArtifacts,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: FavouriteStatus.failure,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onFetchedWeaponFavourite(
    Emitter<FavouriteState> emit,
  ) async {
    emit(state.copyWith(status: FavouriteStatus.loading));

    try {
      List<String> favouriteStringFromPrefs =
          prefs.getStringList('myFavourite') ?? [];
      final List<MuseumArtifactModel> favouriteArtifacts = weaponList
          .where((element) => favouriteStringFromPrefs.contains(element.title))
          .toList();
      emit(state.copyWith(
        status: FavouriteStatus.success,
        artifacts: favouriteArtifacts,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: FavouriteStatus.failure,
        error: e.toString(),
      ));
    }
  }
}
