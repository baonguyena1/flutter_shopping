class LoginModel {
  LoginModel() {
    this._username = '';
    this._password = '';
  }

  String _username;
  String _password;

  String get username => _username;
  set username(user) => _username = user;

  String get password => _password;
  set password(pass) => _password = pass;
}