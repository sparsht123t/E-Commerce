import 'dart:convert';

import 'package:e_commerce/models/catalog.dart';
import 'package:e_commerce/widgets/home_widget/catalog-list.dart';
import 'package:e_commerce/widgets/home_widget/catalog_header.dart';
import 'package:e_commerce/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future loadData() async {
   

    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    Map<String, dynamic> jsonData = jsonDecode(catalogJson);

    var productsData = jsonData["products"];
    CatalogModel.items =
        List.from(productsData).map((e) => Item.fromJson(e)).toList();
  
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.canvasColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
