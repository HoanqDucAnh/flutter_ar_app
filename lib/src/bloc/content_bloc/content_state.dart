part of 'content_bloc.dart';

enum ContentStatus { initial, loading, success, failure }

enum ContentCategory { all, location, plane, weapon }

class ContentState extends Equatable {
  const ContentState({
    required this.status,
    this.artifacts = const [],
    required this.category,
    this.error,
  });

  final List<MuseumArtifactModel>? artifacts;
  final ContentStatus? status;
  final ContentCategory? category;
  final String? error;

  @override
  List<Object?> get props => [status, error];

  ContentState copyWith({
    ContentStatus? status,
    String? error,
    List<MuseumArtifactModel>? artifacts,
    ContentCategory? category,
  }) {
    return ContentState(
      status: status ?? this.status,
      error: error ?? this.error,
      artifacts: artifacts ?? this.artifacts,
      category: category ?? this.category,
    );
  }
}
