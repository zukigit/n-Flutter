import 'package:flutter/material.dart';
import 'package:new_contactapp/model/contact.model.dart';
import '../model/contact.dto.dart';
import 'package:provider/provider.dart';

class ContactInput extends StatelessWidget {
  final Contact? dto;
  ContactInput({super.key, this.dto});

  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phNO = TextEditingController();


  @override
  Widget build(BuildContext context) {
    _name.text = dto?.name ?? '';
    _phNO.text = dto?.phno ?? '';
    return AlertDialog(
      title: dto == null? const Text("Enter Section") : const Text("Edit Section"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            textform(context, _name, key, true),
            textform(context, _phNO, key, false),
            const SizedBox(height: 10,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  dto == null ? add(context) : (){};
                  Navigator.pop(context);
                },
                child: dto == null? const Text("Add") : const Text("Edit"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textform(BuildContext context, TextEditingController controller, key, bool isName) {
    return TextFormField(
      controller: controller,
      keyboardType: isName? TextInputType.name : TextInputType.phone,
      decoration: InputDecoration(
        label: isName? const Text("Name") : const Text("Phone number"),
        icon: isName? const Icon(Icons.person) : const Icon(Icons.phone)
      ),
      validator: (value) => _valid(value),
    );
  }

  String? _valid(String? value) {
    if(value == null || value.isEmpty) {
      return "This filed must not be empty";
    }
    return null;
  }

  add(BuildContext context) {
    if(_formKey.currentState!.validate()) {
      context
        .read<ContactModel>()
        .add(_name.text, _phNO.text);
    }
  }

  edit() {

  }
}