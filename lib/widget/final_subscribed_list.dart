import 'package:flutter/material.dart';
import './new_subs.dart';
import '../models/Subscribed.dart';

class SubscribedList extends StatelessWidget {
  final List<Subscribed> subs;
  SubscribedList(this.subs);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: subs == null ? 0 : subs.length,
          itemBuilder: (BuildContext, int index) {
            return Container(
              child: Column(
                children: [
                  Card(
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(subs[index].logo),
                      Text(subs[index].name),
                    ],
                  ))
                ],
              ),
            );
          }),
    );
  }
}
