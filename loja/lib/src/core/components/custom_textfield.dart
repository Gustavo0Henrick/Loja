import 'package:flutter/material.dart';
import 'package:loja/src/core/colors.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatefulWidget {
  TextEditingController text;
  bool read;
  final Icon icon;
  final String hint;
  Function validator;
  bool obscure;
  bool password;
  TextInputType type;
  bool loginFailed;

  CustomTextfield({
    Key key,
    this.text,
    this.icon,
    this.hint,
    this.obscure = false,
    this.password = false,
    this.type = TextInputType.text,
    this.loginFailed = false,
    this.read = false,
    this.validator,
  }) : super(key: key);

  @override
  _CustomTextfieldState createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextFormField(
          validator: widget.validator,
          readOnly: widget.read,
          cursorColor: widget.loginFailed == true ? CustomColors.red : null,
          keyboardType: widget.type,
          obscureText: widget.obscure == null ? false : widget.obscure,
          decoration: InputDecoration(
              labelStyle: TextStyle(
                  color: widget.loginFailed == true ? CustomColors.red : null),
              labelText: widget.hint,
              contentPadding: EdgeInsets.only(bottom: 10),
              icon: widget.icon,
              suffixIcon: widget.password
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          widget.obscure = !widget.obscure;
                        });
                      },
                      icon: widget.obscure
                          ? Icon(Icons.visibility_off,
                              color: widget.loginFailed == true
                                  ? CustomColors.red
                                  : null)
                          : Icon(Icons.visibility,
                              color: widget.loginFailed == true
                                  ? CustomColors.red
                                  : null),
                    )
                  : null),
          controller: widget.text,
        ),
      ),
    );
  }
}
