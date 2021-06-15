class ContactsRepository {
  Future<List<String>> getContacts() async {
    List contacts = <String>[
      'Marco Franco',
      'Raul Alday',
      'Jessica Alba',
      'Roger Waters',
      'Darth Vader',
      'Homer Simpson',
      'Bill Gates',
      'Elon Musk',
      'Enrique Peña',
      'Angeles Rodriguez',
      'Monica Alvarado',
      'Estrella Fugaz',
      'Juana Lopez',
    ];
    return contacts;
  }
}
