import 'package:flutter/material.dart';
import 'chat.dart';

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

  var _barList = [
    AppBar(
      title: Text('消息'),
      actions: <Widget>[
        IconButton(
          tooltip: 'more',
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        )
      ],
    ),
    AppBar(
      title: Text('联系人'),
      actions: <Widget>[
        IconButton(
          tooltip: 'search',
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          tooltip: 'more',
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        )
      ],
    ),
    AppBar(
      title: Text('我'),
    ),
  ];

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
      appBar: _barList[_pageIndex],
      //drawer: Profile(),
      body: _pageList[_pageIndex],
      //floatingActionButton: FloatingActionButton(
      //  onPressed: _incrementCounter,
      //  tooltip: 'Increment',
      //  child: Icon(Icons.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
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
            title: Text('消息'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('联系人')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('我')
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

class MessagePage extends StatelessWidget {
  _buildContactList() {
    return <ContactModal>[
      const ContactModal(
          fullName: 'Romain Hoogmoed', email: 'romain.hoogmoed@example.com'),
      const ContactModal(
          fullName: 'Emilie Olsen', email: 'emilie.olsen@example.com'),
      const ContactModal(
          fullName: 'Nishant Srivastava', email: 'nishant.srivastava@example.com'),
      const ContactModal(
          fullName: 'Romain Hoogmoed', email: 'romain.hoogmoed@example.com'),
      const ContactModal(
          fullName: 'Emilie Olsen', email: 'emilie.olsen@example.com'),
      const ContactModal(
          fullName: 'Nishant Srivastava', email: 'nishant.srivastava@example.com'),
      const ContactModal(
          fullName: 'Romain Hoogmoed', email: 'romain.hoogmoed@example.com'),
      const ContactModal(
          fullName: 'Emilie Olsen', email: 'emilie.olsen@example.com'),
      const ContactModal(
          fullName: 'Nishant Srivastava', email: 'nishant.srivastava@example.com'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContactsList(_buildContactList()),
      
    );
  }
}

class PeoplePage extends StatelessWidget {
  _buildContactList() {
    return <ContactModal>[
      const ContactModal(
          fullName: '联系人', email: 'romain.hoogmoed@example.com'),
      const ContactModal(
          fullName: 'Emilie Olsen', email: 'emilie.olsen@example.com'),
      const ContactModal(
          fullName: 'Nishant Srivastava', email: 'nishant.srivastava@example.com'),
      const ContactModal(
          fullName: 'Romain Hoogmoed', email: 'romain.hoogmoed@example.com'),
      const ContactModal(
          fullName: 'Emilie Olsen', email: 'emilie.olsen@example.com'),
      const ContactModal(
          fullName: 'Nishant Srivastava', email: 'nishant.srivastava@example.com'),
      const ContactModal(
          fullName: 'Romain Hoogmoed', email: 'romain.hoogmoed@example.com'),
      const ContactModal(
          fullName: 'Emilie Olsen', email: 'emilie.olsen@example.com'),
      const ContactModal(
          fullName: 'Nishant Srivastava', email: 'nishant.srivastava@example.com'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ContactsList(_buildContactList()));
  }
}

class PersonPage extends StatelessWidget {
  _buildContactList() {
    return <ContactModal>[
      const ContactModal(
          fullName: '我自己', email: 'romain.hoogmoed@example.com'),
      const ContactModal(
          fullName: 'Emilie Olsen', email: 'emilie.olsen@example.com'),
      const ContactModal(
          fullName: 'Nishant Srivastava', email: 'nishant.srivastava@example.com'),
      const ContactModal(
          fullName: 'Romain Hoogmoed', email: 'romain.hoogmoed@example.com'),
      const ContactModal(
          fullName: 'Emilie Olsen', email: 'emilie.olsen@example.com'),
      const ContactModal(
          fullName: 'Nishant Srivastava', email: 'nishant.srivastava@example.com'),
      const ContactModal(
          fullName: 'Romain Hoogmoed', email: 'romain.hoogmoed@example.com'),
      const ContactModal(
          fullName: 'Emilie Olsen', email: 'emilie.olsen@example.com'),
      const ContactModal(
          fullName: 'Nishant Srivastava', email: 'nishant.srivastava@example.com'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ContactsList(_buildContactList()));
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
        subtitle: Text(_contactModal.email),
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => ChatPage()
            )
          );
        },
      );
  }
}

class ContactModal {
  final String fullName;
  final String email;

  const ContactModal({this.fullName, this.email});
}