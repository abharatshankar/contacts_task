part of 'contacts_bloc.dart';

enum CONTACTSVIEW { LOADING, LOADED, ERROR, EMPTY, SEARCH }

class ContactsState extends Equatable {
  const ContactsState({
    this.contacts,
    this.currentView,
    this.searchResult,
    this.searchTerm,
  });

  final List<String> contacts;
  final CONTACTSVIEW currentView;
  final List<String> searchResult;
  final String searchTerm;

  factory ContactsState.initial() {
    return ContactsState(
      currentView: CONTACTSVIEW.LOADING,
      contacts: [],
      searchTerm: '',
      searchResult: [],
    );
  }

  ContactsState copyWith({
    List<String> contacts,
    CONTACTSVIEW currentView,
    List<String> searchResult,
    String searchTerm,
  }) {
    return ContactsState(
      currentView: currentView ?? this.currentView,
      contacts: contacts ?? this.contacts,
      searchResult: searchResult ?? this.searchResult,
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  @override
  List<Object> get props => [
        contacts,
        currentView,
        searchTerm,
        searchResult,
      ];
}
