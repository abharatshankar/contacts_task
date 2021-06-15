part of 'contacts_bloc.dart';

abstract class ContactsEvent extends Equatable {
  const ContactsEvent();
}

class FetchContactsEvent extends ContactsEvent {
  @override
  List<Object> get props => [];

}

class SearchContactEvent extends ContactsEvent {
  final String searchTerm;

  SearchContactEvent({this.searchTerm});

  @override
  List<Object> get props => [searchTerm];
}
