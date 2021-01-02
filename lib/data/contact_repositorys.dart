


import 'model/contact.dart';

abstract class ContactRepository{
  //view and bloc layer can work with interface
  //and delegate real implementation
  Future<List<Contact>> getContact();

  Future<Contact> addContact(Contact contact);

  Future<Contact> editContact(String id,Contact contact);

  Future<Contact> deleteContact(String id);
}