import 'package:contacts_task/contacts/presentation/contacts_screen.dart';
import 'package:contacts_task/detail_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'details':
      return MaterialPageRoute(
          builder: (context) => DetailScreen(
                contactName: settings.arguments,
              ));
    default:
      return MaterialPageRoute(builder: (context) => ContactsScreen());
  }
}
