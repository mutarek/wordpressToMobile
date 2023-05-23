import 'package:flutter/cupertino.dart';
import 'package:wordpress_mobile/module/splash/splash_repo.dart';

class SplashProvider with ChangeNotifier {
  final SplashRepo splashRepo;

  SplashProvider({required this.splashRepo});
}
