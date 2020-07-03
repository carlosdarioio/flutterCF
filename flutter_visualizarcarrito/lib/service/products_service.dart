import 'package:flutter/material.dart';
import 'package:flutter_getjsonlist/model/products_model.dart';

import 'package:http/http.dart' as http;

//pondiendo NewsService de manera global ocupas ponerlo en el widget padre
//osea ponerlo en main.dart
//http://newsapi.org/v2/top-headlines?country=us&apiKey=1e30a7c3c9bd4500aebf0da2193933a7
final _URL_NEWS = 'http://192.168.0.18/CfService/NopService.svc';
//final _URL_NEWS = 'onlinependiente';
//final _APIKEY = '1e30a7c3c9bd4500aebf0da2193933a7';

class ProductsService with ChangeNotifier {
  List<ProductsModel> headlines = []; //headlines
  List<ProductsModel> carrito = []; //headlines
  String _selectedCategory = 'business';
//business entertainment general health science sports technology

  Map<String, List<ProductsModel>> categoryArticles = {};

  ProductsService() {
    this.getCategoriasPrincipal();
    this.getArticulosxCarrito();
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
    print('Cargando headlines...');

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
  getArticulosxCarrito() async {
    print(
        'Cargando carrito...'); //pendiente crear servicio ahorita lo aras optendiendo art x cat alola

    //llamada hhtp paa obtener la informcion
    final url = '$_URL_NEWS/GetProductsXcat/2';
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

    if (this.categoryArticles[xcategory].length > 0) {
      return this.categoryArticles[xcategory];
    }

    final url = '$_URL_NEWS/GetProductsXcat/$xcategory';
    //PETICION HTTP
    final resp = await http.get(url);
    // get json to class
    final newsResponse = productsModelFromJson(resp.body);

    this.categoryArticles[xcategory].addAll(newsResponse);

    notifyListeners();
  }
}
