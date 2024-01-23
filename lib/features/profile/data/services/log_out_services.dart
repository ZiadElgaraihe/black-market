part of 'package:black_market/features/profile/data/repos/log_out_repo.dart';

class LogOutServices implements LogOutRepo {
  LogOutServices({
    required LocalDatabaseServices localDatabaseServices,
    required SecureDatabaseServices secureDatabaseServices,
  }) {
    _localDatabaseServices = localDatabaseServices;
    _secureDatabaseServices = secureDatabaseServices;
  }

  late LocalDatabaseServices _localDatabaseServices;
  late SecureDatabaseServices _secureDatabaseServices;
  
  @override
  Future<void> logOut() async {
    await Future.wait(
      [
        _localDatabaseServices.delete(
          boxName: kUserBox,
          key: kUserKey,
        ),
        _secureDatabaseServices.deleteFromSecureStorage(
          key: kTokenKey,
        ),
      ],
    );
  }
}
