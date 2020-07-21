import 'package:flutter/material.dart';
import 'package:flutter_getjsonlist/model/home_cats_model.dart';

import 'package:http/http.dart' as http;

//2020 07 09 service lo separaste para post/get
final _URL_NEWS = 'http://service.mall504.com/NopService.svc';
//final _URL_NEWS = 'onlinependiente';
//final _APIKEY = '1e30a7c3c9bd4500aebf0da2193933a7';

class HomeCategoriesService with ChangeNotifier {
  List<HomeCategorias> headlines = []; //headlines
  List<HomeCategorias> carrito = []; //getsubCategories
  String _selectedCategory = 'business';
//business entertainment general health science sports technology

  Map<String, List<HomeCategorias>> categoryArticles = {};

  HomeCategoriesService() {
    this.getCategoriasPrincipal();
    //this.getArticulosxCarrito("1");
  }

  get selectedCategory => this._selectedCategory;
  set selectedCategory(String valor) {
    this._selectedCategory = valor;
    notifyListeners();
  }

  List<HomeCategorias> get getArticulosCategoriaSeleccionada =>
      this.categoryArticles[this.selectedCategory];

  //get json en lista
  getCategoriasPrincipal() async {
    print('Cargando headlines...gg');

    //llamada hhtp paa obtener la informcion
    final url = '$_URL_NEWS/GetCategories/';
    //PETICION HTTP
    final resp = await http.get(url);
    // get json to class
    final newsResponse = homeCategoriasFromJson(resp.body);
    //añadiendo articulos a a lista headlines
    this.headlines.addAll(newsResponse);
    //actualizando
    notifyListeners();
  }

  //getsubCategories
  getArticulosxCarrito(String id) async {
    print(
        'Cargando carrito...$id'); //pendiente crear servicio ahorita lo aras optendiendo art x cat alola

    //llamada hhtp paa obtener la informcion
    final url = '$_URL_NEWS/getsubCategories/$id';
    //PETICION HTTP
    final resp = await http.get(url);
    // get json to class
    final newsResponse = homeCategoriasFromJson(resp.body);
    //añadiendo articulos a a lista headlines
    this.carrito = [];
    this.carrito.addAll(newsResponse);
    //actualizando
    notifyListeners();
  }
}
