import 'package:flutter/material.dart';
import 'obj.dart';
import 'api.dart';
import 'bottom_navigator.dart';
void main() {
  runApp(const Page2());
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState(); 
}

class _HomePageState extends State<HomePage>{
  late Future<List<Objs>> futureObj;
  @override
  void initState() {
    //called to initialize futureObj for first time
    super.initState();
      futureObj=Api.fetchObjs();
    
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.movie, color: Colors.yellow),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          Image.asset(
            'assets/panda.png',
            height: 40,
            width: 40,
          ),
        ],
      ),
      body:FutureBuilder<List<Objs>>(
        future:futureObj,
        builder: (context,snapshot){
          if(snapshot.connectionState== ConnectionState.waiting ){
            return const Center(child: CircularProgressIndicator());
          }
          else if(snapshot.hasError){
            return Center(child:Text('Error: ${snapshot.error}',style: const TextStyle( color:Colors.white)));

          }
          else if(snapshot.hasData){
            final List<Objs> data=snapshot.data!;
          
      
      return SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main Section
              Center(
                child: Column(
                  children: [
                    Image.network(
                      'https://static.tvmaze.com/uploads/images/original_untouched/425/1064746.jpg',
                      height: 400,
                      width:300,
                
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'All American',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            side: const BorderSide(color: Colors.white),
                          ),
                          onPressed: () {},
                          child: const Row(
                            children: [
                              Icon(Icons.play_arrow, color: Colors.white),
                              SizedBox(width: 5),
                              Text("Play",style:TextStyle(color:Colors.yellow)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            side: const BorderSide(color: Colors.white),
                          ),
                          onPressed: () {},
                          child: const Row(
                            children: [
                              Icon(Icons.info, color: Colors.white),
                              SizedBox(width: 5),
                              Text("Info",style:TextStyle(color:Colors.yellow)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Movies 
              const Text(
                "Shows",
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final obj=data[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child:Card(
                       color: Colors.grey[900],
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  obj.image.isNotEmpty
                                      ? Image.network(
                                          obj.image,
                                          height: 120,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        )
                                      : const Icon(Icons.movie, color: Colors.yellow, size: 100),
                                  const SizedBox(height: 5),
                                  Text(
                                    obj.name,
                                    style: const TextStyle(color: Colors.white, fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                      )
                      
                    );
                    
                  },
                ),
              ),

              const SizedBox(height: 20),

              
             
            ],
          ),
        ),
      );
        }
         else{
          return const Center(child: Text('No data found', style: TextStyle(color: Colors.white)));
          
        }
        }
       
      ),
        bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
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
        onTap: (index) {
          // Handle tap but not for navigation anymore
        },
      ),
    );
  }
}
    
    
  

