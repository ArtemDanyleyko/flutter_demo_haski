import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class LoadProfile extends SettingsEvent {
  const LoadProfile();

  @override
  List<Object?> get props => [];
}

class Logout extends SettingsEvent {
  const Logout();

  @override
  List<Object?> get props => [];
}
