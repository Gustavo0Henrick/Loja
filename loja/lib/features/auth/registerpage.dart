import 'package:flutter/material.dart';
import 'package:loja/src/core/colors.dart';
import 'package:loja/src/core/components/custom_textfield.dart';
import 'package:loja/src/core/routes.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController passsword = TextEditingController();
  TextEditingController confirmedpasssword = TextEditingController();
  TextEditingController number = TextEditingController();
  bool obscure = true;
  bool obscure2 = true;

  @override
  Widget build(BuildContext context) {
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
                height: MediaQuery.of(context).size.height * 0.85,
                width: MediaQuery.of(context).size.width * 0.85,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: CustomTextfield(
                            hint: "Nome",
                            icon: Icon(Icons.person),
                            type: TextInputType.name,
                            text: name,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: CustomTextfield(
                            hint: "Sobrenome",
                            icon: Icon(Icons.person),
                            type: TextInputType.name,
                            text: lastname,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: CustomTextfield(
                            hint: "Email",
                            icon: Icon(Icons.email),
                            type: TextInputType.emailAddress,
                            text: email,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: CustomTextfield(
                            hint: "Senha",
                            icon: Icon(Icons.vpn_key),
                            type: TextInputType.text,
                            text: passsword,
                            password: true,
                            obscure: obscure,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: CustomTextfield(
                            hint: "Confirme a Senha",
                            icon: Icon(Icons.vpn_key),
                            type: TextInputType.text,
                            text: confirmedpasssword,
                            password: true,
                            obscure: obscure2,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: CustomTextfield(
                            hint: "Número",
                            icon: Icon(Icons.phone),
                            type: TextInputType.number,
                            text: number,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Container(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) =>
                                        CustomRoutes.loginpage),
                              );
                            },
                            child: Text("Cadastrar"),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              primary: CustomColors.yellow,
                              elevation: 0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => CustomRoutes.loginpage),
                            );
                          },
                          child: Text(
                            "Descartar",
                            style: TextStyle(color: CustomColors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            primary: CustomColors.lightred,
                            elevation: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
