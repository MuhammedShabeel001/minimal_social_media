import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/view/widgets/app_bar.dart';
import 'package:social_media/view/widgets/filter_button.dart';
import 'package:social_media/view/widgets/text_button.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/icon6.svg')),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/icon7.svg')),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 470,
              color: Colors.grey,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 FilterButton(filtername: 'Browse', color: Color.fromRGBO(209, 109, 242, 1),icon: SvgPicture.asset('assets/icons/icon8.svg',height: 10,),)  ,
                 FilterButton(filtername: 'Filter 1', color: Color.fromRGBO(234, 169, 255, 1)),
                 FilterButton(filtername: 'Filter 1', color: Color.fromRGBO(140, 19, 181, 1)),
                 FilterButton(filtername: 'Filter 1', color: Color.fromRGBO(109, 156, 242, 1)), 
                 FilterButton(filtername: 'Filter 1', color: Color.fromRGBO(196, 203, 97, 1)), 
              ],
            ),
            SizedBox(
              height: 50,
              width: 120,
              child: MyTextButton(text: 'Next', ontap: (){}))
          ],
        ),
      ),
    );
  }
}

