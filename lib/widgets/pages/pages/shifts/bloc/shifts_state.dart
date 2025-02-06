import 'package:equatable/equatable.dart';
import 'package:haski/models/shifts/shift_group.dart';

abstract class ShiftsState extends Equatable {}

class ShiftsInitial extends ShiftsState {
  @override
  List<Object?> get props => [];
}

class ShiftsLoading extends ShiftsState {
  @override
  List<Object?> get props => [];
}

class ShiftsLoaded extends ShiftsState {
  final List<ShiftGroup> shifts;
  final int totalShiftsCount;

  ShiftsLoaded(this.shifts, this.totalShiftsCount);

  @override
  List<Object?> get props => [shifts, totalShiftsCount];
}

class ShiftsError extends ShiftsState {
  final Object? exeption;

  ShiftsError(this.exeption);

  @override
  List<Object?> get props => [exeption];
}

class TabChanged extends ShiftsState {
  final List<ShiftGroup> shifts;

  TabChanged({required this.shifts});

  @override
  List<Object?> get props => [shifts];
}
