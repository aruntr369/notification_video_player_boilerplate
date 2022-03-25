import 'package:stacked/stacked_annotations.dart';

import '../services/api_service.dart';
import '../ui/screens/home/home_view.dart';
import '../ui/screens/splash/splash_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: HomeView),
  ],
  dependencies: [
    LazySingleton(classType: ApiService),
  ],
)
class AppSetup {}
