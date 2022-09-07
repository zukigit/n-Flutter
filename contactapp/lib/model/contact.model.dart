import 'contact.dart';
import 'package:flutter/material.dart';

class ContactModel extends ChangeNotifier {

  final List<Contact> _list = List.empty(growable: true);

  List<Contact> get list => List.of(_list);

  void addData(String name, String phno) {
    _list.add(Contact(name: name, phno: phno));
    notifyListeners();
  }

  void addDataAt(String name, String phno, int index) {
    _list.insert(index, Contact(name: name, phno: phno));
    notifyListeners();
  }
  
  void edit(int index, String newName, String newPhno) {
    _list.removeAt(index);
    addDataAt(newName, newPhno, index);
    notifyListeners();
  }

  void delete(int index) {
    _list.removeAt(index);

    notifyListeners();
  }
}