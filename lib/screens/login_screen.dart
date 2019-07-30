import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shop_app/models/login_model.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 0.7 * mediaQuery.size.width),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                _InputField(),
                SizedBox(
                  height: 60.0,
                ),
                _LoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey)),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                hintText: 'Enter your username',
                hintStyle: TextStyle(color: Colors.black38),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: InputBorder.none),
            style: TextStyle(color: Colors.black),
            onChanged: ((string) {
              Provider.of<LoginModel>(context, listen: false).username = string;
            }),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Divider(
              height: 2,
            ),
          ),
          TextField(
            maxLength: 8,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: 'Enter your password',
              hintStyle: TextStyle(color: Colors.black38),
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: InputBorder.none,
              counterText: '',
            ),
            style: TextStyle(color: Colors.black),
            obscureText: true,
            onChanged: ((string) {
              Provider.of<LoginModel>(context, listen: false).password = string;
            }),
          ),
        ],
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Text(
        'Login',
        style: TextStyle(color: Colors.white, fontSize: 17.0),
      ),
      onPressed: () => _login(context),
    );
  }

  void _login(BuildContext context) {
    final loginModel = Provider.of<LoginModel>(context);
    print('username = ${loginModel.username}, password = ${loginModel.password}');
    Navigator.of(context).pushReplacementNamed('/catalog');
  }
}
