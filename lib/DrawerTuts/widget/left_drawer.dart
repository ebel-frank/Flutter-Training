import 'package:flutter/material.dart';
import 'package:training/DrawerTuts/widget/menu_list_tile.dart';

class LeftDrawerWidget extends StatefulWidget {
  const LeftDrawerWidget({Key? key}) : super(key: key);

  @override
  _LeftDrawerWidgetState createState() => _LeftDrawerWidgetState();
}

class _LeftDrawerWidgetState extends State<LeftDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          UserAccountsDrawerHeader(
            currentAccountPicture:
                Icon(Icons.face, size: 48.0, color: Colors.black),
            accountName: Text("Emeka Jude Ebeledike", style: TextStyle(color: Colors.black),),
            accountEmail: Text("emekaebeledike@gmail.com", style: TextStyle(color: Colors.black),),
            otherAccountsPictures: [
              Icon(
                Icons.bookmark_border,
                color: Colors.white,
              )
            ],
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/siblings.jpg'), fit: BoxFit.cover, opacity: -0.5,),
            ),
          ),
          MenuListTileWidget(),
        ],
      ),
    );
  }
}
