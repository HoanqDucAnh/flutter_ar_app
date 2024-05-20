part of 'favourite_bloc.dart';

enum FavouriteStatus { initial, loading, success, failure }

class FavouriteState extends Equatable {
  const FavouriteState({
    required this.status,
    this.error,
    this.artifacts,
    this.category,
  });

  final List<MuseumArtifactModel>? artifacts;
  final FavouriteStatus? status;
  final ContentCategory? category;
  final String? error;

  @override
  List<Object?> get props => [status, error];

  FavouriteState copyWith({
    FavouriteStatus? status,
    String? error,
    List<MuseumArtifactModel>? artifacts,
    List<String>? favouriteStringFromPrefs,
    ContentCategory? category,
  }) {
    return FavouriteState(
      status: status ?? this.status,
      error: error,
      artifacts: artifacts ?? this.artifacts,
      category: category ?? this.category,
    );
  }
}
