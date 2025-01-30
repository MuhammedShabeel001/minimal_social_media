import 'package:flutter/material.dart';
import 'package:social_media/view/pages/new_post_page.dart';
import 'package:social_media/view/widgets/text_button.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: 45,
            width: 312,
            child: MyTextButton(
              text: 'Start',
              ontap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => NewPostPage(),));},
            ),
          ),
        ),
      ),
    );
  }
}
