part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class FavouriteInit extends FavouriteEvent {
  const FavouriteInit();
}

class FavouriteLoad extends FavouriteEvent {
  final ContentCategory category;

  const FavouriteLoad({required this.category});
}
