class AndroidProjectModel {
  List<Data> data;

  AndroidProjectModel({this.data});

  AndroidProjectModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'AndroidProjectModel{data: $data}';
  }


}

class Data {
  String title;
  String logo;
  String url;
  List<String> imageArray;

  Data({this.title, this.logo, this.url, this.imageArray});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    logo = json['logo'];
    url = json['url'];
    imageArray = json['imageArray'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['logo'] = this.logo;
    data['url'] = this.url;
    data['imageArray'] = this.imageArray;
    return data;
  }

  @override
  String toString() {
    return 'Data{title: $title, logo: $logo, url: $url, imageArray: $imageArray}';
  }


}