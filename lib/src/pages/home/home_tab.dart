import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/custom_colors.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_application_1/src/pages/home/components/item_title.dart';
import 'package:flutter_application_1/src/pages/home/components/titulo_categoria.dart';
// ignore: library_prefixes
import 'package:flutter_application_1/src/config/app_data.dart' as appData;

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> categorias = [
    'Frutas',
    'Verduras',
    'Temperos',
    'Cereais',
    'Grãos'
  ];

  String categoriaSelecionada = "Verduras";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text.rich(TextSpan(
          style: const TextStyle(fontSize: 25),
          children: [
            TextSpan(
                text: 'Hortifruti ',
                style: TextStyle(
                    color: CustomColors.customizedAppColor,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'Comunitária',
                style: TextStyle(color: CustomColors.customizedContrastColor)),
          ],
        )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 17),
            child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: -14, end: -8),
                badgeContent: const Text(
                  "4",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                badgeStyle: badges.BadgeStyle(
                    badgeColor: CustomColors.customizedContrastColor),
                child: Icon(Icons.shopping_cart,
                    color: CustomColors.customizedAppColor)),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
                decoration: InputDecoration(
                    isDense: true,
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Faça sua pesquisa aqui...",
                    hintStyle:
                        TextStyle(color: Colors.grey.shade400, fontSize: 16),
                    prefixIcon: Icon(
                      Icons.search,
                      color: CustomColors.customizedContrastColor,
                      size: 24,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)))),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25),
            height: 40,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return TituloCategoria(
                    onPressed: () {
                      setState(() {
                        categoriaSelecionada = appData.categorias[index];
                      });
                    },
                    categoria: appData.categorias[index],
                    isSelected:
                        appData.categorias[index] == categoriaSelecionada,
                  );
                },
                separatorBuilder: (_, index) => const SizedBox(width: 10),
                itemCount: appData.categorias.length),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: (9 / 12)
              ),
              itemCount: appData.items.length,
              itemBuilder: (_, index) {
                return ItemTitle(item: appData.items[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
