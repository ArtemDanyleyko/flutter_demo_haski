import 'package:haski/dialog/dialog_service.dart';
import 'package:haski/dialog/dialog_service_impl.dart';
import 'package:haski/managers/authorization/authorization_manager.dart';
import 'package:haski/managers/messages/messages_manager.dart';
import 'package:haski/managers/messages/messages_manager_impl.dart';
import 'package:haski/managers/news/news_manager.dart';
import 'package:haski/managers/news/news_manager_impl.dart';
import 'package:haski/managers/shifts/shifts_manager_impl.dart';
import 'package:haski/managers/shifts/shifts_manager.dart';
import 'package:haski/managers/authorization/authorization_manager_impl.dart';
import 'package:haski/repositories/shifts/shifts_repository.dart';
import 'package:haski/repositories/shifts/shifts_repository_impl.dart';
import 'package:injector/injector.dart';

class CompositionRoot {
  static final injector = Injector.appInstance;

  static void initialize() {
    registerServices();
    registerManagers();
    registerProviders();
    registerRepositories();
  }

  static void registerServices() {
    injector.registerDependency<DialogService>(() => DialogServiceImpl());
  }

  static void registerManagers() {
    injector.registerDependency<AuthorizationManager>(
        () => AuthorizationManagerImpl());
    injector.registerDependency<ShiftsManager>(() => ShiftsManagerImpl());
    injector.registerDependency<NewsManager>(() => NewsManagerImpl());
    injector.registerDependency<MessagesManager>(() => MessagesManagerImpl());
  }

  static void registerProviders() {}

  static void registerRepositories() {
    injector.registerDependency<ShiftRepository>(() => ShiftRepositoryImpl());
  }
}
