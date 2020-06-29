import 'package:flutter/foundation.dart';

enum Tabs { gardening, plants, social, about }

class TabSelection with ChangeNotifier {
  Tabs selectedTab = Tabs.plants;

  void changeSelectedTab(Tabs tab) {
    selectedTab = tab;
    notifyListeners();
  }
}

String getTabImageUrl(Tabs tab) {
  switch (tab) {
    case Tabs.gardening:
      return 'assets/images/icons/hand_planting.png';
      break;
    case Tabs.plants:
      return 'assets/images/icons/potted_plant.png';
      break;
    case Tabs.social:
      return 'assets/images/icons/social_network.png';
      break;
    case Tabs.about:
      return 'assets/images/icons/info.png';
      break;
  }
}

String getTabTitle(Tabs tab) {
  switch (tab) {
    case Tabs.gardening:
      return 'Gardening';
      break;
    case Tabs.plants:
      return 'My Plants';
      break;
    case Tabs.social:
      return 'Social Feed';
      break;
    case Tabs.about:
      return 'About';
      break;
  }
}

String getBackgroundImageUrl(Tabs tab) {
  switch (tab) {
    case Tabs.gardening:
      return 'assets/images/background/markus-spiske-4PG6wLlVag4-unsplash.jpg';
      break;
    case Tabs.plants:
      return 'assets/images/background/megan-thomas-xMh_ww8HN_Q-unsplash.jpg';
      break;
    case Tabs.social:
      return 'assets/images/background/elaine-casap-qgHGDbbSNm8-unsplash.jpg';
      break;
    case Tabs.about:
      return 'assets/images/background/nadine-primeau--ftWfohtjNw-unsplash.jpg';
      break;
  }
}

enum Plants {
  asparagus,
  aubergine,
  beet,
  cabbage,
  carrot,
  cauliflower,
  chilli_pepper,
  lettuce,
  peas,
  potato,
  pumpkin,
  radish,
  strawberry,
  tomato
}

String getPlantTitle(Plants plant) {
  switch (plant) {
    case Plants.asparagus:
      return 'Asparagus';
      break;
    case Plants.aubergine:
      return 'Aubergine';
      break;
    case Plants.beet:
      return 'Beet';
      break;
    case Plants.cabbage:
      return 'Cabbage';
      break;
    case Plants.carrot:
      return 'Carrot';
      break;
    case Plants.cauliflower:
      return 'Cauliflower';
      break;
    case Plants.chilli_pepper:
      return 'Chilli Pepper';
      break;
    case Plants.lettuce:
      return 'Lettuce';
      break;
    case Plants.peas:
      return 'Peas';
      break;
    case Plants.potato:
      return 'Potato';
      break;
    case Plants.pumpkin:
      return 'Pumpkin';
      break;
    case Plants.radish:
      return 'Radish';
      break;
    case Plants.strawberry:
      return 'Strawberry';
      break;
    case Plants.tomato:
      return 'Tomato';
      break;
    default:
      return 'Plant';
      break;
  }
}

String getPlantImageUrl(Plants plant) {
  switch (plant) {
    case Plants.asparagus:
      return 'assets/images/icons/asparagus.png';
      break;
    case Plants.aubergine:
      return 'assets/images/icons/aubergine.png';
      break;
    case Plants.beet:
      return 'assets/images/icons/beet.png';
      break;
    case Plants.cabbage:
      return 'assets/images/icons/cabbage.png';
      break;
    case Plants.carrot:
      return 'assets/images/icons/carrot.png';
      break;
    case Plants.cauliflower:
      return 'assets/images/icons/cauliflower.png';
      break;
    case Plants.chilli_pepper:
      return 'assets/images/icons/chili_pepper.png';
      break;
    case Plants.lettuce:
      return 'assets/images/icons/lettuce.png';
      break;
    case Plants.peas:
      return 'assets/images/icons/peas.png';
      break;
    case Plants.potato:
      return 'assets/images/icons/potato.png';
      break;
    case Plants.pumpkin:
      return 'assets/images/icons/pumpkin.png';
      break;
    case Plants.radish:
      return 'assets/images/icons/radish.png';
      break;
    case Plants.strawberry:
      return 'assets/images/icons/strawberry.png';
      break;
    case Plants.tomato:
      return 'assets/images/icons/tomato.png';
      break;
    default:
      return 'assets/images/icons/potted_plant.png';
      break;
  }
}

class Plant {
  int id;
  Plants kind;
  DateTime plantedDate;
  DateTime wateredDate;
  Plant(this.id, this.kind, this.plantedDate, this.wateredDate);
}

List<Plant> currentPlants = <Plant>[
  Plant(2, Plants.carrot, DateTime.utc(2020, 6, 21), DateTime.utc(2020, 6, 27)),
  Plant(4, Plants.beet, DateTime.utc(2020, 6, 24), DateTime.utc(2020, 6, 26)),
  Plant(
      5, Plants.lettuce, DateTime.utc(2020, 6, 27), DateTime.utc(2020, 6, 28)),
  Plant(
      6, Plants.cabbage, DateTime.utc(2020, 6, 27), DateTime.utc(2020, 6, 28)),
//  Plant(7, Plants.radish, DateTime.utc(2020, 6, 27), DateTime.utc(2020, 6, 28)),
];

