part of 'archive_bloc.dart';

@immutable
abstract class ArchiveEvent {}

class GetArchiveEvent extends ArchiveEvent{}
class LoadingArchiveEvent extends ArchiveEvent{}
class SuccessArchiveEvent extends ArchiveEvent{
  BuiltList<Archive> archives;

  SuccessArchiveEvent({this.archives});
}
class ErrorArchiveEvent extends ArchiveEvent{
  String message;

  ErrorArchiveEvent({this.message});
}