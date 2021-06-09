import 'package:flutter/material.dart';
import 'package:loja/src/core/colors.dart';

// ignore: must_be_immutable
class CustomEditTextfield extends StatefulWidget {
  TextEditingController text;
  TextEditingController newtext;
  bool read;
  final Icon icon;
  final String hint;

  bool obscure;
  bool password;
  TextInputType type;
  bool loginFailed;
  TextEditingController newText = TextEditingController();

  TextEditingController textCopy = TextEditingController();

  CustomEditTextfield({
    Key key,
    this.text,
    this.icon,
    this.hint,
    this.obscure,
    this.password = false,
    this.type = TextInputType.text,
    this.loginFailed = false,
    this.read = false,
    this.newtext,
  }) : super(key: key);

  @override
  _CustomEditTextfieldState createState() => _CustomEditTextfieldState();
}

class _CustomEditTextfieldState extends State<CustomEditTextfield> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    String teste = widget.text.text;
    widget.textCopy.text =
        widget.newtext.text.isEmpty ? teste : widget.newtext.text;

    return Container(
      child: Center(
        child: TextFormField(
          readOnly: widget.read == true ? value : false,
          cursorColor: widget.loginFailed == true ? CustomColors.red : null,
          keyboardType: widget.type,
          obscureText: widget.obscure == null ? false : widget.obscure,
          decoration: InputDecoration(
            labelStyle: TextStyle(
                color: widget.loginFailed == true ? CustomColors.red : null),
            labelText: widget.hint,
            contentPadding: EdgeInsets.only(bottom: 10),
            icon: widget.icon,
            suffixIcon: IconButton(
              icon: value == true
                  ? Icon(Icons.edit)
                  : Icon(
                      Icons.check_circle_rounded,
                      color: CustomColors.green,
                    ),
              onPressed: () {
                setState(() {
                  widget.textCopy.clear();
                  widget.textCopy.text = widget.newtext.text.toString();
                  value = !value;
                });
              },
            ),
          ),
          controller: value ? widget.textCopy : widget.newtext,
        ),
      ),
    );
  }
}
