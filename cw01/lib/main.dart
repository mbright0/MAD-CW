import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: _TabsNonScrollableDemo(),
      ),
    );
  }
}

class _TabsNonScrollableDemo extends StatefulWidget {
  @override
  __TabsNonScrollableDemoState createState() => __TabsNonScrollableDemoState();
}

class __TabsNonScrollableDemoState extends State<_TabsNonScrollableDemo>
    with SingleTickerProviderStateMixin, RestorationMixin {
  late TabController _tabController;

  final RestorableInt tabIndex = RestorableInt(0);

  @override
  String get restorationId => 'tab_non_scrollable_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    _tabController.index = tabIndex.value;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
    _tabController.addListener(() {
      setState(() {
        tabIndex.value = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    tabIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
// For the To do task hint: consider defining the widget and name of the tabs here
    final tabs = ['Tab 1', 'Tab 2', 'Tab 3', 'Tab 4'];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Tabs Demo',
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          tabs: [
            for (final tab in tabs) Tab(text: tab, color),
          ],
        ),
      ),
   ),

   Widget tab1(BuildContext context){
      return Container(
	 color: Colors.blue,
	 child: Center(
	    Text(
	       'Tab 1',
	       style: TextStyle(fontSize: 25 fontWeight: FontWeight .bold),
	    ),
	    SizedBox(height: 20),

	    ElevatedButton (
	    onPressed:(){
	       showDialog(
		  context: context,
		  builder: ( _) => AlertDialog(
		     title: Text('Alert on Tab 1'),
		     content: Text('Tab 1\'s alert dialog.'),
		     actions: <Widget>[
			TextButton(
			   onPressed: () => Navigator.pop(context, "OK"),
			   child: const Text('OK'),
			),
		     ],
		  ),
	       ),
	    },
	    ),
	 ),
      ),
   },

   Widget tab2(){
      return Container (
	 color: Colors .purple .shade50,
	 Center(
	    child: Image.network(
	      'https://static.wikia.nocookie.net/video-game-character-database/images/2/27/The_Knight.png/revision/latest/scale-to-width-down/1000?cb=20200401111906', 
	       width: 150,
	       height: 150,
	    ),
	 ),
      ),
   },

   Widget tab3(BuildContext context){
      return Container(
	 Center(
	    child: ElevatedButton(
	       onPressed: () {
		  ScaffoldMessenger.of(context).showSnackBar(
		     SnackBar(
			content: Text('Button pressed in ${tabs[2]} tab!'),
		     ),
		  );
	       },

	    child: Text('Click me'),
	    ),
	 ),
      ), 
   },

   Widget tab4(){
      return Container(
	 color: Colors .green .shade50,
	 child: ListView(
	    children:[
	       ListTile(title: Text('Item 1'),),
	       ListTile(title: Text('Item 2'),),
	    ], 
   )
	 ),
   },


      body: TabBarView(
        controller: _tabController,
        children: [
// hint for the to do task:Considering creating the different for different tabs
	    tab1(),
	    tab2(),
	    tab3(),
	    tab4(),
	 ],
      ),
  },
}





