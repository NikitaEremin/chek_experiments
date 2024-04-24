import 'package:chek_experiments/ui/screens/detail_product_screen.dart';
import 'package:chek_experiments/ui/widgets/slide_route.dart';
import 'package:flutter/material.dart';
import '../../data/models/product.dart';
import '../constants.dart';

class NomenclatureScreen extends StatelessWidget {
  const NomenclatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);

    return Center(
      child: Column(
        children: [
          const SizedBox(height: 50),
          SearchWidget(theme: theme, screenSize: screenSize),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Категории',
                style: theme.textTheme.headlineSmall,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const CategoryCarousel(),
          const SizedBox(height: 8),
          const ListOfProducts(),
        ],
      ),
    );
  }
}

class ListOfProducts extends StatefulWidget {
  const ListOfProducts({super.key});

  @override
  State<ListOfProducts> createState() => _ListOfProductsState();
}

class _ListOfProductsState extends State<ListOfProducts> {
  //TODO вынести
  final List<Product> _products = [
    Product(name: 'Энергетик', price: 5.2, image: Image.asset(Constants.energy), gtin: '8001505002119'),
    Product(name: 'Вода', price: 1.45, image: Image.asset(Constants.water), gtin: '4620770580272'),
    Product(name: 'Хлеб', price: 1.02, image: Image.asset(Constants.bread), gtin: '4603334001529'),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.of(context).push(createRoute(DetailProductScreen(product: _products[index],)));
            },
            leading: SizedBox(
              width: 40,
              height: 40,
              child: _products[index].image,
            ),
            title: Text(_products[index].name),
            subtitle: Text(_products[index].price.toString()),
            trailing: const Icon(Icons.chevron_right),
          );
        },
      ),
    );
  }
}



class CategoryCarousel extends StatefulWidget {
  const CategoryCarousel({super.key});

  @override
  State<CategoryCarousel> createState() => _CategoryCarouselState();
}

class _CategoryCarouselState extends State<CategoryCarousel> {
  int selectedCategory = 0;
  final List<String> categories = [
    'Категория1',
    'Категория2',
    'Категория3',
    'Категория4',
    'Категория5',
    'Категория6',
    'Категория7',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16),
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 4,
        children: List<Widget>.generate(categories.length, (index) {
          return ChoiceChip(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            label: Text(categories[index]),
            selected: selectedCategory == index,
            onSelected: (selected) {
              setState(() {
                selectedCategory = selected ? index : -1;
              });
            },
          );
        }),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.theme,
    required this.screenSize,
  });

  final ThemeData theme;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    fillColor: theme.colorScheme.surfaceVariant,
                    filled: true,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12)),
                    hintText: 'Поиск в номенклатуре'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              style: IconButton.styleFrom(
                  minimumSize: const Size(48, 48),
                  backgroundColor: theme.colorScheme.surfaceVariant,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: () {},
              icon: const Icon(Icons.qr_code_scanner),
            ),
          ),
        ],
      ),
    );
  }
}
