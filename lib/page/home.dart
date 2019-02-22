import 'package:flutter/material.dart';
import 'message.dart';
import 'people.dart';
import 'person.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var text = ['消息','联系人','我'];

  var _pageList = [
    MessagePage(),
    PeoplePage(),
    PersonPage()
  ];

  var _pageIndex = 0;


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the HomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(text[_pageIndex]),
        actions: <Widget>[
          IconButton(
            tooltip: 'search',
            icon: Icon(Icons.search),
            onPressed: () {

            },
          ),
          IconButton(
            tooltip: 'more',
            icon: Icon(Icons.more_vert),
            onPressed: () {

            },
          )
        ],
      ),
      //drawer: Profile(),
      body: _pageList[_pageIndex],
      //floatingActionButton: FloatingActionButton(
      //  onPressed: _incrementCounter,
      //  tooltip: 'Increment',
      //  child: Icon(Icons.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
      /* bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ) */
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text(text[0]),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text(text[1])
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text(text[2])
          ),
        ],
      ),
    );
  }
}






class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return Container(height: 1.0, width: 1.0,);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue
            ),
            accountName: Text('Tom'),
            accountEmail: Text('tom@xxx.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
            ),
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              )
            ],
            onDetailsPressed: () {},
          ),
          ListTile(
            title: Text('Item 1'),
            leading: CircleAvatar(
              child: Icon(Icons.school),
            ),
            onTap: () {

            },
          ),
          ListTile(
            title: Text('Item 1'),
            leading: CircleAvatar(
              child: Text('B2'),
            ),
            onTap: () {

            },
          ),
        ],
      )
    );
  }
}








class ContactsList extends StatelessWidget {
  final List<ContactModal> _contactModal;

  ContactsList(this._contactModal);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      children: _buildContactsList(),
    );
  }

  List<ContactListItem> _buildContactsList() {
    return _contactModal
        .map((contact) => ContactListItem(contact))
        .toList();
  }
}

class ContactListItem extends StatelessWidget {
  final ContactModal _contactModal;

  ContactListItem(this._contactModal);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(child: Text(_contactModal.fullName[0])),
        title: Text(_contactModal.fullName),
        subtitle: Text(_contactModal.email));
  }
}

class ContactModal {
  final String fullName;
  final String email;

  const ContactModal({this.fullName, this.email});
}