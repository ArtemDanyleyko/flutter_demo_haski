import 'package:equatable/equatable.dart';
import 'package:haski/models/shifts/shift.dart';

class ShiftGroup extends Equatable {
  final ShiftStatus status;
  final List<Shift> shifts;

  const ShiftGroup({
    required this.status,
    required this.shifts,
  });

  @override
  List<Object?> get props => [status, shifts];
}
