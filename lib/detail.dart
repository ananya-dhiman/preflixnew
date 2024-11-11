import 'package:flutter/material.dart';
import 'obj.dart';
import 'api.dart';

class Page3 extends StatefulWidget {
  final int showId;

  const Page3({Key? key, required this.showId}) : super(key: key);
  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<Page3> {

  late Future<List<Objs>> futureObj;
  @override
  void initState() {
    //called to initialize futureObj for first time
    super.initState();
      futureObj=Api.fetchObjs();
    
  }
  String cleanSummary(String summary) {
 
  final cleanedSummary = summary.replaceAll(RegExp(r'<[b/p^>]*>'), '');
  return cleanedSummary;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.movie, color: Colors.yellow),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0), // Adjust padding as needed
        child: Image.asset(
          'assets/panda.png',
          height: 30,
          width: 30,
        ),
      ),
        ],
      ),
      body:FutureBuilder<List<Objs>>(
        future:futureObj,
        builder:(context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child:CircularProgressIndicator());


          }
          else if(snapshot.hasError){
            return Center(child:Text('Error ${snapshot.error}',style:TextStyle(color:Colors.white)));

          }
          else if(snapshot.hasData){
            final shows=snapshot.data!;
            final show=shows.firstWhere((item)=>item.id==widget.showId,
            orElse:() => Objs(id: 0, name: 'Not Found', summary: 'No details available', premiered: DateTime(2000, 1, 1), image: '', genres: []),
            );
            if(show.id==0){
              return const Center(child: Text("Sorry,Show not found",style:TextStyle(color:Colors.white)),
              );
            }
      else{
          
      return SingleChildScrollView(

        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow, width: 2),

              ),
              child: Image.network(
                show.image,
                width:350,
                height: 500,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 10),
            // Movie Title
            Text(
              show.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            // Genre and Year
            Text(
              "${show.genres.join(', ')}\n${show.premiered.year}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            // Play Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor:Colors.black,
                side: const BorderSide(color: Colors.white),
              
              
              ),
              onPressed: () {},
              icon: Icon(Icons.play_arrow,color: Colors.yellow,),
              label: Text("Play",style:TextStyle(color:Colors.yellow)),
            ),
            SizedBox(height: 10),
          
            Text(
              cleanSummary(show.summary),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            // Back Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:Colors.black,
                 side: const BorderSide(color: Colors.white),
              
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back",style:TextStyle(color:Colors.yellow)),
            ),
          ],
        ),
      );
      }
          }
          else{
            return Center(child: Text("Error 404",style:TextStyle(color:Colors.white)));
          }
        }
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
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
    );
  }
}

void main() => runApp(MaterialApp(
   debugShowCheckedModeBanner: false,
  home: Page3(showId:1),
));
