import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);
  Widget buildDrawerTile({
    required String title,
    required IconData iconData,
    required VoidCallback onhandller,
  }) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
      onTap: onhandller,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          padding: EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.orange),
          alignment: Alignment.center,
          child: Text(
            'Cooking Up',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white, fontWeight: FontWeight.w900, fontSize: 30),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        buildDrawerTile(
            title: 'Meals',
            iconData: Icons.restaurant,
            onhandller: () {
              Navigator.of(context).pushReplacementNamed('/');
            }),
        buildDrawerTile(
            title: 'Settings',
            iconData: Icons.settings,
            onhandller: () {
              Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routeName);
            }),
      ],
    );
  }
}
