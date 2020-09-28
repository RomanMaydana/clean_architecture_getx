import 'package:flutter/material.dart';

import '../../theme.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: DeliveryColors.green),
                  padding: const EdgeInsets.all(4),
                  child: CircleAvatar(
                    radius: 45,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('username', style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Card(
                        color: Theme.of(context).canvasColor,
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text('Personal Information',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).accentColor)),
                              const SizedBox(
                                height: 25,
                              ),
                              Text('email@gmail.com',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              Row(
                                children: [
                                  Text('Dark mode'),
                                  Spacer(),
                                  Switch(value: true, onChanged: (val) {})
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Center(
                        child: RaisedButton(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                'Go shopping',
                                style: TextStyle(color: DeliveryColors.white),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: DeliveryColors.purple,
                            onPressed: () {}))
                  ]))
        ],
      ),
    );
  }
}
