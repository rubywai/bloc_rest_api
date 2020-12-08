import 'package:bloc_rest_api/bloc/get/cubit/getcontact_cubit.dart';
import 'package:bloc_rest_api/data/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'add_screen.dart';
import 'edit_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var result = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => AddScreen()));
          if (result != null && result == 'success') {
            BlocProvider.of<GetcontactCubit>(context).getContact();
          }
        },
      ),
      body: BlocBuilder<GetcontactCubit, GetContactState>(
        builder: (context, state) {
          if (state is GetContactSuccess) {
            List<Contact> contacts = state.contacts;
            return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, position) {
                  return item(contacts[position],context);
                });
          }
          else if(state is GetContactFail){
            return Center(child: Text('${state.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget item(Contact contact,BuildContext context) {
    return Card(
      child: Slidable(
              actionPane: SlidableDrawerActionPane(),
              actions: [
                IconSlideAction(
                  icon: Icons.edit,
                  color: Colors.blue,
                  onTap: () async{
                  var result =  await  Navigator.push(context,
                     MaterialPageRoute(builder: (_)=> EditScreen(contact)));
                     if (result != null && result == 'success') {
            BlocProvider.of<GetcontactCubit>(context).getContact();
          }
                  },
                )
              ],
              secondaryActions: [
                IconSlideAction(
                  icon: Icons.delete,
                  color: Colors.red,
                  onTap: (){
                    context.bloc<GetcontactCubit>().delete(contact.id);
                  },
                )
              ],
              child: ListTile(
            title: Text(contact.name),
            subtitle: Text(contact.job),
            trailing: Text('age ${contact.age}'),
          ),
      ),
    );
  }
}
