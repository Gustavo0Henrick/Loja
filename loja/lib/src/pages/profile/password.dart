import 'package:flutter/material.dart';
import 'package:loja/src/core/colors.dart';
import 'package:loja/src/core/components/custom_textfield.dart';

import 'package:loja/src/pages/profile/editprofile.dart';


// ignore: must_be_immutable
class Password extends StatelessWidget {
  final int id;

  TextEditingController newpassword = TextEditingController();
  TextEditingController passsword = TextEditingController();
  TextEditingController confirmedpassowrd = TextEditingController();
  bool obscure = true;
  bool obscure2 = true;

  Password({Key key, this.id}) : super(key: key);
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
                  height: MediaQuery.of(context).size.height * 0.65,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 40),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: CustomTextfield(
                              hint: "Senha Atual",
                              icon: Icon(Icons.vpn_key),
                              type: TextInputType.emailAddress,
                              text: passsword,
                              password: true,
                              obscure: obscure,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Divider(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: CustomTextfield(
                              hint: "Nova Senha",
                              icon: Icon(Icons.vpn_key_outlined),
                              type: TextInputType.text,
                              text: newpassword,
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
                              hint: "Confirme a Senha",
                              icon: Icon(Icons.vpn_key_outlined),
                              type: TextInputType.text,
                              text: confirmedpassowrd,
                              password: true,
                              obscure: obscure2,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Container(
                            width: 150,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: CustomColors.yellow,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              child: Text("Salvar"),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Container(
                            width: 150,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: CustomColors.lightred,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              child: Text(
                                "Cancelar",
                                style: TextStyle(color: CustomColors.white),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                            EditProfile(id: id)));
                              },
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
      ),
    );
  }
}
