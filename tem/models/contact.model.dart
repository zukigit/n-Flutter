import 'package:flutter/material.dart';
import 'contact.dart';

class ContactModel extends ChangeNotifier {
  final List<Contact> _list = List.empty(growable: true);

  List<Contact> get list {
    return List.of(_list);
  }

  void add(String name, String phNo) {
    _list.add(Contact(name: name, phNo: phNo));
    notifyListeners();
  }
}
