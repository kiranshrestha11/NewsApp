class NewsCategoryModel {
  final String categoryName;
  final String imgUrl;

  NewsCategoryModel({
    required this.categoryName,
    required this.imgUrl,
  });
}

final NewsCategoryModel technology = NewsCategoryModel(
    categoryName: "Technology",
    imgUrl:
        "https://trendinnovationsholding.com/wp-content/uploads/2022/02/nathan-dumlao-LYn1Dyqqukc-unsplash-3-427x319.jpg");

final NewsCategoryModel sports = NewsCategoryModel(
    categoryName: "Sports",
    imgUrl:
        "https://www.activateuts.com.au/wp-content/uploads/2022/02/UTSSport_Hero_TEST_Landscape-1536x1143.jpg");
final NewsCategoryModel business = NewsCategoryModel(
    categoryName: "Business",
    imgUrl:
        "https://previews.123rf.com/images/maxkabakov/maxkabakov1310/maxkabakov131000477/22571921-news-concept-pixelated-words-business-news-on-digital-background-3d-render.jpg");
final NewsCategoryModel health = NewsCategoryModel(
    categoryName: "Health",
    imgUrl:
        "https://cdn1.sph.harvard.edu/wp-content/uploads/sites/56/2012/10/health_effects.jpg");
final NewsCategoryModel general = NewsCategoryModel(
    categoryName: "General",
    imgUrl:
        "https://www.mercurynews.com/wp-content/uploads/2018/04/sjm-l-oped-chase-0410-2.jpg?w=467");
final NewsCategoryModel entertainment = NewsCategoryModel(
    categoryName: "Entertainment",
    imgUrl:
        "https://www.e-spincorp.com/wp-content/uploads/2017/10/industry-media-entertainment.jpg");
final NewsCategoryModel science = NewsCategoryModel(
    categoryName: "Science",
    imgUrl:
        "https://cdn.the-scientist.com/assets/articleNo/69216/aImg/43641/science-article-m.png");

final List<NewsCategoryModel> categoryList = [
  general,
  business,
  technology,
  sports,
  health,
  entertainment,
  science
];
