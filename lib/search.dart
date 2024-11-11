import 'package:flutter/material.dart';
import 'obj.dart';
import 'api.dart';

class Page3 extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Page3> {
 
  late Future<List<Objs>> futureObj;
  List<Objs> filteredMovies=[];
  List<Objs> allMovies=[];
  @override
  void initState() {
    //called to initialize futureObj for first time
    super.initState();
      futureObj=Api.fetchObjs();
    
  }



  void filterMovies(String query) {
    final filtered = allMovies.where((movie) {
      final movieNameLower = movie.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return movieNameLower.contains(searchLower);
    }).toList();

    setState(() {
      filteredMovies = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: TextField(
            onChanged: filterMovies,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Search movies...',
              hintStyle: const TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
          ),
        ),
        body:FutureBuilder(
            future:futureObj,
            builder: (context,snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                    return const Center(child: CircularProgressIndicator());
                }
                else if(snapshot.hasError){
                    return  Center(child:Text('Error ${snapshot.error}', style:TextStyle(color: Colors.grey)));

                }
                else if(snapshot.hasData){
                    allMovies=snapshot.data!;
                    filteredMovies=allMovies;

                


            
        return ListView.builder(
          itemCount: filteredMovies.length,
          itemBuilder: (context, index) {
            final movie = filteredMovies[index];
            return ListTile(
              leading: Image.network(movie.image, width: 50, height: 75, fit: BoxFit.cover),
              title: Text(movie.name, style: const TextStyle(color: Colors.white)),
              trailing: const Icon(Icons.play_arrow, color: Colors.yellow),
              onTap: () {
                // Handle movie selection
              },
            );
          },
        );
                }else{
                    return  Center (child:Text("Error 404",style: const TextStyle(color: Colors.white)));
                }
            }
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.download),
              label: 'Downloads',
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(Page3());
