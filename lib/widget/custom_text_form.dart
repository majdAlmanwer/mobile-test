import 'package:flutter/material.dart';

class CustomTextForm extends StatefulWidget {
  CustomTextForm({
    Key? key,
    required this.controller,
    this.text,
    this.widget,
    this.textInputType,
    this.icon,
  }) : super(key: key);
  TextEditingController controller = TextEditingController();
  String? text;
  Widget? widget;
  TextInputType? textInputType;
  Widget? icon;
  // bool obscure = false;
  // FocusNode focusNode;

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {},
      // obscureText: widget.obscure,
      // focusNode: widget.focusNode,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          fillColor: Colors.grey,
          focusColor: Colors.grey,
          hintText: widget.text,
          hintStyle: TextStyle(
            fontFamily: 'bold',
            fontSize: 18,
          ),
          prefixIcon: widget.widget,
          suffixIcon: widget.icon,
          border: OutlineInputBorder(
              borderSide: const BorderSide(width: 2.0),
              borderRadius: BorderRadius.circular(15))),
    );
  }
}
