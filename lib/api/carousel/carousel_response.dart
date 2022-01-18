/// data : [{"id_carousel":"221","img_carousel":"crsl-1608112606.png"},{"id_carousel":"222","img_carousel":"crsl-1608112620.png"},{"id_carousel":"223","img_carousel":"crsl-1608112634.png"}]
/// status : 200
/// response : "Data Ditemukan"

class CarouselResponse {
  CarouselResponse({
      List<Data>? data, 
      int? status, 
      String? response,}){
    _data = data;
    _status = status;
    _response = response;
}

  CarouselResponse.fromJson(dynamic json) {
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

/// id_carousel : "221"
/// img_carousel : "crsl-1608112606.png"

class Data {
  Data({
      String? idCarousel, 
      String? imgCarousel,}){
    _idCarousel = idCarousel;
    _imgCarousel = imgCarousel;
}

  Data.fromJson(dynamic json) {
    _idCarousel = json['id_carousel'];
    _imgCarousel = json['img_carousel'];
  }
  String? _idCarousel;
  String? _imgCarousel;

  String? get idCarousel => _idCarousel;
  String? get imgCarousel => _imgCarousel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_carousel'] = _idCarousel;
    map['img_carousel'] = _imgCarousel;
    return map;
  }

}