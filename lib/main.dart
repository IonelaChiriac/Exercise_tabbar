import 'package:flutter/material.dart';

void main() => runApp(TabBarExample());


class TabBarExample extends StatefulWidget {
  @override
 _TabBarExampleState createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample> with SingleTickerProviderStateMixin {
  // with - for adding more features to the existing one
  // SingleTickerProviderStateMixin -  for controlling the state of the tabs everytime when we click the tab items
  // Mixin - providing the inheritance property to the state in abstract way
  // TabController - for controlling the tab items and handle the tabs
  // _selectedIndex - for providing index to the tabs
  // initState() - initially when we load the screen it needs the tabs to show to the user along with the default data

  TabController _controller;
//for providing the index of the tabs

  List<Widget> list = [
    Tab(icon: Icon(Icons.picture_in_picture), text: "Column"),
    Tab(icon: Icon(Icons.article), text: "ListTile"),
    Tab(icon: Icon(Icons.line_weight), text: "Stack"),
    Tab(icon: Icon(Icons.article), text: "ListView"),
    Tab(icon: Icon(Icons.article_outlined), text: "ListViewBuilder"),
  ];

  // list for providing content to the tab

  @override
  void initState() { //UI initialization with the tabs and give control like default index 0
    super.initState(); // Create TabController for getting the index of current tab, getting the properties from init
    _controller = TabController(length: list.length, vsync: this);
    // lenth for geting the lenght of the tab
    // vsync for getting the current screen  or to render the portion of the screen to handle the tabs

    _controller.addListener(() { // addListener for listen the tab controller so that we can handle the swipe, tap or other gestures as well as the content of the tabs
      setState(() {              // addListener for listen the tab controller so that we can handle the swipe, tap or other gestures as well as the content of the tabs
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            // isScrollable: true,
            onTap: (index) {
            },
            controller: _controller,
            tabs: list,
          ),
          title: Text('Tabs Example'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Colors.blue,
                      Colors.green
                    ],),
            ),
          ),
        ),
          // centerTitle: true,

        body: TabBarView(
          controller: _controller,
          children: [
            Center(
                child:
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget>[
                      Container(
                        margin: EdgeInsets.all(15.0),
                        padding: EdgeInsets.all(50.0),
                        decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(8),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Colors.purple, Colors.blue])
                        ),
                        child: Text("Linear gradient",style: TextStyle(color:Colors.white,fontSize:25),),
                      ),
                      Container(
                        margin: EdgeInsets.all(15.0),
                        padding: EdgeInsets.all(50.0),
                        decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(8),
                        gradient: RadialGradient(
                        colors: [Colors.lightBlueAccent, Colors.deepPurple],
                        ),
                      ),
                        child: Text("Radial gradient",style: TextStyle(color:Colors.white,fontSize:25),),
                      ),Container(
                        margin: EdgeInsets.all(15.0),
                        padding: EdgeInsets.all(50.0),
                        decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(8),
                        gradient: RadialGradient(
                        colors: [Colors.blue, Colors.red,Colors.purple],
                        center: Alignment(0.6, -0.3),
                        focal: Alignment(0.3, -0.1),
                        focalRadius: 1.0,
                          ),
                        ),
                        child: Text("Radial gradient",style: TextStyle(color:Colors.white,fontSize:25),),
                      ),
                      Container(
                        margin: EdgeInsets.all(15.0),
                        padding: EdgeInsets.all(50.0),
                        decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(8),
                            gradient: SweepGradient(
                            colors: [Colors.yellow, Colors.green,Colors.blue],
                            stops: [0.1, 0.6, 0.9],
                          ),
                        ),
                        child: Text("Sweep gradients",style: TextStyle(color:Colors.white,fontSize:25),),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.red, Colors.blue],
                            begin: FractionalOffset.centerLeft,
                            end: FractionalOffset.centerRight,
                          ),
                        ),
                        child: TextButton(
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            print('button pressed');

                          },

                        ),
                      ),
                    ],
                ),
      ),
            Center(
              child: ListView(
                children: ListTile.divideTiles(
                  context: context,
                  tiles:[
                  ListTile(
                    leading: Icon(Icons.photo_album),
                    title: Text('Mercury'),
                    subtitle: Text('The closest planet to the Sun '),
                    dense: false,
                    trailing: Icon(Icons.forward),
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    selected: true,
                    selectedTileColor: Colors.white,
                    onTap: () {
                      print('closest planet to the Sun');
                    },
                    onLongPress: () {
                      print('Long Press is activated');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_album),
                    title: Text('Venus'),
                    subtitle: Text('The second planet to the Sun '),
                    dense: false,
                    trailing: Icon(Icons.forward),
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    selected: true,
                    selectedTileColor: Colors.white,
                    onTap: () {
                      print('second planet to the Sun');
                    },
                    onLongPress: () {
                      print('Long Press is activated');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_album),
                    title: Text('Earth'),
                    subtitle: Text(' Home '),
                    dense: false,
                    trailing: Icon(Icons.forward),
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    selected: true,
                    selectedTileColor: Colors.white,
                    onTap: () {
                      print('third planet to the Sun');
                    },
                    onLongPress: () {
                      print('Long Press is activated');
                    },
                  ),
                ],
               ).toList(),
              ),
            ),
            Center(
                child: Stack(
                  children: <Widget>[
                    Container(
                      color: Colors.blue,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      color: Colors.amber,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                      color: Colors.blueGrey,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 60, horizontal: 70),
                      color: Colors.orange,
                    ),
                  ],
                ),
            ),
            Center(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.photo_album),
                      title: Text('Album'),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Phone'),
                    ),
                    ListTile(
                      leading: Icon(Icons.contacts),
                      title: Text('Contact'),
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Setting'),
                    ),
                  ],
                ),
            ),
            Center(
                child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (BuildContext context,int index){
                      return ListTile(
                          leading: Icon(Icons.list),
                          trailing: Text("Jpg",
                            style: TextStyle(
                                color: Colors.blue,fontSize: 15),),
                          title:Text("List item $index")
                      );
                    }
                ),
            ),
          ],
          ),
      ),
    );
  }
}



//TODO: Exercise with  4 TabBar
//TODO:1- simple column
//TODO:2- stack
//TODO:3- ListView
//TODO:4- ListViewBuilder
//TODO:5- Gradient


