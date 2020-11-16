import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_rest_api/data/contact_repository.dart';
import 'package:bloc_rest_api/data/model/contact.dart';
import 'package:equatable/equatable.dart';

part 'postcontact_state.dart';

class PostcontactCubit extends Cubit<PostcontactState> {
  final ContactRepository _contactRepository;
  PostcontactCubit(this._contactRepository) : super(PostcontactInitial());

  void addContact(Contact contact){
    emit(PostcontactLodinng());
    _contactRepository.addContact(contact)
    .then((value) => emit(PostcontactSuccess()))
    .catchError((e) => emit(PostcontactFail('Error')));
  }
}
