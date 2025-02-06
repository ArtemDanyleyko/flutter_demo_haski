import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:haski/common/load_type.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class LoadContent extends NewsEvent {
  final LoadType loadType;
  final Completer? completer;
  const LoadContent({
    this.completer,
    this.loadType = LoadType.initial,
  });

  @override
  List<Object?> get props => [loadType, completer];
}

class ChangeTab extends NewsEvent {
  final int tabIndex;
  const ChangeTab(this.tabIndex);

  @override
  List<Object?> get props => [tabIndex];
}
