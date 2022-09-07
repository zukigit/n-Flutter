import 'package:flutter/material.dart';
import '../ui/contact.input.dart';

class CallWidget {

  static inputBox(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text("Add Contact here!"),
          content: ContactInput(isEdit: false, index: -1)
        );
      },
    );
  }

  static editBox(BuildContext context, int index) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit Contact here!"),
          content: ContactInput(isEdit: true, index: index)
        );
      },
    );
  }
}