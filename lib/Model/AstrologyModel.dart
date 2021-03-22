class AstrologyModel {
  String date;
  String explanation;
  String hdUrl;
  String mediaType;
  String serviceVersion;
  String title;
  String url;

  AstrologyModel(
      {this.date,
        this.explanation,
        this.hdUrl,
        this.mediaType,
        this.serviceVersion,
        this.title,
        this.url});

  AstrologyModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    explanation = json['explanation'];
    hdUrl = json['hdurl'];
    mediaType = json['media_type'];
    serviceVersion = json['service_version'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['explanation'] = this.explanation;
    data['hdurl'] = this.hdUrl;
    data['media_type'] = this.mediaType;
    data['service_version'] = this.serviceVersion;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}
