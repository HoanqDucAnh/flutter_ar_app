part of 'content_bloc.dart';

abstract class ContentEvent extends Equatable {
  const ContentEvent();

  @override
  List<Object> get props => [];
}

class ContentFetched extends ContentEvent {
  final ContentCategory category;

  const ContentFetched({required this.category});
}
