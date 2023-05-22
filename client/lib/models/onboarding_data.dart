class UnboardingContent {
  String image;
  String title;
  String description;

  UnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<UnboardingContent> contents = [
  UnboardingContent(
      title: 'one click logistic service with ease',
      image: 'assets/delivery_truck_1.svg',
      description:
          "simply dummy text of the printing and typesetting industry. "
          "lorem Ipsum has been the industry's standard dummy text ever since"
          "the 1500s, when an unknwn printer took a galley of type and scrambled it"),
  UnboardingContent(
      title: 'Book and pay directly from your smart phone',
      image: 'assets/people_location.svg',
      description:
          "simply dummy text of the printing and typesetting industry. "
          "lorem Ipsum has been the industry's standard dummy text ever since"
          "the 1500s, when an unknwn printer took a galley of type and scrambled it"),
  UnboardingContent(
      title: 'Track your deliveries from your comfort zone',
      image: 'assets/person_location.svg',
      description:
          "simply dummy text of the printing and typesetting industry. "
          "lorem Ipsum has been the industry's standard dummy text ever since"
          "the 1500s, when an unknwn printer took a galley of type and scrambled it"),
];
