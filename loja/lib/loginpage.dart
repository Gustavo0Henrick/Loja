import 'package:flutter/material.dart';
import 'package:loja/core/colors.dart';
import 'package:loja/core/components/custom_textfield.dart';
import 'package:loja/core/routes.dart';
import 'package:loja/homepage.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  bool switchValue = false;
  bool obscureText = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                          padding: const EdgeInsets.only(top: 50, bottom: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 40,
                            child: CustomTextfield(
                              text: widget.email,
                              icon: Icon(Icons.person),
                              hint: "Email",
                              obscure: false,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              // border: Border.all(color: CustomColors.black),
                              borderRadius: BorderRadius.circular(20)),
                          width: MediaQuery.of(context).size.width * 0.7,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Lembrar senha?"),
                              Switch(
                                value: widget.switchValue,
                                onChanged: (value) {
                                  setState(() {
                                    widget.switchValue = value;
                                  });
                                },
                                activeTrackColor: CustomColors.orangeMain,
                                inactiveThumbColor: CustomColors.lightOrange,
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
                                    borderRadius: BorderRadius.circular(20)),
                                elevation: 0,
                              ),
                              onPressed: () {
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
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 0,
                            ),
                            onPressed: () {},
                            child: Text(
                              "Cadastrar",
                              style: TextStyle(color: CustomColors.white),
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
    );
  }
}
