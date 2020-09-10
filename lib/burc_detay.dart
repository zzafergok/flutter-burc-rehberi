import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_liste.dart';
import 'models/burc.dart';

class BurcDetay extends StatelessWidget {
  int gelenIndex;
  Burc secilenBurc;

  BurcDetay(this.gelenIndex);

  @override
  Widget build(BuildContext context) {
    secilenBurc = BurcListe.tumBurclar[gelenIndex];
    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor: Colors.green,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("images/" + secilenBurc.burcBuyukResim,
                  fit: BoxFit.cover),
              centerTitle: true,
              title: Text(secilenBurc.burcAdi + "Burcu ve Özellikleri"),
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
