import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange,
        title: Text('Faq Page'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search,color: Colors.white,), onPressed: null)
        ]
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('Rohit D'),
              accountEmail: Text('rohit@devrushi.com'),
              currentAccountPicture: GestureDetector(
                child:new CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person,color: Colors.white,),
                ),
              ),
              decoration: new BoxDecoration(
                color: Colors.orange,
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text("FAQ's"),
                leading: Icon(Icons.home,color: Colors.blue,),
              ),
            ),

          ],
        ),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
        EntryItem(data[index]),
        itemCount: data.length,
    ),
    );
  }
}


// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'What is this app',
    <Entry>[
      Entry('It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed '),
    ],
  ),
  Entry(
    'Why do we use it?',
    <Entry>[
      Entry('It is a long established fact that a reader will be distracted by the readable content of a page when looking'),
    ],
  ),
  Entry(
    'Why do we use it?',
    <Entry>[
      Entry('It is a long established fact that a reader will be distracted by the readable content of a page when looking'),
    ],
  ),
  Entry(
    'Why do we use it?',
    <Entry>[
      Entry('It is a long established fact that a reader will be distracted by the readable content of a page when looking'),
    ],
  ),
  Entry(
    'Why do we use it?',
    <Entry>[
      Entry('It is a long established fact that a reader will be distracted by the readable content of a page when looking'),
    ],
  ),
  Entry(
    'Why do we use it?',
    <Entry>[
      Entry('It is a long established fact that a reader will be distracted by the readable content of a page when looking'),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

