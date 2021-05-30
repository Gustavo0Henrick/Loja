import 'package:flutter/material.dart';
import 'package:loja/core/colors.dart';
import 'package:loja/core/components/custom_edit_textfield.dart';
import 'package:loja/core/components/custom_textfield.dart';
import 'package:loja/core/routes.dart';
import 'package:loja/core/users.dart';
import 'package:loja/screens/homepage.dart';
import 'package:loja/screens/password.dart';

class EditProfile extends StatefulWidget {
  final int id;

  EditProfile({Key key, this.id}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController name = TextEditingController();
  TextEditingController newname = TextEditingController();

  TextEditingController lastname = TextEditingController();
  TextEditingController newlastname = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController newemail = TextEditingController();

  TextEditingController passsword = TextEditingController();
  TextEditingController newpassword = TextEditingController();

  TextEditingController number = TextEditingController();
  TextEditingController newnumber = TextEditingController();

  bool obscure = true;

  bool read1 = true;
  bool read2 = true;
  bool read3 = true;
  bool read4 = true;

  Icon icon = Icon(Icons.edit);

  @override
  Widget build(BuildContext context) {
    name.text = CustomUser.users[widget.id]["firstName"];
    lastname.text = CustomUser.users[widget.id]["lastName"];
    email.text = CustomUser.users[widget.id]["email"];
    number.text = CustomUser.users[widget.id]["number"];
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
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: CustomEditTextfield(
                              hint: "Nome",
                              icon: Icon(Icons.person),
                              type: TextInputType.name,
                              text: name,
                              newtext: newname,
                              read: read1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: CustomEditTextfield(
                              hint: "Sobrenome",
                              icon: Icon(Icons.person),
                              type: TextInputType.name,
                              text: lastname,
                              newtext: newlastname,
                              read: read2,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: CustomEditTextfield(
                              hint: "Email",
                              icon: Icon(Icons.email),
                              type: TextInputType.emailAddress,
                              text: email,
                              newtext: newemail,
                              read: read3,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: CustomEditTextfield(
                              hint: "Número",
                              icon: Icon(Icons.phone),
                              type: TextInputType.number,
                              text: number,
                              newtext: newnumber,
                              read: read4,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                elevation: 0,
                              ),
                              child: Text("Alterar a senha?"),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                            Password(id: widget.id)));
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
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
                              onPressed: () {
                                print(
                                    "${newname.text.isEmpty ? name.text : newname.text} ${newlastname.text.isEmpty ? lastname.text : newlastname.text} ${newemail.text.isEmpty ? email.text : newemail.text} ${newnumber.text.isEmpty ? number.text : newnumber.text}");
                              },
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
                                            HomePage(id: widget.id)));
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
