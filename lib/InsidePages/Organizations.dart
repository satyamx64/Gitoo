import 'package:flutter/material.dart';
import 'package:gitoo/Common_Resources/Constants.dart';
import 'package:gitoo/Common_Resources/Shared_Widgets.dart';

List<String> organizations = [];

class Organizations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InsidePage(
        getList: getList(),
        title: 'Organizations',
      ),
    );
  }
}

Widget getList() {
  if (organizations.isNotEmpty) {
    return ListView.separated(
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text(
              '${organizations[index]}',
              style: kInsideText.copyWith(fontWeight: FontWeight.normal),
            ),
          );
        },
        separatorBuilder: (BuildContext context, index) {
          return Divider(
            color: kLPrimary,
          );
        },
        itemCount: organizations.length);
  } else {
    return Center(
      child: Text(
        'Bhai ko kahi kaam nahi mila',
        style: kInsideText,
      ),
    );
  }
}