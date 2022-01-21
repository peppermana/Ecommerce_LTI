/// id_product : "27"
/// name_product : "Beat 2009"
/// name_category : "Motor Bekas Matic murah"
/// desc_product : "Apik"
/// image_product : "prdct1607920554.png"
/// stock_product : "1"
/// price_product : "400000"
/// status : 200
/// response : "Data ada"

class DetailProductResponse {
  DetailProductResponse({
      String? idProduct, 
      String? nameProduct, 
      String? nameCategory, 
      String? descProduct, 
      String? imageProduct, 
      String? stockProduct, 
      String? priceProduct, 
      int? status, 
      String? response,}){
    _idProduct = idProduct;
    _nameProduct = nameProduct;
    _nameCategory = nameCategory;
    _descProduct = descProduct;
    _imageProduct = imageProduct;
    _stockProduct = stockProduct;
    _priceProduct = priceProduct;
    _status = status;
    _response = response;
}

  DetailProductResponse.fromJson(dynamic json) {
    _idProduct = json['id_product'];
    _nameProduct = json['name_product'];
    _nameCategory = json['name_category'];
    _descProduct = json['desc_product'];
    _imageProduct = json['image_product'];
    _stockProduct = json['stock_product'];
    _priceProduct = json['price_product'];
    _status = json['status'];
    _response = json['response'];
  }
  String? _idProduct;
  String? _nameProduct;
  String? _nameCategory;
  String? _descProduct;
  String? _imageProduct;
  String? _stockProduct;
  String? _priceProduct;
  int? _status;
  String? _response;

  String? get idProduct => _idProduct;
  String? get nameProduct => _nameProduct;
  String? get nameCategory => _nameCategory;
  String? get descProduct => _descProduct;
  String? get imageProduct => _imageProduct;
  String? get stockProduct => _stockProduct;
  String? get priceProduct => _priceProduct;
  int? get status => _status;
  String? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_product'] = _idProduct;
    map['name_product'] = _nameProduct;
    map['name_category'] = _nameCategory;
    map['desc_product'] = _descProduct;
    map['image_product'] = _imageProduct;
    map['stock_product'] = _stockProduct;
    map['price_product'] = _priceProduct;
    map['status'] = _status;
    map['response'] = _response;
    return map;
  }

}