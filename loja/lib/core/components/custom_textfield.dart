import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatefulWidget {
  final TextEditingController text;
  final Icon icon;
  final String hint;
  bool obscure;
  bool password;

  CustomTextfield(
      {Key key,
      this.text,
      this.icon,
      this.hint,
      this.obscure,
      this.password = false})
      : super(key: key);

  @override
  _CustomTextfieldState createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextField(
          obscureText: widget.obscure == null ? false : widget.obscure,
          decoration: InputDecoration(
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
                        ? Icon(
                            Icons.visibility_off,
                          )
                        : Icon(
                            Icons.visibility,
                          ),
                  )
                : Icon(
                    Icons.account_box,
                    color: Colors.white,
                  ),
          ),
          controller: widget.text,
        ),
      ),
    );
  }
}
