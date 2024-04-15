
import 'package:get_it/get_it.dart';
import 'package:sakeny/Core/Services/ApiServices.dart';
import 'package:sakeny/Data/Repo/HomeRepoImplementation.dart';
class ServicesLocator {
  static final getIt = GetIt.instance;

  static void setupServiceLocator() {
    getIt.registerSingleton<ApiServices>(ApiServices());
    getIt.registerSingleton<HomeRepoImplementation>(HomeRepoImplementation(
      apiServices: getIt.get<ApiServices>(),
    ));
  }
}