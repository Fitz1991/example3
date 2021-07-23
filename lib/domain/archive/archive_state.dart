part of 'archive_bloc.dart';

@immutable
abstract class ArchiveState {}

class ArchiveInitial extends ArchiveState {}

class ArchiveData extends ArchiveState {
  BuiltList<Archive> archives;

  ArchiveData({this.archives});
}

class ErrorArchive extends ArchiveState {
  String message;
  ErrorArchive({this.message});
}

class LoadingArchive extends ArchiveState {}