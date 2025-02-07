import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haski/dialog/dialog_service.dart';
import 'package:haski/managers/authorization/authorization_manager.dart';
import 'package:haski/managers/profile/profile_manager.dart';
import 'package:haski/widgets/pages/pages/settings/bloc/settings_page_event.dart';
import 'package:haski/widgets/pages/pages/settings/bloc/settings_page_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final ProfileManager profileManager;
  final AuthorizationManager authorizationManager;
  final DialogService dialogService;

  SettingsBloc(
      {required this.profileManager,
      required this.dialogService,
      required this.authorizationManager})
      : super(SettingsInitial()) {
    on<LoadProfile>(_onLoadContent);
    on<Logout>(_onLogout);
  }

  Future<void> _onLoadContent(
      LoadProfile event, Emitter<SettingsState> emit) async {
    emit(SettingsLoading());
    try {
      final user = await profileManager.getCurrentUser();
      emit(SettingsLoaded(user));
    } catch (error) {
      emit(SettingsError(error.toString()));
      dialogService.showToast(error.toString());
    }
  }

  Future<void> _onLogout(Logout event, Emitter<SettingsState> emit) async {
    try {
      var isLogout = await authorizationManager.logout();
      emit(UserLogout(isLogout));
    } catch (error) {
      emit(SettingsError(error.toString()));
      dialogService.showToast(error.toString());
    }
  }
}
