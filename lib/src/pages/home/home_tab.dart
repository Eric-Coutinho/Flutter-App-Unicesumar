import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/custom_colors.dart';
import 'package:flutter_application_1/src/model/item_model.dart';
import 'package:flutter_application_1/src/pages/home/components/item_title.dart';
import 'package:flutter_application_1/src/pages/home/components/titulo_categoria.dart';
// ignore: library_prefixes
import 'package:flutter_application_1/src/config/app_data.dart' as appData;
import 'package:flutter_application_1/src/pages/widgets/app_title.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String categoriaSelecionada = "Todas";

  List<ItemModel> products = [];

  GlobalKey<CartIconKey> globalKeyCartItems = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCardAnimation;

  void itemSelectedCartAnimation(GlobalKey gkImage) {
    runAddToCardAnimation(gkImage);
  }

  @override
  void initState() {
    super.initState();
    products.addAll(appData.items);
  }

  @override
  Widget build(BuildContext context) {
    return AddToCartAnimation(
      cartKey: globalKeyCartItems,
      createAddToCartAnimation: (addToCardAnimationMethod) {
        runAddToCardAnimation = addToCardAnimationMethod;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const AppTitle(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 17),
              child: AddToCartIcon(
                key: globalKeyCartItems,
                badgeOptions: BadgeOptions(
                  backgroundColor: CustomColors.customizedContrastColor,
                  foregroundColor: Colors.white,
                ),
                icon: Align(
                  alignment: const Alignment(-0.2, -0.1),
                  child: Icon(Icons.shopping_cart,
                      color: CustomColors.customizedAppColor),
                ),
              ),
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
                    borderSide:
                        const BorderSide(width: 0, style: BorderStyle.none),
                  ),
                ),
              ),
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
                            categoriaSelecionada =
                                appData.categorias[index].name;
                            products = [];
                            var productCategory = appData.items.where((p) =>
                                p.category.id == appData.categorias[index].id);
                            products.addAll(productCategory);
                          });
                        },
                        categoria: appData.categorias[index].name,
                        isSelected: appData.categorias[index].name == categoriaSelecionada);
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
                    childAspectRatio: (9 / 12)),
                itemCount: products.length,
                itemBuilder: (_, index) {
                  return ItemTitle(
                    item: products[index],
                    cartAnimationFunction: itemSelectedCartAnimation,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
