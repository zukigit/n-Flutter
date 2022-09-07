import 'package:contact/ui/contact.input.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = ["zuki", "misaki", "bobo"];
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text("${index + 1}"),
                  ),
                  title: Text(list[index]),
                ),
              );
            },
          ),
        ),
        ContactInput()
      ],
    );
  }
}
