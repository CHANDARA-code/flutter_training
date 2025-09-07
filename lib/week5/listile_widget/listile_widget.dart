import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: ListileWidget(),
  ));
}

class ListileWidget extends StatelessWidget {
  const ListileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple ListTile Example'),
        backgroundColor: Colors.blueAccent,
      ),
      // The body of the scaffold contains a ListView
      body: ListView(
        children: <Widget>[
          // A basic ListTile with a title and a subtitle
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('John Doe'),
            subtitle: Text('Software Engineer'),
          ),
          // A divider to separate list items
          const Divider(),
          // Another ListTile with a trailing icon and an onTap callback
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Email'),
            subtitle: const Text('john.doe@example.com'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // This code runs when the tile is tapped
              print('Email tile tapped!');
            },
          ),
          const Divider(),
          // A third ListTile demonstrating different icons and text
          const ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone'),
            subtitle: Text('+1 234 567 890'),
          ),
          const Divider(),
          // A ListTile that is disabled
          const ListTile(
            leading: Icon(Icons.lock),
            title: Text('Account (Disabled)'),
            subtitle: Text('This option is not available'),
            enabled: false,
          ),
        ],
      ),
    );
  }
}
