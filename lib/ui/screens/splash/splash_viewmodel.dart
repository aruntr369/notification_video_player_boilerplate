import 'dart:async';

import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  Timer? _timer;
  // final _apiService = locator<ApiService>();
  // final _notificationService = locator<NotificationService>();

  void startTimer() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();

    // var hasUser = false;
    // hasUser = prefs.containsKey(Prefs.isLoggedIn);
    // if (hasUser) hasUser = prefs.getBool(Prefs.isLoggedIn) ?? false;

    // await _apiService.loadCredential();
    // AppUser? user = _apiService.user;
    // if (user?.id == null || user?.accessToken == null) hasUser = false;

    _timer = Timer(const Duration(seconds: 1), () async {
      // if (hasUser) {
      //   //Navigate to login
      // } else {
      //   // Navigate to home
      // }
    });

    // _notificationService.registerPushNotificationHandler();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