class GardeningContent {
  String imageUrl;
  String text;
  GardeningContent(this.imageUrl, this.text);
}

class GardeningItem {
  String title;
  String imageUrl;
  List<GardeningContent> content;
  GardeningItem(this.title, this.imageUrl, this.content);
}

List<GardeningItem> gardeningItems = <GardeningItem>[
  GardeningItem(
    'Why Gardening?',
    'assets/images/icons/why_us_female.png',
    <GardeningContent>[
      GardeningContent(
        null,
        'Keeping fit and healthy is important at any time, but during the coronavirus pandemic, it is critical. If you have a garden or outdoor space, then you have a place that you can use to maintain your health and well-being.',
      ),
      GardeningContent(
        null,
        'Science has proven that gardening is good for you!',
      ),
      GardeningContent(
        null,
        'With as much as one-quarter of the world’s population currently in coronavirus lockdown now is the time to use your time in the garden or balcony to keep safe and healthy too.',
      ),
      GardeningContent(
        null,
        'As ‘the world’s champion for the power of plants’ the International Association of Horticultural Producers (AIPH) has pulled together the scientific evidence that shows how gardening and being in the garden will help to keep you well.',
      ),
    ],
  ),
  GardeningItem(
    'Tools',
    'assets/images/icons/garden_shears.png',
    <GardeningContent>[
      GardeningContent(
        'assets/images/icons/garden_gloves.png',
        'Garden Gloves\n\nIt is used to protect hands from dirt and other sharp objects that may be found in soil.',
      ),
      GardeningContent(
        'assets/images/icons/garden_shears.png',
        'Garden Shears\n\nIt is used for pruning plants so that it has optimal growth and produces the best fruits, vegetables, and flowers.',
      ),
      GardeningContent(
        'assets/images/icons/spade.png',
        'Spade\n\nIt is used to male large holes and to transfer dirt to and from a wheel barrow.',
      ),
      GardeningContent(
        'assets/images/icons/water_hose.png',
        'Water Hose\n\nIt it used to water large areas or if the tap is not near by.',
      ),
      GardeningContent(
        'assets/images/icons/watering_can.png',
        'Watering Can\n\nIt is used to water plants in small areas where the tap is not near by or the hose would be a hassle.',
      ),
      GardeningContent(
        'assets/images/icons/wheelbarrow.png',
        'Wheel Barrow\n\n it is used to transfer soil from one place to other.',
      ),
    ],
  ),
  GardeningItem(
    'How to plant',
    'assets/images/icons/paper_bag_with_seeds.png',
    <GardeningContent>[
      GardeningContent(
        null,
        'Before choosing plants for your garden, it’s important to check what type of soil you have. Different plants suit different soils, and you may need to improve your soil before you start planting. First check the consistency of the soil – is it sticky and muddy (clay), or does it fall easily through your fingers (sandy)? Somewhere between the two is ideal – this type of soil is often referred to as friable or having a fine tilth. It means that young roots will spread easily.',
      ),
      GardeningContent(
        null,
        'If your soil is heavy clay, it will be hard to dig and you will need to add plenty of well rotted manure or compost to improve the structure. If your soil is sandy or chalky, you will also need to add organic matter to improve fertility. You should also check the pH of your soil. Most plants require a neutral to acid pH of around 6, but some require higher levels of acidity and these are often known as ericaceous plants. It’s hard to change the pH of your soil, but you can tweak it by adding acid composts, or you could create an acid raised bed or container. The most important thing to remember about soil is to choose plants that will suit the growing conditions in your plot – it’s easier than trying to change the soil.',
      )
    ],
  ),
  GardeningItem(
    'Taking care',
    'assets/images/icons/garden_gloves.png',
    <GardeningContent>[
      GardeningContent(
        null,
        '1. Examine plants carefully before buying.',
      ),
      GardeningContent(
        null,
        '2. Use fully composted yard waste.',
      ),
      GardeningContent(
        null,
        '3. Keep an eye on your bugs.',
      ),
      GardeningContent(
        null,
        '4. Clean up in the fall.',
      ),
      GardeningContent(
        null,
        '5. Apply the correct fertilizer.',
      ),
      GardeningContent(
        null,
        '6. Plant disease-resistant varieties.',
      ),
      GardeningContent(
        null,
        '7. Prune damaged limbs at the right time.',
      ),
      GardeningContent(
        null,
        '8. Choose and site plants appropriately.',
      ),
      GardeningContent(
        null,
        '9. Water properly.',
      ),
      GardeningContent(
        null,
        '10. Don’t crowd plants.',
      ),
    ],
  ),
];

class User {
  String name;
  String photoUrl;
  User(this.name, this.photoUrl);
}

