import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';
import 'package:test_agni/helper/constant/settings.dart';
import 'package:test_agni/helper/ui/app_hex_color.dart';
import 'package:test_agni/routes/app_routes.dart';

class ProdukPage extends StatelessWidget {
  const ProdukPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _ProdukContent(),
    );
  }
}

class _ProdukContent extends StatefulWidget {
  const _ProdukContent({Key? key}) : super(key: key);

  @override
  _ProdukContentState createState() => _ProdukContentState();
}

class _ProdukContentState extends State<_ProdukContent> {
  final String deskripsi =
      "Deskripsi In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.";
  final CarouselController _controller = CarouselController();
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [_topSection(context), _slideImage(), _content()],
        ),
      ),
    );
  }

  Widget _topSection(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Image(
              image: AssetImage(Settings.assetsImagesDir + "back.png"),
              height: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("PRODUK DETAIL", style: GoogleFonts.inter(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16), textScaleFactor: 1),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoute.rCheckout);
            },
            child: const FaIcon(
              FontAwesomeIcons.shoppingBag,
              color: Colors.blue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FaIcon(
              FontAwesomeIcons.solidBell,
              color: AppHexColor("#FF485A"),
            ),
          )
        ],
      ),
    );
  }

  Widget _slideImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
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
                              child: Center(
                                child: Image(
                                  image: AssetImage(Settings.assetsImagesDir + item),
                                ),
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
      ),
    );
  }

  Widget _content() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(100),
            ),
            color: AppHexColor("#FF485A"),
          ),
        ),
        Container(
          transform: Matrix4.translationValues(0.0, 30, 0.0),
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
            ),
            color: Colors.white,
          ),
          child: _detail(),
        ),
      ],
    );
  }

  Widget _detail() {
    return Padding(
      padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Tas Gucci", style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16), textScaleFactor: 1),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppHexColor("#D2A41B"),
                  ),
                  child: Text("Barang Bekas",
                      style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10), textScaleFactor: 1),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppHexColor("#63A0F2"),
                  ),
                  child:
                      Text("Stok 100", style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10), textScaleFactor: 1),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Rp 6.000",
                    style: GoogleFonts.inter(color: AppHexColor("#9EC4F8"), decoration: TextDecoration.lineThrough, fontSize: 16),
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
            child: Text("Rp 4.500", style: GoogleFonts.inter(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16), textScaleFactor: 1),
          ),
          const SizedBox(
            height: 30,
          ),
          const Divider(
            height: 1,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text("Vendor", style: GoogleFonts.inter(fontSize: 13), textScaleFactor: 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: [
                const CircleAvatar(
                  maxRadius: 20,
                  backgroundImage: AssetImage(Settings.assetsImagesDir + "9.png"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Eiger Store", style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16), textScaleFactor: 1),
                ),
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.blue,
                      size: 15,
                    ),
                    RichText(
                        textScaleFactor: 1,
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.blue,
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
                                text: "Terjual ",
                              )
                            ])),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text("Deskripsi", style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.bold), textScaleFactor: 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              deskripsi,
              style: GoogleFonts.inter(fontSize: 13),
              textScaleFactor: 1,
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text("Ulasan dan Penilaian", style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.bold), textScaleFactor: 1),
          ),
          _commentContent(const AssetImage(Settings.assetsImagesDir + "profile1.png"), "Moude Hall", "That's a fantastic new app feature. You and your team did an excellent job of incorporating user testing feedback."),
          _commentContent(const AssetImage(Settings.assetsImagesDir + "profile2.png"), "Ester Howard", "That's a fantastic new app feature. You and your team did an excellent job of incorporating user testing feedback.")
        ],
      ),
    );
  }

  Widget _commentContent(AssetImage image, String name, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
               CircleAvatar(
                maxRadius: 20,
                backgroundImage: image,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(name, style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16), textScaleFactor: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("14 min", style: GoogleFonts.inter(fontSize: 10, color: AppHexColor("#E3E5EA")), textScaleFactor: 1),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.star,
                    color: AppHexColor("#FA4A0C"),
                    size: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text("5.0", style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 12), textScaleFactor: 1),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(value, style: GoogleFonts.inter(fontSize: 12), textScaleFactor: 1),
          ),
        ],
      ),
    );
  }
}

final List<String> imgList = [
  '8.png',
  '8.png',
  '8.png',
];
