import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iloilocityapp/app/global/constants/app_strings.dart';
import 'package:iloilocityapp/app/global/navigation/app_navigation.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';

class SettingsController extends GetxController {
  final AppNavigation _navigation;

  SettingsController(this._navigation);

  Future<dynamic> signOutClick() async {
    await _navigation.logoutUser();
  }

  void navigateToPage(String route) {
    switch (route) {
      case editprofile:
        _navigation.showSnackBar(AppStrings.notYetImplemented, error: true);
        // _navigation.navigateToNamed(editprofile);
        break;
      case updatepassword:
        _navigation.showSnackBar(AppStrings.notYetImplemented, error: true);
        // _navigation.navigateToNamed(updatepassword);
        break;
      case privacypolicy:
        _navigation.navigateToNamed(privacypolicy);
        break;
      case termsconditon:
        _navigation.navigateToNamed(termsconditon);
        break;
      default:
        _navigation.showSnackBar('Page not found!');
    }
  }
}
