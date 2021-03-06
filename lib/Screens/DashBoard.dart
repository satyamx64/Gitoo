import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:fluttericon/modern_pictograms_icons.dart';
import 'package:gitoo/Constants.dart';
import 'package:gitoo/Network/User.dart';
import 'package:gitoo/Widgets/NeumorphicBox.dart';
import 'package:gitoo/Widgets/CategoryButton.dart';
import 'package:gitoo/Widgets/ListBuilder.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int selectedList = 0;
  oneLiner(String bio) {
    if (bio.contains('\n')) {
      bio = bio.replaceAll('\n', ' ');
    }
    return bio;
  }

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User>(context);
    ListBuilder listBuilder = ListBuilder(_user.map);
    final size = MediaQuery.of(context).size;

    List dataLists = [
      listBuilder.showFollowers(),
      listBuilder.showFollowing(),
      listBuilder.showStarred(),
      listBuilder.showRepos(),
      listBuilder.showOrgs(),
    ];

    return Stack(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(left: size.width * 0.4, right: 10),
                color: Theme.of(context).primaryColor,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '${_user.map['name'] ?? 'Not Available'}',
                    style: kUserNameStyle,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(
                padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                color: Theme.of(context).primaryColor,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 12,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: size.width * 0.2, bottom: size.width * 0.05),
                        alignment: Alignment.centerRight,
                        child: NeumorphicBox(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '${_user.map['email'] ?? 'Not Available'}',
                              style: kEmailStyle,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 20,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            CategoryButton(
                              count: List.from(_user.map['followers']).length,
                              title: 'Followers',
                              icon: MfgLabs.users,
                              iconColor: kGreen,
                              function: () {
                                setState(() {
                                  selectedList = 0;
                                });
                              },
                              isPressed: selectedList == 0 ? true : false,
                            ),
                            SizedBox(
                              width: size.width * 0.06,
                            ),
                            CategoryButton(
                              title: 'Following',
                              count: List.from(_user.map['following']).length,
                              icon: Elusive.group,
                              iconColor: kGreen,
                              function: () {
                                setState(() {
                                  selectedList = 1;
                                });
                              },
                              isPressed: selectedList == 1 ? true : false,
                            ),
                            SizedBox(
                              width: size.width * 0.06,
                            ),
                            CategoryButton(
                              title: 'Starred',
                              count: List.from(_user.map['starred']).length,
                              icon: Icons.star,
                              iconColor: kYellow,
                              function: () {
                                setState(() {
                                  selectedList = 2;
                                });
                              },
                              isPressed: selectedList == 2 ? true : false,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.04,
                    ),
                    Expanded(
                      flex: 44,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 20,
                              child: NeumorphicBox(
                                isPressed: false,
                                child: dataLists[selectedList],
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.06,
                            ),
                            Expanded(
                              flex: 9,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    CategoryButton(
                                      count: List.from(_user.map['repos'])
                                          .length,
                                      title: 'Repos',
                                      iconColor: kOrange,
                                      icon: Elusive.github,
                                      function: () {
                                        setState(() {
                                          selectedList = 3;
                                        });
                                      },
                                      isPressed:
                                          selectedList == 3 ? true : false,
                                    ),
                                    SizedBox(
                                      height: size.width * 0.04,
                                    ),
                                    CategoryButton(
                                      count: List.from(_user.map['organisations'])
                                          .length,
                                      iconColor: kOrange,
                                      icon: ModernPictograms.money,
                                      title: 'Orgs',
                                      function: () {
                                        setState(() {
                                          selectedList = 4;
                                        });
                                      },
                                      isPressed:
                                          selectedList == 4 ? true : false,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.04,
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        alignment: Alignment.center,
                        child: Marquee(
                          text: '${oneLiner(_user.map['bio'] ?? 'Bio Not Available')}',
                          style: kInfoStyle,
                          scrollAxis: Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          blankSpace: 20.0,
                          velocity: 100.0,
                          pauseAfterRound: Duration(seconds: 0),
                          startPadding: 10,
                          accelerationDuration: Duration(seconds: 1),
                          accelerationCurve: Curves.linear,
                          decelerationDuration: Duration(milliseconds: 500),
                          decelerationCurve: Curves.easeOut,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
         
          ],
        ),
  
        Positioned(
          top: (MediaQuery.of(context).size.height) / 20,
          left: 10,
          child: CircleAvatar(
            radius: size.width * 0.20,
            backgroundColor: Colors.transparent,
            child: FlareActor(
              'assets/Loading.flr',
              animation: "Alarm",
              alignment: Alignment.center,
            ),
          ),
        ),
        Positioned(
          top: (MediaQuery.of(context).size.height) / 10,
          left: size.width * 0.12,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).accentColor,
                    blurRadius: 15,
                    spreadRadius: 5),
              ],
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: size.width * 0.11,
              backgroundColor: kSecondary,
              backgroundImage: NetworkImage(_user.map['avatar_url']),
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 10,
          child: Hero(
            tag: 'gitoo',
            child: Material(
              color: Colors.transparent,
              child: Text(
                'Gitoo',
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: size.width * 0.12,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
