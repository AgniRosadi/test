import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_agni/helper/constant/settings.dart';
import 'package:test_agni/helper/ui/app_hex_color.dart';

class BuyNowPage extends StatelessWidget {
  const BuyNowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _BuyNowContent(),
    );
  }
}

class _BuyNowContent extends StatefulWidget {
  const _BuyNowContent({Key? key}) : super(key: key);

  @override
  _BuyNowContentState createState() => _BuyNowContentState();
}

class _BuyNowContentState extends State<_BuyNowContent> {
  final _catatan1Controller = TextEditingController();
  final _catatan2Controller = TextEditingController();
  final _catatan3Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _catatan2Controller.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topSection(context),
              _listProduk(const AssetImage(Settings.assetsImagesDir + "8.png"), "Tas Guci", "2"),
              const SizedBox(
                height: 20,
              ),
              _notesProduk("Catatan Item", _catatan1Controller),
              const SizedBox(
                height: 20,
              ),
              _listProduk(const AssetImage(Settings.assetsImagesDir + "6.png"), "Tas Eiger", "1"),
              const SizedBox(
                height: 20,
              ),
              _notesProduk("Catatan Item", _catatan2Controller),
              _notesProduk("Catatan Pesanan", _catatan3Controller),
              _payment()
            ],
          ),
        ),
      ),
    );
  }

  Widget _topSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
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
            child: Text("Checkout", style: GoogleFonts.inter(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16), textScaleFactor: 1),
          ),
        ],
      ),
    );
  }

  Widget _listProduk(AssetImage image, String name, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            child: ClipRRect(
              child: Image(image: image),
              borderRadius: BorderRadius.circular(50.0),
            ),
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
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Text("Rp 75.000",
                    style: GoogleFonts.inter(color: AppHexColor("#9EC4F8"), fontWeight: FontWeight.bold, fontSize: 14), textScaleFactor: 1),
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blue,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(
                          onTap: () {},
                          child: Text("-",
                              style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13), textScaleFactor: 1)),
                    ),
                    Text(value, style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13), textScaleFactor: 1),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: InkWell(
                          onTap: () {},
                          child: Text("+",
                              style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13), textScaleFactor: 1)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blue,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.pen,
                      color: Colors.white,
                      size: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("Catatan",
                          style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13), textScaleFactor: 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _notesProduk(String title, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(title, style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16), textScaleFactor: 1),
          ),
          TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: "Ketik disini ..",
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
              focusColor: Colors.black,
            ),
            minLines: 2,
            maxLines: 5,
          )
        ],
      ),
    );
  }

  Widget _payment() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text("Detail Pembayaran", style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.bold), textScaleFactor: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text("Tas Gucci", style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.bold), textScaleFactor: 1),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("(Qty. 1)", style: GoogleFonts.inter(fontSize: 13), textScaleFactor: 1),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("Rp 75.000", style: GoogleFonts.inter(fontSize: 13), textScaleFactor: 1),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text("Tas Eiger", style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.bold), textScaleFactor: 1),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("(Qty. 1)", style: GoogleFonts.inter(fontSize: 13), textScaleFactor: 1),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("Rp 75.000", style: GoogleFonts.inter(fontSize: 13), textScaleFactor: 1),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("Ongkos Kirim", style: GoogleFonts.inter(fontSize: 13), textScaleFactor: 1),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("Rp 10.000", style: GoogleFonts.inter(fontSize: 13), textScaleFactor: 1),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          height: 1,
          color: Colors.black,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("Sub Total", style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.bold), textScaleFactor: 1),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("Rp 450.000", style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.bold), textScaleFactor: 1),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.blue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text("Waktu Pengantaran",
                      style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold), textScaleFactor: 1),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FaIcon(
                    FontAwesomeIcons.angleRight,
                    color: Colors.white,
                  ),
                )
              ],
            )),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.blue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text("Alamat Pengiriman",
                      style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold), textScaleFactor: 1),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FaIcon(
                    FontAwesomeIcons.angleRight,
                    color: Colors.white,
                  ),
                )
              ],
            )),
        const SizedBox(
          height: 20,
        ),
        Card(
          elevation: 5,
          shadowColor: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Text("Tolong pastikan semua pesanan anda sudah benar dan tidak kurang.",
                style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.bold), textAlign: TextAlign.center, textScaleFactor: 1),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Text("Bayar Sekarang",
                    style: GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold), textScaleFactor: 1),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
