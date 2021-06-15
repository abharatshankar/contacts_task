import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:contacts_task/contacts/repository/contacts_repository.dart';
import 'package:equatable/equatable.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc() : super(ContactsState.initial());

  @override
  Stream<ContactsState> mapEventToState(
    ContactsEvent event,
  ) async* {
    if (event is FetchContactsEvent) {
      print('Inside Fetch Contacts Event');
      List<String> contacts = await ContactsRepository().getContacts();
      /*Future.delayed(Duration(milliseconds: 2000)).then((value) async* {
        yield state.copyWith(currentView: CONTACTSVIEW.LOADED, contacts: contacts);
      });*/
      yield state.copyWith(currentView: CONTACTSVIEW.LOADED, contacts: contacts);
    }

    if (event is SearchContactEvent) {
      print('State contacts: ${state.contacts.length}');
      print('Search Term: ${state.searchTerm}');

      List<String> searchResult = [];

      if (event.searchTerm != null && event.searchTerm.isNotEmpty) {
        state.contacts.forEach((contact) {
          if (contact.toLowerCase().contains(event.searchTerm.toLowerCase())) {
            searchResult.add(contact);
          }
        });
      }

      yield state.copyWith(
        currentView: CONTACTSVIEW.LOADED,
        searchTerm: event.searchTerm,
        searchResult: searchResult,
      );
    }
  }
}
