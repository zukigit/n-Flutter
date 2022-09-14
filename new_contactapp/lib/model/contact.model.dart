import 'package:flutter/material.dart';
import 'contact.dto.dart';

class ContactModel extends ChangeNotifier{

  final List<Contact> _list = List.empty(growable: true);

  List<Contact> get list => List.of(_list);

  add(String name, String phno) {
    _list.add(Contact(name: name, phno: phno));
    notifyListeners();
  }

  delete(int index) {
    _list.removeAt(index);
  }
}