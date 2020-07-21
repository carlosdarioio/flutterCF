import 'package:flutter/material.dart';
import 'package:flutter_getjsonlist/model/products_model.dart';

import 'package:http/http.dart' as http;

//2020 07 09 service lo separaste para post/get
//pondiendo NewsService de manera global ocupas ponerlo en el widget padre
//osea ponerlo en main.dart
//http://newsapi.org/v2/top-headlines?country=us&apiKey=1e30a7c3c9bd4500aebf0da2193933a7
final _URL_NEWS = 'http://service.mall504.com/NopService.svc';
//final _URL_NEWS = 'onlinependiente';
//final _APIKEY = '1e30a7c3c9bd4500aebf0da2193933a7';

class ProductsService with ChangeNotifier {
  List<ProductsModel> headlines = []; //headlines
  List<ProductsModel> carrito = []; //headlines
  List<ProductsModel> listaArticulos = []; //headlines
  String _selectedCategory = 'business';
//business entertainment general health science sports technology

  Map<String, List<ProductsModel>> categoryArticles = {};

  ProductsService() {
    this.getCategoriasPrincipal();
    //this.getArticulosxCarrito();
    //this.getArticlesByCategory('1');
  }

  get selectedCategory => this._selectedCategory;
  set selectedCategory(String valor) {
    this._selectedCategory = valor;
    this.getArticlesByCategory(valor);
    notifyListeners();
  }

  List<ProductsModel> get getArticulosCategoriaSeleccionada =>
      this.categoryArticles[this.selectedCategory];

  //get json en lista
  getCategoriasPrincipal() async {
    print('ZCargando headlines...');

    //llamada hhtp paa obtener la informcion
    final url = '$_URL_NEWS/GetProducts/';
    //PETICION HTTP
    final resp = await http.get(url);
    // get json to class
    final newsResponse = productsModelFromJson(resp.body);
    //añadiendo articulos a a lista headlines
    this.headlines.addAll(newsResponse);
    //actualizando
    notifyListeners();
  }

  //get carrito en lista
  getArticulosxCarrito(String id) async {
    print(
        'ZCargando carrito...'); //pendiente crear servicio ahorita lo aras optendiendo art x cat alola

    //llamada hhtp paa obtener la informcion
    final url = '$_URL_NEWS/GetProductsXcat/$id';
    //PETICION HTTP
    final resp = await http.get(url);
    // get json to class
    final newsResponse = productsModelFromJson(resp.body);
    //añadiendo articulos a a lista headlines
    this.carrito.addAll(newsResponse);
    //actualizando
    notifyListeners();
  }

  //este seria get sub cats por cat id!!
  getArticlesByCategory(String xcategory) async {
    //llamada hhtp paa obtener la informcion

    /*if (this.listaArticulos.length > 0) {
      return this.listaArticulos;
    }*/

    final url = '$_URL_NEWS/GetProductsXcat/$xcategory';
    //PETICION HTTP
    final resp = await http.get(url);
    // get json to class
    final newsResponse = productsModelFromJson(resp.body);
    listaArticulos = [];
    this.listaArticulos.addAll(newsResponse);

    notifyListeners();
  }
}
