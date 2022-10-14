import 'package:firebase_auth/firebase_auth.dart';
import 'package:firecars/views/profile/profileAppBar.dart';
import 'package:firecars/views/shared-ui/carList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User?>(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            ProfileAppBar(user : _user),
            SliverList(
                delegate: SliverChildListDelegate(
                    [
                      const Padding(
                          padding : EdgeInsets.only(top : 24.0, left : 16.0, bottom : 12.0),
                          child: Text('Vos voitures favorites',
                              style : TextStyle(
                                fontWeight: FontWeight.bold,
                              )
                          )
                      ),
                      const Divider(),
                    ],
                ),
            ),
            CarList(pageName: 'Profile', userID: _user!.uid),
            //Container(),
          ],
        ),
      ),
    );
  }
}
