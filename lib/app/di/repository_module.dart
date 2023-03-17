import 'package:iloilocityapp/app/di/main_di.dart';
import 'package:iloilocityapp/app/domain/repository/auth_repository.dart';
import 'package:iloilocityapp/app/domain/repository/jobs_repository.dart';

void initRepositoriesDI() {
  getIt
    ..registerSingleton(AuthRepository(getIt()))
    ..registerSingleton(JobsRepository(getIt()));
}
