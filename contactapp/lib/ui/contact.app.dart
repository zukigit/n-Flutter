import 'package:contactapp/model/callwidget.dart';
import 'package:contactapp/ui/contact.view.dart';
import 'package:flutter/material.dart';

class ContactApp extends StatelessWidget {
  const ContactApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zuki's contact"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              CallWidget.inputBox(context);
            },
            icon: const Icon(Icons.person_add),
          )
        ],
      ),
      body: const ContactView(),
    );
  }
}