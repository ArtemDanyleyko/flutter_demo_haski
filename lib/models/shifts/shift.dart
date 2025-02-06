import 'package:equatable/equatable.dart';

class Shift extends Equatable {
  const Shift({
    required this.id,
    required this.title,
    required this.address,
    required this.shiftState,
    required this.startTime,
    required this.empoyeesCount,
    required this.freeSeatsCount,
    required this.ratePerHour,
    required this.hoursForShift,
    required this.salaryRate,
    required this.status,
  });

  final int id;
  final String title;
  final String address;
  final ShiftState shiftState;
  final DateTime startTime;
  final int empoyeesCount;
  final int freeSeatsCount;
  final int ratePerHour;
  final int hoursForShift;
  final String salaryRate;
  final ShiftStatus status;

  String get empoyeesCountFormat =>
      "$empoyeesCount/$freeSeatsCount сотрудников";

  String get ratePerHourFormat => "₴ $ratePerHour/час";

  @override
  List<Object> get props {
    return [
      id,
      title,
      address,
      shiftState,
      startTime,
      empoyeesCount,
      freeSeatsCount,
      ratePerHour,
      hoursForShift,
      salaryRate,
      status,
    ];
  }

  Shift copyWith(
      {int? id,
      String? title,
      String? address,
      ShiftState? shiftState,
      DateTime? startTime,
      int? empoyeesCount,
      int? freeSeatsCount,
      int? ratePerHour,
      int? hoursForShift,
      String? salaryRate,
      ShiftStatus? status}) {
    return Shift(
        id: id ?? this.id,
        title: title ?? this.title,
        address: address ?? this.address,
        shiftState: shiftState ?? this.shiftState,
        empoyeesCount: empoyeesCount ?? this.empoyeesCount,
        freeSeatsCount: freeSeatsCount ?? this.freeSeatsCount,
        ratePerHour: ratePerHour ?? this.ratePerHour,
        hoursForShift: hoursForShift ?? this.hoursForShift,
        salaryRate: salaryRate ?? this.salaryRate,
        status: status ?? this.status,
        startTime: startTime ?? this.startTime);
  }
}

class ShiftState extends Equatable {
  final String text;
  final bool isAvailable;

  const ShiftState({required this.text, required this.isAvailable});

  @override
  List<Object?> get props => [text, isAvailable];
}

enum ShiftStatus {
  canceled,
  worked,
  planned;
}
