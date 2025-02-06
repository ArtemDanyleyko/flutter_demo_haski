import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haski/common/load_type.dart';
import 'package:haski/dialog/dialog_service.dart';
import 'package:haski/managers/shifts/shifts_manager.dart';
import 'package:haski/models/shifts/shift.dart';
import 'package:haski/repositories/shifts/shifts_repository.dart';
import 'package:haski/widgets/pages/pages/shifts/bloc/shifts_event.dart';
import 'package:haski/widgets/pages/pages/shifts/bloc/shifts_state.dart';

class ShiftsBloc extends Bloc<ShiftsEvent, ShiftsState> {
  final ShiftsManager shiftsManager;
  final ShiftRepository shiftRepository;
  final DialogService dialogService;
  List<Shift> _allShifts = [];
  int _currentTabIndex = 0;
  DateTimeRange? _dateTimeRange;

  ShiftsBloc(
      {required this.shiftsManager,
      required this.shiftRepository,
      required this.dialogService})
      : super(ShiftsInitial()) {
    on<LoadShifts>(_onLoadShifts);
    on<ChangeShiftsTab>(_onChangeShiftsTab);
    on<FilterShifts>(_onFiltereShifts);
  }

  Future<void> _onLoadShifts(
      LoadShifts event, Emitter<ShiftsState> emit) async {
    if (event.loadType == LoadType.initial) {
      emit(ShiftsLoading());
    }

    try {
      _allShifts = await shiftsManager.loadShifts();
      final groupedShifts = shiftRepository.groupShifts(
          _allShifts, _currentTabIndex, _dateTimeRange);
      emit(ShiftsLoaded(groupedShifts, _allShifts.length));
    } catch (error) {
      emit(ShiftsError(error.toString()));
      dialogService.showToast(error.toString());
    } finally {
      event.completer?.complete();
    }
  }

  void _onChangeShiftsTab(ChangeShiftsTab event, Emitter<ShiftsState> emit) {
    _currentTabIndex = event.tabIndex;
    if (_allShifts.isEmpty) {
      add(const LoadShifts(loadType: LoadType.initial));
      return;
    }

    final groupedShifts = shiftRepository.groupShifts(
        _allShifts, _currentTabIndex, _dateTimeRange);
    emit(ShiftsLoaded(groupedShifts, _allShifts.length));
  }

  void _onFiltereShifts(FilterShifts event, Emitter<ShiftsState> emit) {
    _dateTimeRange = event.dateTimeRange;
    if (_allShifts.isEmpty) {
      add(const LoadShifts(loadType: LoadType.initial));
      return;
    }

    final groupedShifts = shiftRepository.groupShifts(
        _allShifts, _currentTabIndex, _dateTimeRange);
    emit(ShiftsLoaded(groupedShifts, _allShifts.length));
  }
}
