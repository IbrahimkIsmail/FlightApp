
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget{
  final List<BottomNavigationBarItem> bottomBarItems = [];

   CustomAppBar(){
    bottomBarItems.add(
      BottomNavigationBarItem(
        activeIcon: Icon(Icons.home,color: Colors.deepOrange,),
        icon: Icon(Icons.home,color: Colors.black,),
        title: Text("Home", style: TextStyle(color: Colors.black,fontSize: 12.0),),
      ),
    );

    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite,color: Colors.black,),
        title: Text("Watchtlist", style: TextStyle(color: Colors.black,fontSize: 12.0),),
      ),
    );

    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.local_offer,color: Colors.black,),
        title: Text("Deals", style: TextStyle(color: Colors.black,fontSize: 12.0),),
      ),
    );

    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.notification_important,color: Colors.black,),
        title: Text("Notificatios", style: TextStyle(color: Colors.black,fontSize: 12.0),),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      elevation: 12.0,
      child: BottomNavigationBar(
        currentIndex: 3,
        items: bottomBarItems,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }

}