/// data : [{"id_help":"3","name_help":"Order","desc_help":"this is how to order","image_help":"1588142781.png"},{"id_help":"4","name_help":"Shipping","desc_help":"this is how to ship","image_help":"1588142799.png"}]
/// status : 0
/// response : "Data Ditemukan"

class HelpResponse {
  HelpResponse({
      List<Data>? data, 
      int? status, 
      String? response,}){
    _data = data;
    _status = status;
    _response = response;
}

  HelpResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _status = json['status'];
    _response = json['response'];
  }
  List<Data>? _data;
  int? _status;
  String? _response;

  List<Data>? get data => _data;
  int? get status => _status;
  String? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['response'] = _response;
    return map;
  }

}

/// id_help : "3"
/// name_help : "Order"
/// desc_help : "this is how to order"
/// image_help : "1588142781.png"

class Data {
  Data({
      String? idHelp, 
      String? nameHelp, 
      String? descHelp, 
      String? imageHelp,}){
    _idHelp = idHelp;
    _nameHelp = nameHelp;
    _descHelp = descHelp;
    _imageHelp = imageHelp;
}

  Data.fromJson(dynamic json) {
    _idHelp = json['id_help'];
    _nameHelp = json['name_help'];
    _descHelp = json['desc_help'];
    _imageHelp = json['image_help'];
  }
  String? _idHelp;
  String? _nameHelp;
  String? _descHelp;
  String? _imageHelp;

  String? get idHelp => _idHelp;
  String? get nameHelp => _nameHelp;
  String? get descHelp => _descHelp;
  String? get imageHelp => _imageHelp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_help'] = _idHelp;
    map['name_help'] = _nameHelp;
    map['desc_help'] = _descHelp;
    map['image_help'] = _imageHelp;
    return map;
  }

}