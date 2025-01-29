import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/view/widgets/app_bar.dart';
import 'package:social_media/view/widgets/icon_text_button.dart';
import '../../controller/image_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewPostPage extends StatelessWidget {
  const NewPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(240, 240, 240, 1),
        appBar: MyAppBar(
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  'Next',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromRGBO(209, 109, 242, 1)),
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: 20,
            children: [
              Container(
                width: double.infinity,
                height: 240,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      spacing: 10,
                      children: [Text('Recents',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),), Icon(Icons.keyboard_arrow_down_outlined)],
                    ),
                  ),
                  SizedBox(child: Row(
                    spacing: 20,
                    children: [
                      SvgPicture.asset('assets/icons/icon3.svg',height: 20,), 
                      SvgPicture.asset('assets/icons/icon2.svg',height: 20,), 
                    ],
                  ))
                ],
              ),
              Row(
                spacing: 20,
                children: [
                  IconTextButton(
                      text: 'Recent',
                      icon: 'assets/icons/icon5.svg',
                      ontap: () {}),
                  IconTextButton(
                      text: 'Photos',
                      icon: 'assets/icons/icon4.svg',
                      ontap: () {}),
                  IconTextButton(
                      text: 'Videos',
                      icon: 'assets/icons/icon2.svg',
                      ontap: () {}), 
                ],
              ),
              Expanded(child: Container(color: Colors.blueAccent,))
            ],
          ),
        ));
  }
}
