import 'package:contactapp/model/callwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/contact.model.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      child: ListView.builder(
        itemCount: context.watch<ContactModel>().list.length,
        itemBuilder: getListItem,
      ),
    );
  }

  Widget getListItem(BuildContext context, int index) {
    final dto = context.watch<ContactModel>().list[index];
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: (){
              CallWidget.editBox(context, index);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: (){
              alertBox(context, index);
            },
          )
        ],
      ),
      title: Text(dto.name),
      subtitle: Text(dto.phno),
    );
  }

  Future alertBox(BuildContext context, int index) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Contact Delection"),
          content: const Text("Are you sure to delete this?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                context
                    .read<ContactModel>()
                    .delete(index);
                Navigator.pop(context);
              },
              child: const Text("Continue"),
            ),
          ],
        );
      }
    );
  }
}