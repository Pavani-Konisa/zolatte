import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final bool isLoading;
  final void Function(
      String email, String password, bool isLogin, BuildContext ctx) submitFn;
  AuthForm(this.submitFn, this.isLoading);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;
  var _isLogin = true;
  var _userEmail = "";
  var _userPassword = "";
  var _userName = "";
  var _dhno = "";
  void _trySubmit() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      widget.submitFn(_userEmail.trim(), _userPassword.trim(), _isLogin,
          context); // user those values to send our auth request
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100, 
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                "Zolatte",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 136, 34),
                    fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                _isLogin ? "LOGIN" : "REGISTER",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA),
                    fontSize: 34),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                key: ValueKey('email'),
                decoration: InputDecoration(labelText: "Email ID"),
                textInputAction: TextInputAction.next,
                // onFieldSubmitted: (_) {
                //   FocusScope.of(context).requestFocus(_passwordFocusNode);
                // },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Username is requird';
                  }
                  return null;
                },
                onSaved: (value) {
                  _userEmail = value!;
                },
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                key: ValueKey('password'),
                decoration: InputDecoration(labelText: "Password"),
                // focusNode: _passwordFocusNode,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password is requird';
                  }
                  if (value.length < 8) {
                    return 'Should be at least 8 characters';
                  }
                  return null;
                },
                onSaved: (value) {
                  _userPassword = value!;
                },
                obscureText: true,
              ),
            ),
            if (!_isLogin) SizedBox(height: size.height * 0.03),
            if (!_isLogin)
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  key: ValueKey('username'),
                  decoration: InputDecoration(labelText: "User Name"),
                  textInputAction: TextInputAction.next,
                  // onFieldSubmitted: (_) {
                  //   FocusScope.of(context).requestFocus(_passwordFocusNode);
                  // },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Username is requird';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _userName = value!;
                  },
                ),
              ),
            // if (!_isLogin) SizedBox(height: size.height * 0.03),
            // if (!_isLogin)
            //   Container(
            //     alignment: Alignment.center,
            //     margin: const EdgeInsets.symmetric(horizontal: 40),
            //     child: TextFormField(
            //       key: ValueKey('dhno'),
            //       decoration: InputDecoration(labelText: "DH Number"),
            //       textInputAction: TextInputAction.next,

            //       validator: (value) {
            //         if (value!.isEmpty) {
            //           return 'Username is requird';
            //         }
            //         return null;
            //       },
            //       onSaved: (value) {
            //         _dhno = value!;
            //       },
            //     ),
            //   ),
            if (_isLogin)
              Container(
                alignment: Alignment.centerRight,
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: const Text(
                  "Forgot your password?",
                  style: TextStyle(fontSize: 12, color: Color(0XFF2661FA)),
                ),
              ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: RaisedButton(
                onPressed: () {
                  _trySubmit();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80.0),
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 255, 136, 34),
                        Color.fromRGBO(255, 177, 41, 1)
                      ])),
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    _isLogin ? "LOGIN" : "REGISTER",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isLogin = !_isLogin;
                  });
                },
                child: Text(
                  _isLogin
                      ? "Don't Have an Account? Sign up"
                      : "If Have Already An Account? Login",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
