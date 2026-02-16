import 'package:flutter/material.dart';

void main() {
  runApp(const CounterImageToggleApp());
}

class CounterImageToggleApp extends StatelessWidget {
  const CounterImageToggleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CW1 Counter & Toggle',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int _counter = 0;
  bool _isDark = false;
  bool _isFirstImage = true;
  bool _switchImage = false;
  final _history = <int>[0,0];
  int _step = 1;
 
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds:500),
       vsync: this,
     );
     _fade = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  void _updateHistory(){
    setState((){    
      if(_history.length == 5){
	 _history.removeAt(0);
      }
      _history.add(_counter);
    });
  }

  void _incrementCounter() {
    setState(() => _counter+= _step);
  }

  void _decrementCounter(){
     setState(() => _counter-= _step);
  }

  void _resetCounter(){
     setState(()=> _counter = 0);
  }

  void _undoCounter(){
     setState((){
	 _counter= _history.removeLast();
	});
  }

  void _toggleTheme() {
    setState(() => _isDark = !_isDark);
  }   

  void _toggleImage() {
    if (_isFirstImage) { 
      _controller.forward();
    } else {
      _controller.reverse();
      
    }
    setState(() => _isFirstImage = !_isFirstImage);
       
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CW1 Counter & Toggle'),
          actions: [
            IconButton(
              onPressed: _toggleTheme,
              icon: Icon(_isDark ? Icons.light_mode : Icons.dark_mode),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
	      Text(
                'Counter: $_counter',
                 style: TextStyle(fontSize: 32),
	       ),
              const SizedBox(height: 12),
	      Row(
	       mainAxisAlignment: MainAxisAlignment.center,
	       children: [ 
		  ElevatedButton(
		     onPressed: () => [_updateHistory(), _incrementCounter()],
		     child: const Text('Increment'),
		  ),
		  ElevatedButton(
		     onPressed: () => [_updateHistory(), _decrementCounter()],
		     child: const Text('Decrement'),
		  ),
		  ElevatedButton(
		     onPressed: () => [_updateHistory(), _resetCounter()],
		     child: const Text('Reset'),
		  ),
	       ],
	      ),
	      const SizedBox(height: 12),
	      Row(
	        mainAxisAlignment: MainAxisAlignment.center,
		children: [
		   ElevatedButton(
		     onPressed: _undoCounter,
		     child: Text('Undo: $_history'),
		   ),
		  ],
	      ),
	      const SizedBox(height: 24),
	      Stack(
	       children: [
		  Image.asset(
		     'assets/image1.png',
		     width: 180,
		     height: 180,
		     fit: BoxFit.cover,
		  ),
		  FadeTransition(
		  opacity: _fade,
		   child: Image.asset(
		     _isFirstImage ? 'assets/image1.png' : 'assets/image2.png',
		     width: 180,
		     height: 180,
		     fit: BoxFit.cover,
		     ),
		  ),
	       ],
	      ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _toggleImage,
                child: const Text('Toggle Image'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
