import 'package:flutter/material.dart';
import 'package:social_media/view/pages/new_post_page.dart';
import 'package:social_media/view/widgets/text_button.dart';

import '../../services/permission_service.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  void _requestPermissions(BuildContext context) async {
    bool granted = await PermissionService.requestPermissions();
    if (granted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NewPostPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Permissions denied!")),
      );
       Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NewPostPage()),
      );
    }
  }

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
              ontap: () => _requestPermissions(context),
            ),
          ),
        ),
      ),
    );
  }
}
