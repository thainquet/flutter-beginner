import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeSwiper extends StatefulWidget {
  const HomeSwiper({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeSwiperState createState() => _HomeSwiperState();
}

class _HomeSwiperState extends State<HomeSwiper> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        // return Image.network(
        //   "http://via.placeholder.com/350x150",
        //   fit: BoxFit.fill,
        // );
        return DecoratedBox(
            decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/bg.png'), fit: BoxFit.fill),
        ));
      },
      itemCount: 3,
      pagination: SwiperPagination(),
      control: SwiperControl(),
    );
  }
}
