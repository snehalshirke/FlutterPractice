import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  final _myRepo = AuthRepository();
  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then(
      (value) {
        setLoading(false);
        Navigator.pushNamed(context, RoutesName.home);
        if (kDebugMode) {
          Utils.flushbarErrorMessage(value.toString(), context);
          print(value.toString());
        }
      },
    ).onError(
      (error, stackTrace) {
        setLoading(false);
        if (kDebugMode) {
          Utils.flushbarErrorMessage(error.toString(), context);
          print(error.toString());
        }
      },
    );
  }
}
