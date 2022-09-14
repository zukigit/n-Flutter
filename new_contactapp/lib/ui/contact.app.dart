import 'package:flutter/material.dart';
import 'package:new_contactapp/model/contact.model.dart';
import 'package:new_contactapp/ui/contact.view.dart';
import 'package:provider/provider.dart';

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ContactModel(),
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ContactView(),
        );
      },
    );
  }
}