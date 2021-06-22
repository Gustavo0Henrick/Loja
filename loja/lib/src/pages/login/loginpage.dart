import 'package:flutter/material.dart';
import 'package:loja/src/core/colors.dart';
import 'package:loja/src/core/components/custom_textfield.dart';
import 'package:loja/src/core/routes.dart';
import 'package:loja/src/core/users.dart';
import 'package:loja/features/homepage/homepage.dart';
import 'package:loja/src/pages/login/login_service.dart';

import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  bool switchValue;
  bool obscureText = true;
  bool loginFailed = false;
  bool notFound = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool errorLogin = false;

  Future<void> loginError(email, password) async {
    setState(() {
      widget.email.text = email;
      widget.password.text = password;
      widget.loginFailed = true;
    });
  }

  Future<void> _getSP() async {
    var sp = await SharedPreferences.getInstance();
    widget.email.text = sp.get("email") ?? "";
    // widget.password.text = sp.get("password") ?? "";
    widget.switchValue = sp.getBool("switchValue");
  }

  Future<void> _setSP() async {
    var spref = await SharedPreferences.getInstance();
    spref.setString("email", widget.email.text);
    // spref.setString("password", widget.password.text);
    spref.setString("password", widget.password.text);
    spref.setBool("switchValue", widget.switchValue);
  }

  save() async {
    SharedPreferences switchControl = await SharedPreferences.getInstance();
    switchControl.setBool('switchValue', widget.switchValue);
    SharedPreferences email = await SharedPreferences.getInstance();
    email.setString('email', widget.email.text);
    SharedPreferences password = await SharedPreferences.getInstance();
    password.setString('password', "");
  }

  Future<void> _clearSP() async {
    var spref = await SharedPreferences.getInstance();
    spref.setString("email", "");
    spref.setString("password", "");
    spref.setBool("switchValue", false);
  }

  @override
  void initState() {
    _getSP();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getSP(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          CustomColors.yellow,
                          CustomColors.orangeMain,
                        ]),
                  ),
                  child: SafeArea(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 350,
                            height: 400,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 5,
                              child: Center(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 50, bottom: 20),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 60,
                                        child: CustomTextfield(
                                          type: TextInputType.emailAddress,
                                          text: widget.email,
                                          icon: Icon(Icons.person),
                                          // icon: Icon(Icons.person,
                                          //     color: widget.loginFailed == true
                                          //         ? CustomColors.red
                                          //         : null),
                                          hint: "Email",
                                          // obscure: false,
                                          validator: (value) {
                                            if (value.length < 5 ||
                                                value == '' ||
                                                !value.contains("@")) {
                                              errorLogin = true;
                                              return "Email Invalido";
                                            }
                                            return null;
                                          },
                                          loginFailed: widget.loginFailed,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 60,
                                        child: CustomTextfield(
                                          text: widget.password,
                                          icon: Icon(Icons.vpn_key),
                                          // icon: Icon(Icons.vpn_key,
                                          //     color: widget.loginFailed == true
                                          //         ? CustomColors.red
                                          //         : null),
                                          hint: "Senha",
                                          obscure: widget.obscureText,
                                          password: true,
                                          loginFailed: widget.loginFailed,
                                          validator: (value) {
                                            if (value.length < 4 ||
                                                value == '') {
                                              errorLogin = true;
                                              return "Senha invalida";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("Lembrar usuario?"),
                                            Switch(
                                              value:
                                                  widget.switchValue ?? false,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _setSP();
                                                  widget.switchValue = value;
                                                });
                                              },
                                              activeTrackColor:
                                                  CustomColors.orangeMain,
                                              inactiveThumbColor:
                                                  CustomColors.lightOrange,
                                            ),
                                          ]),
                                    ),
                                    Container(
                                      width: 150,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: CustomColors.yellow,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          elevation: 0,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _doLogin();
                                          });
                                          if (widget.switchValue == true) {
                                            save();
                                            _setSP();
                                          } else {
                                            _clearSP();
                                          }
                                        },
                                        child: Text("Entrar"),
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: CustomColors.orangeMain,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          elevation: 0,
                                        ),
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (builder) =>
                                                    CustomRoutes.registerpage,
                                              ));
                                        },
                                        child: Text(
                                          "Cadastrar",
                                          style: TextStyle(
                                              color: CustomColors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return Container();
        });
  }

  void _doLogin() async {
    if (_formKey.currentState.validate()) {
      LoginService().login(widget.email.text, widget.password.text);
    } else {
      widget.email.text = '';
      widget.password.text = '';
      print("Invalido");
      errorLogin = true;
    }
  }
}
