import 'package:equatable/equatable.dart';
import 'package:haski/models/shifts/shift.dart';

abstract class ShiftDetailsState extends Equatable {}

class ShiftDetailsInitial extends ShiftDetailsState {
  @override
  List<Object?> get props => [];
}

class SignedShift extends ShiftDetailsState {
  SignedShift({required this.editedShift});

  final Shift editedShift;

  @override
  List<Object?> get props => [];
}
