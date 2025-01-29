import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20), 
          child: SizedBox(
            height: 45,
            width: 312, 
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(209, 109, 242, 1),
                // textStyle: TextStyle(color: Colors.white, )
              ),
              child: Text('Start', style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
          ),
        ),
      ),
    );
  }
}
