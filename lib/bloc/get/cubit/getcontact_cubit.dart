import 'package:bloc/bloc.dart';
import 'package:bloc_rest_api/data/contact_repository.dart';
import 'package:bloc_rest_api/data/model/contact.dart';
import 'package:equatable/equatable.dart';

part 'getcontact_state.dart';

class GetcontactCubit extends Cubit<GetContactState> {
  final ContactRepository _contactRepository;
  GetcontactCubit(this._contactRepository) : super(GetContactInitial()){
    getContact();
  }

  void getContact(){
    emit(GetContactInitial());
    _contactRepository.getContact()
    .then((value) => emit(GetContactSuccess(value)))
    .catchError((e) => emit(GetContactFail('Error')));

  }
  void delete(String id){
    emit(GetContactInitial());
    _contactRepository.deleteContact(id)
    .then((value) => getContact())
    .catchError((e) => emit(GetContactFail('Connot Delete')));
  }
}