List<User> users = <User>[
  User(
    'Rafael Conde',
    'https://tinyfac.es/data/avatars/2DDDE973-40EC-4004-ABC0-73FD4CD6D042-200w.jpeg',
  ),
  User(
    'Steven van Wel',
    'https://tinyfac.es/data/avatars/E0B4CAB3-F491-4322-BEF2-208B46748D4A-200w.jpeg',
  ),
  User(
    'Stuart Clarke-Frisby',
    'https://tinyfac.es/data/avatars/AEF44435-B547-4B84-A2AE-887DFAEE6DDF-200w.jpeg',
  ),
  User(
    'Alexis Doreau',
    'https://tinyfac.es/data/avatars/26CFEFB3-21C8-49FC-8C19-8E6A62B6D2E0-200w.jpeg',
  ),
  User(
    'Joshua Sisco',
    'https://tinyfac.es/data/avatars/282A12CA-E0D7-4011-8BDD-1FAFAAB035F7-200w.jpeg',
  ),
  User(
    'Marco Sousa',
    'https://tinyfac.es/data/avatars/1C4EEDC2-FE9C-40B3-A2C9-A038873EE692-200w.jpeg',
  ),
  User(
    'Ioannis Iliadis',
    'https://tinyfac.es/data/avatars/344CFC24-61FB-426C-B3D1-CAD5BCBD3209-200w.jpeg',
  ),
  User(
    'Erwan Gauthier',
    'https://tinyfac.es/data/avatars/BA0CB1F2-8C79-4376-B13B-DD5FB8772537-200w.jpeg',
  ),
  User(
    'Jeffrey Kam',
    'https://tinyfac.es/data/avatars/852EC6E1-347C-4187-9D42-DF264CCF17BF-200w.jpeg',
  ),
  User(
    'Adam Brodowski',
    'https://tinyfac.es/data/avatars/FBEBF655-4886-455A-A4A4-D62B77DD419B-200w.jpeg',
  ),
  User(
    'Sophie Louise Hart',
    'https://tinyfac.es/data/avatars/03F55412-DE8A-4F83-AAA6-D67EE5CE48DA-200w.jpeg',
  ),
  User(
    'Ash',
    'https://tinyfac.es/data/avatars/A7299C8E-CEFC-47D9-939A-3C8CA0EA4D13-200w.jpeg',
  ),
  User(
    'Timothy Achumba',
    'https://tinyfac.es/data/avatars/B3CF5288-34B0-4A5E-9877-5965522529D6-200w.jpeg',
  ),
  User(
    'Sophie Louise Hart',
    'https://tinyfac.es/data/avatars/03F55412-DE8A-4F83-AAA6-D67EE5CE48DA-200w.jpeg',
  ),
  User(
    'Steven van Wel',
    'https://tinyfac.es/data/avatars/E0B4CAB3-F491-4322-BEF2-208B46748D4A-200w.jpeg',
  ),
  User(
    'Adam Brodowski',
    'https://tinyfac.es/data/avatars/FBEBF655-4886-455A-A4A4-D62B77DD419B-200w.jpeg',
  ),
  User(
    'Jeffrey Kam',
    'https://tinyfac.es/data/avatars/852EC6E1-347C-4187-9D42-DF264CCF17BF-200w.jpeg',
  ),
  User(
    'Alexis Doreau',
    'https://tinyfac.es/data/avatars/26CFEFB3-21C8-49FC-8C19-8E6A62B6D2E0-200w.jpeg',
  ),
  User(
    'Rafael Conde',
    'https://tinyfac.es/data/avatars/2DDDE973-40EC-4004-ABC0-73FD4CD6D042-200w.jpeg',
  ),
  User(
    'Abagael Espenlaub',
    'https://tinyfac.es/data/avatars/A7299C8E-CEFC-47D9-939A-3C8CA0EA4D13-200w.jpeg',
  ),
  User(
    'Joshua Sisco',
    'https://tinyfac.es/data/avatars/282A12CA-E0D7-4011-8BDD-1FAFAAB035F7-200w.jpeg',
  ),
  User(
    'Stuart Clarke-Frisby',
    'https://tinyfac.es/data/avatars/AEF44435-B547-4B84-A2AE-887DFAEE6DDF-200w.jpeg',
  ),
  User(
    'Timothy Achumba',
    'https://tinyfac.es/data/avatars/B3CF5288-34B0-4A5E-9877-5965522529D6-200w.jpeg',
  ),
  User(
    'Erwan Gauthier',
    'https://tinyfac.es/data/avatars/BA0CB1F2-8C79-4376-B13B-DD5FB8772537-200w.jpeg',
  ),
  User(
    'Marco Sousa',
    'https://tinyfac.es/data/avatars/1C4EEDC2-FE9C-40B3-A2C9-A038873EE692-200w.jpeg',
  ),
  User(
    'Ioannis Iliadis',
    'https://tinyfac.es/data/avatars/344CFC24-61FB-426C-B3D1-CAD5BCBD3209-200w.jpeg',
  ),
];
