import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';
import 'package:test_agni/helper/constant/settings.dart';
import 'package:test_agni/helper/ui/app_hex_color.dart';
import 'package:test_agni/routes/app_routes.dart';

final key = GlobalKey<_HomeContentState>();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _HomeContent();
  }
}

class _HomeContent extends StatefulWidget {
  const _HomeContent({Key? key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<_HomeContent> {
  final CarouselController _controller = CarouselController();
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [_topSection(), _slideImage(), InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.rDProduk);
                },
                child: _listContent())],
          ),
        ),
      ),
    );
  }

  Widget _topSection() {
    double size = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Cari dengan mengetik barang",
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  focusColor: Colors.black,
                  filled: true,
                  fillColor: AppHexColor("#F0F0F0"),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FaIcon(FontAwesomeIcons.search, color: AppHexColor("#3AB648"), size: 20),
                  )),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppHexColor("#64A1F4"),
            ),
            child: const Image(
              image: AssetImage(Settings.assetsImagesDir + "options.png"),
              width: 20,
              height: 26,
            ),
          ),
          Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppHexColor("#DFAE1D"),
              ),
              child: const FaIcon(
                FontAwesomeIcons.shoppingBag,
                color: Colors.white,
              )),
          Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppHexColor("#FF485A"),
              ),
              child: const FaIcon(
                FontAwesomeIcons.bell,
                color: Colors.white,
              )),
        ],
      ),
    );
  }

  Widget _slideImage() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Builder(
          builder: (context) {
            return CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.2,
                enlargeCenterPage: true,
                disableCenter: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 300),
                autoPlayCurve: Curves.fastOutSlowIn,
                viewportFraction: 1.0,
                initialPage: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    current = index;
                  });
                },
              ),
              items: imgList
                  .map((item) => Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              image: AssetImage(Settings.assetsImagesDir + item),
                            ),
                          ),
                        ],
                      ))
                  .toList(),
            );
          },
        ),
        DotStepper(
          lineConnectorDecoration: const LineConnectorDecoration(color: Colors.black),
          activeStep: current,
          dotRadius: 15,
          dotCount: 3,
          spacing: 4,
          indicatorDecoration: IndicatorDecoration(color: AppHexColor("#3C7DD9"), strokeWidth: 10),
          shape: Shape.pipe,
          fixedDotDecoration: FixedDotDecoration(
            color: AppHexColor("#64A1F4"),
          ),
          indicator: Indicator.worm,
          onDotTapped: (tappedDotIndex) {
            setState(() {
              current = tappedDotIndex;
            });
          },
        ),
      ],
    );
  }

  Widget _listContent() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        primary: false,
        padding: const EdgeInsets.all(0),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        children: [
          _componentGrid(AppHexColor("#E1F3D9"), const AssetImage(Settings.assetsImagesDir + "1.png")),
          _componentGrid(AppHexColor("#63A0F2"), const AssetImage(Settings.assetsImagesDir + "2.png")),
          _componentGrid(AppHexColor("#E1F3D9"), const AssetImage(Settings.assetsImagesDir + "3.png")),
          _componentGrid(AppHexColor("#E1F3D9"), const AssetImage(Settings.assetsImagesDir + "4.png")),
          _componentGrid(AppHexColor("#D2A41B"), const AssetImage(Settings.assetsImagesDir + "5.png")),
          _componentGrid(AppHexColor("#E1F3D9"), const AssetImage(Settings.assetsImagesDir + "6.png")),
          _componentGrid(AppHexColor("#E1F3D9"), const AssetImage(Settings.assetsImagesDir + "6.png")),
          _componentGrid(AppHexColor("#E1F3D9"), const AssetImage(Settings.assetsImagesDir + "8.png")),
        ],
      ),
    );
  }

  Widget _componentGrid(Color colors, AssetImage image){
    double size = MediaQuery.of(context).size.width;
    return  Container(
      width: size * 0.5,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colors,
                ),
                child: Image(
                  image: image,
                  width: size * 0.5,
                  height: 150,
                ),
              ),
              Container(
                width: size / 3,
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius:
                  const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                  color: AppHexColor("#DFAE1D"),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 15,
                    ),
                    RichText(
                        textScaleFactor: 1,
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: "5.0 ",
                              ),
                              TextSpan(
                                text: "| ",
                              ),
                              TextSpan(
                                text: "200+ ",
                              ),
                              TextSpan(
                                text: "rating ",
                              )
                            ])),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Rp 6.000",
                    style: GoogleFonts.inter(color: AppHexColor("#9EC4F8"), decoration: TextDecoration.lineThrough, fontSize: 10),
                    textScaleFactor: 1),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blue,
                  ),
                  child: Text("Diskon 10 %",
                      style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10), textScaleFactor: 1),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("Rp 4.500", style: GoogleFonts.inter(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 10), textScaleFactor: 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text("Lorem ipsum", style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 10), textScaleFactor: 1),
          ),
        ],
      ),
    );
  }
}

final List<String> imgList = [
  'banner.png',
  'banner.png',
  'banner.png',
];
