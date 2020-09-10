import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_liste.dart';
import 'models/burc.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  int gelenIndex;

  BurcDetay(this.gelenIndex);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Burc secilenBurc;
  Color baskinRenk;
  PaletteGenerator paletteGenerator;

  @override
  void initState() {
    super.initState();
    secilenBurc = BurcListe.tumBurclar[widget.gelenIndex];
    baskinRengiBul();
  }

  void baskinRengiBul() {
    Future<PaletteGenerator> fPaletGenerator =
        PaletteGenerator.fromImageProvider(
            AssetImage("images/" + secilenBurc.burcBuyukResim));

    fPaletGenerator.then((value) {
      paletteGenerator = value;

      setState(() {
        baskinRenk = paletteGenerator.dominantColor.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor: baskinRenk != null ? baskinRenk : Colors.green,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("images/" + secilenBurc.burcBuyukResim,
                  fit: BoxFit.cover),
              centerTitle: true,
              title: Text(
                secilenBurc.burcAdi + " Burcu ve Özellikleri",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Text(
                secilenBurc.burcDetay,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
