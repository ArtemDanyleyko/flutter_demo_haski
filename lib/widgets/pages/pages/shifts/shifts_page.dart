import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haski/common/app_colors.dart';
import 'package:haski/common/font_constants.dart';
import 'package:haski/common/load_type.dart';
import 'package:haski/dialog/dialog_service.dart';
import 'package:haski/managers/shifts/shifts_manager.dart';
import 'package:haski/repositories/shifts/shifts_repository.dart';
import 'package:haski/widgets/pages/pages/shifts/items/shifts_app_bar.dart';
import 'package:haski/widgets/pages/pages/shifts/items/shifts_group_list.dart';
import 'package:haski/widgets/pages/pages/shifts/bloc/shifts_bloc.dart';
import 'package:haski/widgets/pages/pages/shifts/bloc/shifts_event.dart';
import 'package:haski/widgets/pages/pages/shifts/bloc/shifts_state.dart';
import 'package:injector/injector.dart';

class ShiftsPage extends StatefulWidget {
  const ShiftsPage({super.key});

  @override
  _ShiftsPageState createState() => _ShiftsPageState();
}

class _ShiftsPageState extends State<ShiftsPage> {
  late final ShiftRepository shiftRepository;
  late final ShiftsManager shiftsManager;
  late final DialogService dialogService;
  late final ShiftsBloc _screenCubit;

  Completer<void>? _refreshCompleter;

  @override
  void initState() {
    super.initState();
    final injector = Injector.appInstance;
    shiftRepository = injector.get<ShiftRepository>();
    shiftsManager = injector.get<ShiftsManager>();
    dialogService = injector.get<DialogService>();

    _screenCubit = ShiftsBloc(
      shiftsManager: shiftsManager,
      shiftRepository: shiftRepository,
      dialogService: dialogService,
    );

    _screenCubit.add(const LoadShifts(loadType: LoadType.initial));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShiftsBloc, ShiftsState>(
      bloc: _screenCubit,
      listener: (context, state) {
        if (state is ShiftsLoaded || state is ShiftsError) {
          _refreshCompleter?.complete();
          _refreshCompleter = null;
        }
      },
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: AppColors.pageBackground,
          appBar: ShiftsAppBar(screenCubit: _screenCubit),
          body: RefreshIndicator(
            onRefresh: () {
              _refreshCompleter = Completer<void>();
              _screenCubit.add(const LoadShifts(loadType: LoadType.refresh));
              return _refreshCompleter!.future;
            },
            child: BlocBuilder<ShiftsBloc, ShiftsState>(
              bloc: _screenCubit,
              builder: (context, state) {
                if (state is ShiftsInitial || state is ShiftsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ShiftsLoaded) {
                  return buildBody(state);
                } else if (state is ShiftsError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          "Error",
                          style: TextStyle(
                            fontFamily: FontConstants.nunito,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          state.exeption.toString(),
                          style: TextStyle(
                            fontFamily: FontConstants.nunito,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _screenCubit.close();
    super.dispose();
  }

  Widget buildBody(ShiftsLoaded state) {
    return SafeArea(
      child: ShiftGroupList(groups: state.shifts),
    );
  }
}
