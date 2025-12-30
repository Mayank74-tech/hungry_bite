import 'package:flutter/material.dart';
import 'package:hungry_bite/common/color_extension.dart';
import 'common_widget/round_textfield.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController searchController = TextEditingController();

  List catArr = [
    {"image": "assets/images/cat_offer.png", "name": "Offers"},
    {"image": "assets/images/cat_sri.png", "name": "Sri Lankan"},
    {"image": "assets/images/cat_3.png", "name": "Italian"},
    {"image": "assets/images/cat_4.png", "name": "Indian"},
  ];

  List popArr = [
    {
      "image": "assets/images/res_1.png",
      "name": "Minute by tuk tuk",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Western Food"
    },
    {
      "image": "assets/images/res_2.png",
      "name": "Café de Noir",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Western Food"
    },
    {
      "image": "assets/images/res_3.png",
      "name": "Bakes by Tella",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Western Food"
    },
  ];

  List mostPopArr = [
    {
      "image": "assets/images/m_res_1.png",
      "name": "Minute by tuk tuk",
      "rate": "4.9",
      "rating": "124"
    },
    {
      "image": "assets/images/m_res_2.png",
      "name": "Café de Noir",
      "rate": "4.9",
      "rating": "124"
    },
  ];

  List recentArr = [
    {
      "image": "assets/images/item_1.png",
      "name": "Mulberry Pizza by Josh",
      "rate": "4.9",
      "rating": "124"
    },
    {
      "image": "assets/images/item_2.png",
      "name": "Barita",
      "rate": "4.9",
      "rating": "124"
    },
    {
      "image": "assets/images/item_3.png",
      "name": "Pizza Rush Hour",
      "rate": "4.9",
      "rating": "124"
    },
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [

              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Hello buddy!!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    "assets/images/shopping_cart.png",
                    width: 35,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// LOCATION
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Delivering to"),
                    Row(
                      children: [
                        Text(
                          "Current Location",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 25,
                            color: TColor.secondaryText,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Image.asset(
                          "assets/images/dropdown.png",
                          width: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// FIXED SEARCH BAR
              RoundTextfield(
                controller: searchController,
                hintText: "Search Food",
                left: Image.asset(
                  "assets/images/search.png",
                  width: 20,
                ),
              ),

              const SizedBox(height: 10),

              /// SCROLLABLE CONTENT
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      /// CATEGORIES
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: catArr.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      catArr[index]["image"],
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    catArr[index]["name"],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// POPULAR RESTAURANTS
                      sectionTitle("Popular Restaurants"),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: popArr.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    popArr[index]["image"],
                                    width: 100,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      popArr[index]["name"],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      "⭐ ${popArr[index]["rate"]} (${popArr[index]["rating"]})",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 20),

                      /// MOST POPULAR
                      sectionTitle("Most Popular"),

                      SizedBox(
                        height: 220,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mostPopArr.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 180,
                              margin: const EdgeInsets.only(right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    mostPopArr[index]["image"],
                                    width: 180,
                                    height: 140,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    mostPopArr[index]["name"],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// RECENT ITEMS
                      sectionTitle("Recent Items"),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: recentArr.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Row(
                              children: [
                                Image.asset(
                                  recentArr[index]["image"],
                                  width: 80,
                                  height: 80,
                                ),
                                const SizedBox(width: 15),
                                Text(
                                  recentArr[index]["name"],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
          Text(
            "See All",
            style: TextStyle(
              color: TColor.primary,
            ),
          ),
        ],
      ),
    );
  }
}
