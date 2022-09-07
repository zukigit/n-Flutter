import 'package:contactapp/model/contact.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactInput extends StatefulWidget {

  final bool isEdit;
  final int index;
  const ContactInput({Key? key, required this.isEdit, required this.index}) : super(key: key);
  @override
  State<ContactInput> createState() => _ContactInputState();
}

class _ContactInputState extends State<ContactInput> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phNO = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          form(context, _name, _formKey, true),          
          form(context, _phNO, _formKey, false),
          const SizedBox(height: 20,),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                widget.isEdit? edit() : add();
                Navigator.pop(context);
              },
              child: widget.isEdit? const Text("Edit Contact") : const Text("Add Contact"),
            )
          )
        ],
      ),
    );
  }

  Widget form(BuildContext context, TextEditingController controller, Key key, bool isName) {
    return TextFormField(
      controller: widget.isEdit ? (controller..text = editFill(isName)) : controller,
      keyboardType: isName ? TextInputType.name : TextInputType.phone,
      decoration: InputDecoration(
        icon: isName ? const Icon(Icons.person) : const Icon(Icons.phone),
        label: isName? const Text("Name") : const Text("Phone"),
      ),
      validator: (value) => _valid(value),
    );
  }

  add() {
    if(_formKey.currentState!.validate()){
      context
          .read<ContactModel>()
          .addData(_name.text, _phNO.text);
    }
  }

  String editFill(bool isName) {
    final dto = context.watch<ContactModel>().list[widget.index];
    if(isName) {
      return dto.name;
    }
    return dto.phno;
  }

  edit() {
    context
      .read<ContactModel>()
      .edit(widget.index, _name.text, _phNO.text);
  }

  String? _valid(String? value) {
    if(value == null || value.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }
}