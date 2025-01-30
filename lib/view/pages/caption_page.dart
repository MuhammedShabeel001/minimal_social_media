import 'package:flutter/material.dart';
import 'package:social_media/view/widgets/app_bar.dart';
import 'package:social_media/view/widgets/my_tile.dart';
import 'package:social_media/view/widgets/text_button.dart';

class CaptionPage extends StatelessWidget {
  const CaptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              SizedBox(
                height: 300,
                child: CarouselView(itemExtent: 350, children: [
                  Container(
                    color: Colors.yellow,
                  ),
                  Container(
                    color: const Color.fromARGB(255, 59, 88, 255),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 255, 59, 59),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 59, 255, 157),
                  ),
                ]),
              ),
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Add a caption...',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none, // No border
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none, // No border
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none, // No border when focused
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                minLines: 3,
                maxLines: 6,
                style: TextStyle(color: Colors.black), // Text color
              ),
              Container(
                  // height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        MyTile(
                          icon: 'assets/icons/icon9.svg',
                          text: 'Add location',
                          trailing: Icon(Icons.keyboard_arrow_right_rounded),
                        ),
                        Divider(),
                        MyTile(
                          icon: 'assets/icons/icon10.svg',
                          text: 'Tag people',
                          trailing: Icon(Icons.keyboard_arrow_right_rounded),
                        ),
                        Divider(),
                        MyTile(
                          icon: 'assets/icons/icon11.svg',
                          text: 'Add music',
                          trailing: Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(25),
        child: SizedBox(
            height: 50, child: MyTextButton(text: 'Share', ontap: () {})),
      ),
    );
  }
}
