class RecipeResult {
  int id;
  String title;
  int readyInMinutes;
  int servings;
  String sourceUrl;
  int openLicense;
  String image;

  RecipeResult(
      {this.id,
      this.title,
      this.readyInMinutes,
      this.servings,
      this.sourceUrl,
      this.openLicense,
      this.image});

  RecipeResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    readyInMinutes = json['readyInMinutes'];
    servings = json['servings'];
    sourceUrl = json['sourceUrl'];
    openLicense = json['openLicense'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['readyInMinutes'] = this.readyInMinutes;
    data['servings'] = this.servings;
    data['sourceUrl'] = this.sourceUrl;
    data['openLicense'] = this.openLicense;
    data['image'] = this.image;
    return data;
  }
}
