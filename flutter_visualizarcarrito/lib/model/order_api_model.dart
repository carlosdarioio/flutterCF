import 'dart:convert';

class OrderApi {
  //One instance, needs factory
  static OrderApi _instance;
  factory OrderApi() => _instance ??= new OrderApi._();
  OrderApi._();
  //

  //String account = 'johanacct1';
  //List<Categorias> actores = new List();
  Client cliente = new Client();
  List<OrderItem> actores3 = new List();

  // cliente.OrderItem = new OrderItem();
  Client clientFromJson(String str) => Client.fromJson(json.decode(str));

  String clientToJson(Client data) => json.encode(data.toJson());
}

class Client {
  Client({
    this.billingAddressId,
    this.cardCvv2,
    this.cardExpirationMonth,
    this.cardExpirationYear,
    this.cardName,
    this.cardNumber,
    this.cardType,
    this.catid,
    this.customOrderNumber,
    this.customerId,
    this.email,
    this.id,
    this.orderItem,
    this.orderTotal,
    this.pickUpInStore,
    this.shippingAddressId,
    this.storeId,
  });

  String billingAddressId;
  String cardCvv2;
  String cardExpirationMonth;
  String cardExpirationYear;
  String cardName;
  String cardNumber;
  String cardType;
  String catid;
  String customOrderNumber;
  String customerId;
  String email;
  String id;
  List<OrderItem> orderItem;
  String orderTotal;
  String pickUpInStore;
  String shippingAddressId;
  String storeId;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        billingAddressId: json["BillingAddressId"],
        cardCvv2: json["CardCvv2"],
        cardExpirationMonth: json["CardExpirationMonth"],
        cardExpirationYear: json["CardExpirationYear"],
        cardName: json["CardName"],
        cardNumber: json["CardNumber"],
        cardType: json["CardType"],
        catid: json["Catid"],
        customOrderNumber: json["CustomOrderNumber"],
        customerId: json["CustomerId"],
        email: json["Email"],
        id: json["Id"],
        orderItem: List<OrderItem>.from(
            json["OrderItem"].map((x) => OrderItem.fromJson(x))),
        orderTotal: json["OrderTotal"],
        pickUpInStore: json["PickUpInStore"],
        shippingAddressId: json["ShippingAddressId"],
        storeId: json["StoreId"],
      );

  Map<String, dynamic> toJson() => {
        "BillingAddressId": billingAddressId,
        "CardCvv2": cardCvv2,
        "CardExpirationMonth": cardExpirationMonth,
        "CardExpirationYear": cardExpirationYear,
        "CardName": cardName,
        "CardNumber": cardNumber,
        "CardType": cardType,
        "Catid": catid,
        "CustomOrderNumber": customOrderNumber,
        "CustomerId": customerId,
        "Email": email,
        "Id": id,
        "OrderItem": List<dynamic>.from(orderItem.map((x) => x.toJson())),
        "OrderTotal": orderTotal,
        "PickUpInStore": pickUpInStore,
        "ShippingAddressId": shippingAddressId,
        "StoreId": storeId,
      };
}

class OrderItem {
  OrderItem({
    this.productId,
    this.quantity,
  });

  int productId;
  int quantity;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        productId: json["ProductId"],
        quantity: json["Quantity"],
      );

  Map<String, dynamic> toJson() => {
        "ProductId": productId,
        "Quantity": quantity,
      };
}
