import 'package:flutter/cupertino.dart';

import '../data/models/product.dart';
import '../ui/constants.dart';

class NomenclatureProvider extends ChangeNotifier{


  final List<Product> _products = [
    Product(name: 'Энергетик', price: 5.2, image: Image.asset(Constants.energy), gtin: '8001505002119'),
    Product(name: 'Вода', price: 1.45, image: Image.asset(Constants.water), gtin: '4620770580272'),
    Product(name: 'Хлеб', price: 1.02, image: Image.asset(Constants.bread), gtin: '4603334001529'),
  ];

  List<Product> get products => _products;


  void add(Product product){
    _products.add(product);
    notifyListeners();
  }

  void edit(int index, Product product){
    _products.removeAt(index);
    _products.insert(index, product);
    notifyListeners();
  }

  void delete(Product product) {
    _products.remove(product);
    notifyListeners();
  }

}