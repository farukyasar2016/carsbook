import 'package:firebase_auth/firebase_auth.dart';
import 'package:firecars/services/authentification.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  final User? user;
  const HomeAppBar({this.user});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Carsbook'),
      elevation: 0.8,
      floating: true,
      forceElevated: true,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 80,
              //padding: EdgeInsets.only(right: 80),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              child: IconButton(
                onPressed: () => signOut(context),
                icon: Icon(Icons.logout),
                tooltip: 'Déconnexion',
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/profile'),
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(user!.photoURL!),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  signOut(BuildContext context) {
    //Navigator.of(context).pop();
    AuthService().signOut();
  }
}
