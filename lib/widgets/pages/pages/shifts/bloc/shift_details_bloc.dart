import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haski/managers/shifts/shifts_manager.dart';
import 'package:haski/models/shifts/shift.dart';
import 'package:haski/widgets/pages/pages/shifts/bloc/shift_details_event.dart';
import 'package:haski/widgets/pages/pages/shifts/bloc/shift_details_state.dart';

class ShiftDetailsBloc extends Bloc<ShiftDetailsEvent, ShiftDetailsState> {
  ShiftDetailsBloc({required this.shiftsManager, required this.shift})
      : super(ShiftDetailsInitial()) {
    on<ShiftDetailsEvent>(_onSignUpShift);
  }

  final ShiftsManager shiftsManager;
  Shift shift;

  Future<void> _onSignUpShift(
      ShiftDetailsEvent event, Emitter<ShiftDetailsState> emit) async {
    var editedShift = await shiftsManager.editShift(shift);
    if (editedShift != null) {
      shift = editedShift;
      emit(SignedShift(editedShift: editedShift));
    }
  }
}
