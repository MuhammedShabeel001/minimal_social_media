import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import 'package:social_media/view/pages/filter_page.dart';
import 'package:social_media/view/widgets/app_bar.dart';
import 'package:social_media/view/widgets/icon_text_button.dart';
// import '../../controller/image_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../controller/media_provider.dart';

class NewPostPage extends StatelessWidget {
  const NewPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaProvider = Provider.of<MediaProvider>(context, listen: false);
    mediaProvider.loadMedia();
    return Scaffold(
        backgroundColor: Color.fromRGBO(240, 240, 240, 1),
        appBar: MyAppBar(
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FilterPage(),
                    ));
              },
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(209, 109, 242, 1),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: 20,
            children: [
              Consumer<MediaProvider>(
                builder: (context, provider, child) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: provider.selectedMedia.isEmpty ? 0 : 350,
                    // color: Colors.grey,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: provider.selectedMedia.map((media) {
                        return FutureBuilder(
                          future: media.thumbnailDataWithSize(
                              const ThumbnailSize(300, 300)),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) return Container();
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: Image.memory(
                                snapshot.data!,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      spacing: 10,
                      children: [
                        Text(
                          'Recents',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Icon(Icons.keyboard_arrow_down_outlined)
                      ],
                    ),
                  ),
                  SizedBox(
                      child: Row(
                    spacing: 20,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/icon3.svg',
                        height: 20,
                      ),
                      SvgPicture.asset(
                        'assets/icons/icon2.svg',
                        height: 20,
                      ),
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
              Expanded(
                child: Consumer<MediaProvider>(
                  builder: (context, provider, child) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: provider.recentMedia.length,
                      itemBuilder: (context, index) {
                        final media = provider.recentMedia[index];
                        return GestureDetector(
                          onLongPress: () => provider.toggleSelection(media),
                          child: FutureBuilder(
                            future: media.thumbnailDataWithSize(
                                const ThumbnailSize(200, 200)),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Container(color: Colors.black12);
                              }
                              return Stack(
                                children: [
                                  Positioned.fill(
                                    child: Image.memory(snapshot.data!,
                                        fit: BoxFit.cover),
                                  ),
                                  if (provider.selectedMedia.contains(media))
                                    Positioned(
                                      top: 5,
                                      right: 5,
                                      child: const Icon(Icons.check_circle,
                                          color: Colors.green),
                                    ),
                                ],
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
