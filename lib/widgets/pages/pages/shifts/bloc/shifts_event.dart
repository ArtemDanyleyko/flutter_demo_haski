import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:haski/common/load_type.dart';

abstract class ShiftsEvent extends Equatable {
  const ShiftsEvent();
}

class LoadShifts extends ShiftsEvent {
  final LoadType loadType;
  final Completer? completer;
  const LoadShifts({
    this.completer,
    this.loadType = LoadType.initial,
  });

  @override
  List<Object?> get props => [loadType, completer];
}

class FilterShifts extends ShiftsEvent {
  final DateTimeRange? dateTimeRange;
  const FilterShifts(this.dateTimeRange);

  @override
  List<Object?> get props => [dateTimeRange];
}

class ChangeShiftsTab extends ShiftsEvent {
  final int tabIndex;
  const ChangeShiftsTab(this.tabIndex);

  @override
  List<Object?> get props => [tabIndex];
}
