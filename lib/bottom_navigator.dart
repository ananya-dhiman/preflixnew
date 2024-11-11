import 'package:flutter/material.dart';
import 'home.dart';
import 'search.dart';
import 'download.dart';

class BottomNavigatorClass extends StatefulWidget {
  const BottomNavigatorClass({super.key});

  @override
  State<BottomNavigatorClass> createState() => _BottomNavigatorClassState();
}

class _BottomNavigatorClassState extends State<BottomNavigatorClass> {  Widget build(BuildContext context){
    int _selectedIndex=0;
    final List<Widget> _pages=[
      const Page2(),
      const Page3(),
      const Page4(),
    ];
    void _onItemTapped(int index){
      setState(() {
        _selectedIndex=index;
      });
    }

    return BottomNavigationBar(
      backgroundColor:Colors.black,
    
      items:const[
        BottomNavigationBarItem(
          icon:Icon(Icons.home),
          label:'home',
        ),
        BottomNavigationBarItem(
          icon:Icon(Icons.search),
          label:'search',
        ),
        BottomNavigationBarItem(
          icon:Icon(Icons.download),
          label:'download',
        ),
      ],
       onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          // } else if (index == 1) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => SearchPage()),
          //   );
          // } else if (index == 2) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => DownloadsPage()),
          //   );
           }
        },

      

    );

  }
} 