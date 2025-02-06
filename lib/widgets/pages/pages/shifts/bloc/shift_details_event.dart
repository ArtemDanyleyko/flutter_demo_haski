import 'package:equatable/equatable.dart';

abstract class ShiftDetailsEvent extends Equatable {
  const ShiftDetailsEvent();
}

class SignUpShift extends ShiftDetailsEvent {
  const SignUpShift();

  @override
  List<Object?> get props => [];
}
