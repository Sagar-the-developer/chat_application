import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.white),
          backgroundColor: Color(0xff02689b),
          title: Center(
            child: Text("Settings Screen",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          bottom: TabBar(
            indicatorColor: Color(0xff51d6e8),
            tabs: [
              Tab(
                  icon: Icon(
                Icons.read_more,
                color: Colors.white,
              )),
              Tab(
                  icon: Icon(
                Icons.mark_unread_chat_alt,
                color: Colors.white,
              )),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Text(
              'Welcome to the Settings screen!',
              style: TextStyle(fontSize: 24),
            ),
            Text('Welcome to the Tabbar screen!',
              style: TextStyle(fontSize: 24),),
          ],
        ),
      ),
    );
  }
}
