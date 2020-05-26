import 'package:flutter/material.dart';
import 'package:gitoo/Constants.dart';

class Social extends StatefulWidget {
  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimary,
            title: Text('Bhai ka Social Circle '),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Followers',
                ),
                Tab(
                  text: 'Following',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[One(), Two()],
          ),
        ),
      ),
    );
  }
}

class One extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: kSecondary,
      child: Text(
        'Bhai ko koi Follow nahi karta',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class Two extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSecondary,
      alignment: Alignment.center,
      child: Text(
        'Bhai bhi kisi ko Follow nahi karta',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
