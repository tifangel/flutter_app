import 'package:flutter/material.dart';
import 'package:myflutterapp/constants.dart';
import 'package:myflutterapp/demoData.dart';

import 'components/card_restaurant.dart';
import 'components/header_sliver.dart';
import 'components/home_bar.dart';
import 'components/image_carousel.dart';
import 'components/section_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeBar(context),
      body: CustomScrollView(
        //biar scroll nya tidak per section, misal mau ada GridView atau ListView dalam satu page, jadi scrollnya satu page, mirip ScrollView
        slivers: <Widget>[
          // const HeaderSliver(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            // sliver: SliverToBoxAdapter(
            //   child: Column(
            //     children: const [ImageCarousel(), SectionTitle()],
            //   ),
            // ),
            sliver: SliverList(
                //mempercepat kinerja app dari pada harus merender beberapa SliverToBoxAdapter
                delegate:
                    SliverChildListDelegate([ImageCarousel(), SectionTitle()])),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    demoMediumCardData.length,
                    (index) => Padding(
                          padding: EdgeInsets.only(
                              left: defaultPadding,
                              right: index == demoMediumCardData.length - 1
                                  ? defaultPadding
                                  : 0),
                          child: CardRestaurant(
                              image: demoMediumCardData[index]['image'],
                              name: demoMediumCardData[index]['name'],
                              location: demoMediumCardData[index]['location'],
                              rating: demoMediumCardData[index]['rating'],
                              delivertTime: demoMediumCardData[index]
                                  ['delivertTime']),
                        )),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(defaultPadding),
            sliver: SliverToBoxAdapter(
              child: Image.asset("assets/images/Banner.png"),
            ),
          ),
        ],
      ),
    );
  }
}
