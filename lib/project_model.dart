class ProjectModel {
  String title;
  String logo;
  String url;
  List<String> imageArray;

  ProjectModel({this.title, this.logo, this.url, this.imageArray});

  ProjectModel.fromJson(Map<String, dynamic> json) {
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
}