import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haski/common/app_colors.dart';
import 'package:haski/extensions/datetime_extension.dart';
import 'package:haski/generated/locale_keys.g.dart';
import 'package:haski/managers/shifts/shifts_manager.dart';
import 'package:haski/models/shifts/shift.dart';
import 'package:haski/widgets/pages/pages/shifts/bloc/shift_details_bloc.dart';
import 'package:haski/widgets/pages/pages/shifts/bloc/shift_details_event.dart';
import 'package:haski/widgets/pages/pages/shifts/bloc/shift_details_state.dart';
import 'package:haski/widgets/pages/pages/shifts/items/shift_details_field.dart';
import 'package:injector/injector.dart';

class ShiftDetailsPage extends StatefulWidget {
  final Shift shift;

  const ShiftDetailsPage({super.key, required this.shift});

  @override
  _ShiftsPageState createState() => _ShiftsPageState();
}

class _ShiftsPageState extends State<ShiftDetailsPage> {
  late final ShiftDetailsBloc _screenCubit;
  late final ShiftsManager shiftsManager;

  _ShiftsPageState();

  @override
  void initState() {
    super.initState();
    final injector = Injector.appInstance;
    shiftsManager = injector.get<ShiftsManager>();

    _screenCubit =
        ShiftDetailsBloc(shiftsManager: shiftsManager, shift: widget.shift);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: BlocBuilder<ShiftDetailsBloc, ShiftDetailsState>(
        bloc: _screenCubit,
        builder: (context, state) {
          final currentShift =
              state is SignedShift ? state.editedShift : widget.shift;
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Chip(
                    padding: EdgeInsets.all(0),
                    label: Text(currentShift.shiftState.text.toUpperCase(),
                        style: TextStyle(
                            fontSize: 10,
                            color: currentShift.shiftState.isAvailable
                                ? AppColors.avagduGreen
                                : AppColors.bittersweet,
                            fontWeight: FontWeight.w600)),
                    backgroundColor: currentShift.shiftState.isAvailable
                        ? AppColors.mistyLawn
                        : AppColors.unburdenedPink,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.transparent)),
                  ),
                  Text(currentShift.title,
                      style: TextStyle(
                          fontSize: 32,
                          color: AppColors.black,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 20,
                  ),
                  ShiftDetailsField(
                      title: LocaleKeys.date.tr(),
                      subtitle: currentShift.startTime.longDate),
                  SizedBox(height: 20.0),
                  ShiftDetailsField(
                      title: LocaleKeys.selectedSeatsCount.tr(),
                      subtitle: LocaleKeys.peopleCount
                          .plural(currentShift.freeSeatsCount)),
                  SizedBox(height: 20.0),
                  ShiftDetailsField(
                      title: LocaleKeys.alreadySignedUp.tr(),
                      subtitle: LocaleKeys.peopleCount
                          .plural(currentShift.empoyeesCount)),
                  SizedBox(height: 20.0),
                  ShiftDetailsField(
                      title: LocaleKeys.ratePerHour.tr(),
                      subtitle: LocaleKeys.ratePerHourFormatted
                          .plural(currentShift.ratePerHour)),
                  SizedBox(height: 20.0),
                  ShiftDetailsField(
                      title: LocaleKeys.allocatedHoursForShift.tr(),
                      subtitle: currentShift.hoursForShift.toString()),
                  SizedBox(height: 20.0),
                  ShiftDetailsField(
                      title: LocaleKeys.budget.tr(),
                      subtitle: currentShift.salaryRate),
                  SizedBox(height: 20.0),
                  ShiftDetailsField(
                      title: LocaleKeys.address.tr(),
                      subtitle: currentShift.address),
                  SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.center,
                    child: IgnorePointer(
                      ignoring: !currentShift.shiftState.isAvailable,
                      child: GestureDetector(
                          onTap: () => {_screenCubit.add(SignUpShift())},
                          child: Text(
                            LocaleKeys.signUp.tr(),
                            style: TextStyle(
                                fontSize: 17,
                                color: currentShift.shiftState.isAvailable
                                    ? AppColors.main
                                    : Colors.transparent,
                                fontWeight: FontWeight.w400),
                          )),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
