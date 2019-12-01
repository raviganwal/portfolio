import 'dart:convert';

ProjectModel projectModelFromJson(String str) =>
    ProjectModel.fromJson(json.decode(str));

String projectModelToJson(ProjectModel data) => json.encode(data.toJson());

class ProjectModel {
  List<Project> androidProject;
  List<Project> iosProject;
  List<Project> phpProject;

  ProjectModel({
    this.androidProject,
    this.iosProject,
    this.phpProject,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      ProjectModel(
        androidProject: json["androidProject"] == null ? null : List<
            Project>.from(
            json["androidProject"].map((x) => Project.fromJson(x))),
        iosProject: json["iosProject"] == null ? null : List<Project>.from(
            json["iosProject"].map((x) => Project.fromJson(x))),
        phpProject: json["phpProject"] == null ? null : List<Project>.from(
            json["phpProject"].map((x) => Project.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {
        "androidProject": androidProject == null ? null : List<dynamic>.from(
            androidProject.map((x) => x.toJson())),
        "iosProject": iosProject == null ? null : List<dynamic>.from(
            iosProject.map((x) => x.toJson())),
        "phpProject": phpProject == null ? null : List<dynamic>.from(
            phpProject.map((x) => x.toJson())),
      };
}

class Project {
  String title;
  String logo;
  String url;
  List<String> imageArray;

  Project({
    this.title,
    this.logo,
    this.url,
    this.imageArray,
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      Project(
        title: json["title"] == null ? null : json["title"],
        logo: json["logo"] == null ? null : json["logo"],
        url: json["url"] == null ? null : json["url"],
        imageArray: json["imageArray"] == null ? null : List<String>.from(
            json["imageArray"].map((x) => x)),
      );

  Map<String, dynamic> toJson() =>
      {
        "title": title == null ? null : title,
        "logo": logo == null ? null : logo,
        "url": url == null ? null : url,
        "imageArray": imageArray == null ? null : List<dynamic>.from(
            imageArray.map((x) => x)),
      };
}
