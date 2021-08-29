import 'package:poem_app/core/init/navigation/INavigation_service.dart';
import 'package:poem_app/core/init/navigation/navigation_service.dart';

abstract class BaseViewModel{
  INavigationService navigation = NavigationService.instance;
}