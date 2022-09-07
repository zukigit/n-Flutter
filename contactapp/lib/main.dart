import 'package:contactapp/model/contact.model.dart';
import 'package:contactapp/ui/contact.app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ContactModel(),
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ContactApp()
        );
      },
    )
  );
}