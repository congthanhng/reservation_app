class ReviewModel {
  int? rating;
  String? comment;

  ReviewModel({this.rating, this.comment});

  Map<String, dynamic> toJson() => {
    'rating': rating,
    'comment': comment,
  };

  static ReviewModel fromJson(Map<String, dynamic> json) =>
      ReviewModel(comment: json['comment'], rating: json['rating']);
}
