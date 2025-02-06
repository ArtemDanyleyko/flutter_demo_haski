import 'package:haski/models/shifts/shift.dart';

abstract class ShiftsManager {
  Future<List<Shift>> loadShifts();
  Future<Shift?> editShift(Shift shift);
}
