import 'package:contacts_task/contacts/bloc/contacts_bloc.dart';
import 'package:contacts_task/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';

class ContactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => ContactsBloc()..add(FetchContactsEvent()),
          child: BlocBuilder<ContactsBloc, ContactsState>(
            builder: (context, state) {
              switch (state.currentView) {
                case CONTACTSVIEW.LOADED:
                  return getLoadedStateWidget(context, state);
                  break;
                case CONTACTSVIEW.LOADING:
                  return Center(child: CircularProgressIndicator());
                  break;
                case CONTACTSVIEW.ERROR:
                  return Center(
                    child: Text('Error state'),
                  );
                  break;
                case CONTACTSVIEW.EMPTY:
                  return Center(
                    child: Text('Empty state'),
                  );
                  break;
                case CONTACTSVIEW.SEARCH:
                  return Center(
                    child: Text('Search state'),
                  );
                  break;
                default:
                  return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }

  Widget getLoadedStateWidget(BuildContext context, ContactsState state) {
    List<String> contacts;
    String searchTerm = state.searchTerm;
    if (searchTerm != null && searchTerm.isNotEmpty) {
      contacts = state.searchResult..sort();
    } else {
      contacts = state.contacts..sort();
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            backgroundColor: Colors.transparent,
            pinned: true,
            title: Text("Contacts"),
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  height: 35,
                  color: Colors.white,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Search Name",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                    autofocus: false,
                    onChanged: (value) {
                      BlocProvider.of<ContactsBloc>(context)
                          .add(SearchContactEvent(searchTerm: value));
                    },
                    //         ))
                    //   ],
                    // ),
                    // floating: true,
                    // backgroundColor: Colors.blue,
                  ),
                ),
                background: FlutterLogo()),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SingleChildScrollView(
                child: Column(
                  children: [
                    footerWidget(context),
                    Container(
                      child: GroupedListView<dynamic, String>(
                        physics: NeverScrollableScrollPhysics(),
                        elements: contacts,
                        shrinkWrap: true,
                        groupBy: (element) => element[0],
                        groupComparator: (value1, value2) =>
                            value2.compareTo(value1),
                        itemComparator: (item1, item2) =>
                            item1.compareTo(item2),
                        order: GroupedListOrder.DESC,
                        useStickyGroupSeparators: true,
                        groupSeparatorBuilder: (String value) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            value,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        itemBuilder: (c, element) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'details',
                                  arguments: element);
                              // print('clicking');
                              // Navigator.of(context).push(
                              //     MaterialPageRoute(builder: (context) => DetailScreen()));
                            },
                            child: Container(
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                leading: Icon(Icons.account_circle),
                                title: Text(element),
                                trailing: Icon(Icons.arrow_forward_ios_sharp),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    footerWidget(context),
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }

  Widget footerWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              child: Icon(Icons.person_rounded, size: 30),
            ),
            SizedBox(
              width: 20,
            ),
            Text("Bharat system task",
                style: TextStyle(
                  color: Color(0xff484848),
                  fontSize: 18,
                ))
          ],
        ),
      ),
    );
  }

  List<Widget> _buildHeaderSliver(
          BuildContext context, bool innerBoxIsScrolled) =>
      <Widget>[
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
      ];
}
