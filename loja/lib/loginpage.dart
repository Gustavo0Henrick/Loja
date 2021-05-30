import 'package:flutter/material.dart';
import 'package:loja/core/colors.dart';
import 'package:loja/core/components/custom_textfield.dart';
import 'package:loja/core/routes.dart';

import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  bool switchValue;
  bool obscureText = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> _getSP() async {
    var sp = await SharedPreferences.getInstance();
    widget.email.text = sp.get("email") ?? "";
    widget.password.text = sp.get("password") ?? "";
    widget.switchValue = sp.getBool("switchValue");
  }

  Future<void> _setSP() async {
    var spref = await SharedPreferences.getInstance();
    spref.setString("email", widget.email.text);
    spref.setString("password", widget.password.text);
    spref.setBool("switchValue", widget.switchValue);
  }

  save() async {
    SharedPreferences switchControl = await SharedPreferences.getInstance();
    switchControl.setBool('switchValue', widget.switchValue);
    SharedPreferences email = await SharedPreferences.getInstance();
    email.setString('email', widget.email.text);
    SharedPreferences password = await SharedPreferences.getInstance();
    password.setString('password', widget.password.text);
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 350,
                          height: 350,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height: 40,
                                      child: CustomTextfield(
                                        type: TextInputType.emailAddress,
                                        text: widget.email,
                                        icon: Icon(Icons.person),
                                        hint: "Email",
                                        obscure: false,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    height: 40,
                                    child: CustomTextfield(
                                      text: widget.password,
                                      icon: Icon(Icons.vpn_key),
                                      hint: "Senha",
                                      obscure: widget.obscureText,
                                      password: true,
                                    ),
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Lembrar senha?"),
                                        Switch(
                                          value: widget.switchValue ?? false,
                                          onChanged: (bool value) async {
                                            save();
                                            setState(() {
                                              widget.switchValue =
                                                  !widget.switchValue;
                                            });
                                          },
                                          activeTrackColor:
                                              CustomColors.orangeMain,
                                          inactiveThumbColor:
                                              CustomColors.lightOrange,
                                        ),
                                      ]),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Container(
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
                                          if (widget.switchValue == true) {
                                            _setSP();
                                          } else {
                                            _clearSP();
                                          }
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (builder) =>
                                                    CustomRoutes.homepage,
                                              ));
                                        },
                                        child: Text("Entrar"),
                                      ),
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
            );
          }
          return Container();
        });
  }
}
