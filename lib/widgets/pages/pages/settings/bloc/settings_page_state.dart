import 'package:equatable/equatable.dart';
import 'package:haski/models/users/user.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();
}

class SettingsInitial extends SettingsState {
  @override
  List<Object?> get props => [];
}

class SettingsLoading extends SettingsState {
  @override
  List<Object?> get props => [];
}

class SettingsLoaded extends SettingsState {
  const SettingsLoaded(this.user);

  final User user;

  @override
  List<Object?> get props => [user];
}

class UserLogout extends SettingsState {
  const UserLogout(this.isLogout);

  final bool isLogout;

  @override
  List<Object?> get props => [];
}

class SettingsError extends SettingsState {
  final Object? exeption;
  const SettingsError(this.exeption);

  @override
  List<Object?> get props => [exeption];
}
