import 'dart:async';
import 'dart:math';

import 'package:haski/managers/shifts/shifts_manager.dart';
import 'package:haski/models/shifts/shift.dart';

class ShiftsManagerImpl extends ShiftsManager {
  final Random _random = Random();

  @override
  Future<List<Shift>> loadShifts() {
    final shiftsList1 = [
      Shift(
          id: 1,
          title: 'Смена 1',
          address: "Киев, Бакинская 54",
          shiftState: ShiftState(text: "можно записаться", isAvailable: true),
          startTime: DateTime.now(),
          empoyeesCount: 2,
          freeSeatsCount: 5,
          ratePerHour: 300,
          hoursForShift: 18,
          salaryRate: "₴ 50 000",
          status: ShiftStatus.worked),
      Shift(
          id: 2,
          title: 'Смена 2',
          address: "Киев, Бакинская 54",
          shiftState: ShiftState(text: "запись окончена", isAvailable: false),
          startTime: DateTime.now().add(Duration(hours: 1)),
          empoyeesCount: 1,
          freeSeatsCount: 5,
          ratePerHour: 300,
          hoursForShift: 18,
          salaryRate: "₴ 50 000",
          status: ShiftStatus.planned),
      Shift(
          id: 3,
          title: 'Смена 3',
          address: "Киев, Бакинская 54",
          shiftState: ShiftState(text: "можно записаться", isAvailable: true),
          startTime: DateTime.now().add(Duration(days: 1)),
          empoyeesCount: 3,
          freeSeatsCount: 5,
          ratePerHour: 350,
          hoursForShift: 18,
          salaryRate: "₴ 55 000",
          status: ShiftStatus.worked),
      Shift(
          id: 4,
          title: 'Смена 4',
          address: "Киев, Бакинская 54",
          shiftState: ShiftState(text: "запись окончена", isAvailable: false),
          startTime: DateTime.now().add(Duration(days: 2)),
          empoyeesCount: 2,
          freeSeatsCount: 5,
          ratePerHour: 320,
          hoursForShift: 18,
          salaryRate: "₴ 52 000",
          status: ShiftStatus.canceled),
    ];

    final shiftsList2 = [
      Shift(
          id: 5,
          title: 'Смена 5',
          address: "Киев, Бакинская 54",
          shiftState: ShiftState(text: "отменено", isAvailable: false),
          startTime: DateTime.now().add(Duration(days: 3)),
          empoyeesCount: 0,
          freeSeatsCount: 5,
          ratePerHour: 300,
          hoursForShift: 18,
          salaryRate: "₴ 50 000",
          status: ShiftStatus.canceled),
      Shift(
          id: 6,
          title: 'Смена 6',
          address: "Киев, Бакинская 54",
          shiftState: ShiftState(text: "можно записаться", isAvailable: true),
          startTime: DateTime.now().add(Duration(days: 4)),
          empoyeesCount: 1,
          freeSeatsCount: 5,
          ratePerHour: 340,
          hoursForShift: 18,
          salaryRate: "₴ 55 000",
          status: ShiftStatus.worked),
      Shift(
          id: 7,
          title: 'Смена 7',
          address: "Киев, Бакинская 55",
          shiftState: ShiftState(text: "можно записаться", isAvailable: true),
          startTime: DateTime.now().add(Duration(days: 5)),
          empoyeesCount: 4,
          freeSeatsCount: 5,
          ratePerHour: 330,
          hoursForShift: 18,
          salaryRate: "₴ 53 000",
          status: ShiftStatus.worked),
      Shift(
          id: 8,
          title: 'Смена 8',
          address: "Киев, Бакинская 55",
          shiftState: ShiftState(text: "запись окончена", isAvailable: false),
          startTime: DateTime.now().add(Duration(days: 6)),
          empoyeesCount: 5,
          freeSeatsCount: 5,
          ratePerHour: 300,
          hoursForShift: 18,
          salaryRate: "₴ 50 000",
          status: ShiftStatus.planned),
    ];

    final shiftsList3 = [
      Shift(
          id: 9,
          title: 'Смена 9',
          address: "Киев, Леси Украинки 8",
          shiftState: ShiftState(text: "отменено", isAvailable: false),
          startTime: DateTime.now().add(Duration(days: 7)),
          empoyeesCount: 0,
          freeSeatsCount: 5,
          ratePerHour: 380,
          hoursForShift: 18,
          salaryRate: "₴ 60 000",
          status: ShiftStatus.canceled),
      Shift(
          id: 10,
          title: 'Смена 10',
          address: "Киев, Леси Украинки 8",
          shiftState: ShiftState(text: "можно записаться", isAvailable: true),
          startTime: DateTime.now().add(Duration(days: 8)),
          empoyeesCount: 2,
          freeSeatsCount: 5,
          ratePerHour: 350,
          hoursForShift: 18,
          salaryRate: "₴ 55 000",
          status: ShiftStatus.worked),
      Shift(
          id: 11,
          title: 'Смена 11',
          address: "Киев, Леси Украинки 8",
          shiftState: ShiftState(text: "запись окончена", isAvailable: false),
          startTime: DateTime.now().add(Duration(days: 9)),
          empoyeesCount: 3,
          freeSeatsCount: 5,
          ratePerHour: 300,
          hoursForShift: 18,
          salaryRate: "₴ 50 000",
          status: ShiftStatus.planned),
      Shift(
          id: 12,
          title: 'Смена 12',
          address: "Киев, Леси Украинки 8",
          shiftState: ShiftState(text: "можно записаться", isAvailable: true),
          startTime: DateTime.now().add(Duration(days: 10)),
          empoyeesCount: 1,
          freeSeatsCount: 5,
          ratePerHour: 320,
          hoursForShift: 18,
          salaryRate: "₴ 52 000",
          status: ShiftStatus.worked),
    ];

    final shiftsList4 = [
      Shift(
          id: 13,
          title: 'Смена 13',
          address: "Киев, Печерск 10",
          shiftState: ShiftState(text: "отменено", isAvailable: false),
          startTime: DateTime.now().add(Duration(days: 11)),
          empoyeesCount: 0,
          freeSeatsCount: 5,
          ratePerHour: 300,
          hoursForShift: 18,
          salaryRate: "₴ 50 000",
          status: ShiftStatus.canceled),
      Shift(
          id: 14,
          title: 'Смена 14',
          address: "Киев, Печерск 10",
          shiftState: ShiftState(text: "можно записаться", isAvailable: true),
          startTime: DateTime.now().add(Duration(days: 12)),
          empoyeesCount: 4,
          freeSeatsCount: 5,
          ratePerHour: 330,
          hoursForShift: 18,
          salaryRate: "₴ 53 000",
          status: ShiftStatus.worked),
      Shift(
          id: 15,
          title: 'Смена 15',
          address: "Киев, Печерск 10",
          shiftState: ShiftState(text: "запись окончена", isAvailable: false),
          startTime: DateTime.now().add(Duration(days: 13)),
          empoyeesCount: 5,
          freeSeatsCount: 5,
          ratePerHour: 300,
          hoursForShift: 18,
          salaryRate: "₴ 50 000",
          status: ShiftStatus.planned),
      Shift(
          id: 16,
          title: 'Смена 16',
          address: "Киев, Печерск 10",
          shiftState: ShiftState(text: "можно записаться", isAvailable: true),
          startTime: DateTime.now().add(Duration(days: 14)),
          empoyeesCount: 3,
          freeSeatsCount: 5,
          ratePerHour: 320,
          hoursForShift: 18,
          salaryRate: "₴ 52 000",
          status: ShiftStatus.worked),
    ];

    final shiftsList5 = [
      Shift(
          id: 17,
          title: 'Смена 17',
          address: "Киев, Шулявка 15",
          shiftState: ShiftState(text: "можно записаться", isAvailable: true),
          startTime: DateTime.now().add(Duration(days: 15)),
          empoyeesCount: 3,
          freeSeatsCount: 5,
          ratePerHour: 340,
          hoursForShift: 18,
          salaryRate: "₴ 53 000",
          status: ShiftStatus.planned),
      Shift(
          id: 18,
          title: 'Смена 18',
          address: "Киев, Шулявка 15",
          shiftState: ShiftState(text: "отменено", isAvailable: false),
          startTime: DateTime.now().add(Duration(days: 16)),
          empoyeesCount: 5,
          freeSeatsCount: 5,
          ratePerHour: 290,
          hoursForShift: 18,
          salaryRate: "₴ 48 000",
          status: ShiftStatus.canceled),
      Shift(
          id: 19,
          title: 'Смена 19',
          address: "Киев, Шулявка 15",
          shiftState: ShiftState(text: "можно записаться", isAvailable: true),
          startTime: DateTime.now().add(Duration(days: 17)),
          empoyeesCount: 2,
          freeSeatsCount: 5,
          ratePerHour: 310,
          hoursForShift: 18,
          salaryRate: "₴ 51 000",
          status: ShiftStatus.worked),
      Shift(
          id: 20,
          title: 'Смена 20',
          address: "Киев, Шулявка 15",
          shiftState: ShiftState(text: "запись окончена", isAvailable: false),
          startTime: DateTime.now().add(Duration(days: 18)),
          empoyeesCount: 1,
          freeSeatsCount: 5,
          ratePerHour: 300,
          hoursForShift: 18,
          salaryRate: "₴ 50 000",
          status: ShiftStatus.planned),
    ];

    final allShifts = [
      shiftsList1,
      shiftsList2,
      shiftsList3,
      shiftsList4,
      shiftsList5
    ];
    int randomIndex = _random.nextInt(allShifts.length);

    return Future.delayed(Duration(seconds: 2), () => allShifts[randomIndex]);
  }

  @override
  Future<Shift?> editShift(Shift shift) {
    var editedShift = shift.copyWith(
        shiftState: ShiftState(text: "Запись окончена", isAvailable: false));
    return Future.value(editedShift);
  }
}
