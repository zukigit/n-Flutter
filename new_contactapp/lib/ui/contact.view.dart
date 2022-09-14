import 'package:flutter/material.dart';
import 'package:new_contactapp/ui/contact.view.input.dart';
import 'package:provider/provider.dart';

import '../model/contact.model.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New zuki's contact"),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {
              callAlert(context);
            },
          )
        ],
      ),
      body: showList(context),
    );
  }

  Widget showList(BuildContext context) {
    return ListView.builder(
      itemCount: context.watch<ContactModel>().list.length,
      itemBuilder: (BuildContext context, int index) {
        final dto = context.watch<ContactModel>().list[index];
        return ListTile(
          leading: const Icon(Icons.person),
          title: Text(dto.name),
          subtitle: Text(dto.phno),
        );
      }
    );
  }

  // Widget listTile(BuildContext context, int index) {
  //   final dto = context.watch<ContactModel>().list[index];
  //   return ListTile(
  //     leading: const CircleAvatar(
  //       child: Icon(Icons.person),
  //     ),
  //     title: Text(dto.name),
  //     subtitle: Text(dto.phno),
  //     trailing: Row(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         IconButton(
  //           icon: const Icon(Icons.delete),
  //           onPressed: callAlert(context),
  //         )
  //       ],
  //     ),
  //   );
  // }

  callAlert(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return ContactInput();
      }
    );
  }

  // alertBox(BuildContext context, int index) {
  //   return showDialog<String>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text("Contact Delection"),
  //         content: const Text("Are you sure to delete this?"),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: const Text("Cancel"),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               // context
  //               //     .read<ContactModel>()
  //               //     .delete(index);
  //               Navigator.pop(context);
  //             },
  //             child: const Text("Continue"),
  //           ),
  //         ],
  //       );
  //     }
  //   );
  // }
}