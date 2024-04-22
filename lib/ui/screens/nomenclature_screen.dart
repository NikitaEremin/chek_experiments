import 'package:flutter/material.dart';
import '../constants.dart';

class NomenclatureScreen extends StatelessWidget {
  const NomenclatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Товары', style: TextStyle(color: theme.colorScheme.onPrimary),),
        surfaceTintColor: Colors.transparent,
        backgroundColor: theme.colorScheme.surfaceTint,
      ),
      body: Column(
        children: [
          const SizedBox(height: 14),
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
          ListOfProducts(),
        ],
      ),
    );
  }
}

class ListOfProducts extends StatelessWidget {
  ListOfProducts({super.key});

  final List<Product> _products = [
    Product(id: 0, name: 'Энергетик', price: 5.2),
    Product(id: 1, name: 'Вода', price: 1.45),
    Product(id: 2, name: 'Хлеб', price: 1.02),
    Product(id: 3, name: 'Энергетик', price: 5.2),
    Product(id: 4, name: 'Вода', price: 1.45),
    Product(id: 5, name: 'Хлеб', price: 1.02),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            leading: SizedBox(
              width: 40,
              child: Image.asset(Constants.darkLogo),
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

//TODO вынести в модели
class Product {
  int id;
  String name;
  double price;
  Image? image;

  Product({required this.id, required this.name, required this.price});
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
              icon: const Icon(Icons.document_scanner),
            ),
          ),
        ],
      ),
    );
  }
}
