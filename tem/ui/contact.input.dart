import 'package:flutter/material.dart';

class ContactInput extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _controller1 = new TextEditingController();
  final _controller2 = new TextEditingController();

  ContactInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _controller1,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter name",
            ),
          ),
          TextFormField(
            controller: _controller2,
            decoration: const InputDecoration(hintText: "Enter Phone number"),
          )
        ],
      ),
    );
  }
}
