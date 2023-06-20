class onBoardContent {
final String image,title1,title2,description;

onBoardContent({
  required this.image,
  required this.title1,
  required this.title2,
  required this.description,
});

}

final List<onBoardContent>onBoard_content = [
    onBoardContent(
        image: 'assets/images/onboard1.jpg',
        title1: 'choose your trainer',
        title2: 'Robert Blazevic',
        description: 'Multi-year judo contestant and a member of the croatian judo team, winner of many national and international prizes.',
    ),
  onBoardContent(
    image: 'assets/images/onboard2.jpg',
    title1: 'choose your trainer',
    title2: 'Robert Blazevic',
    description: 'Multi-year judo contestant and a member of the croatian judo team, winner of many national and international prizes.',
  ),
  onBoardContent(
    image: 'assets/images/w2.jpg',
    title1: 'choose your trainer',
    title2: 'Robert Blazevic',
    description: 'Multi-year judo contestant and a member of the croatian judo team, winner of many national and international prizes.',
  )
];