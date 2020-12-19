import 'package:flutter/material.dart';
import 'package:flutterui_foodapp/models/category.dart';
import 'package:flutterui_foodapp/models/food.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> categoryList = [
    Category(
        name: 'Burger',
        imageUrl: 'assets/icons/burger.png',
        bgColor: Colors.red[100]),
    Category(
        name: 'Sandwich',
        imageUrl: 'assets/icons/sandwich.png',
        bgColor: Colors.blue[100]),
    Category(
        name: 'Pizza',
        imageUrl: 'assets/icons/pizza.png',
        bgColor: Colors.amber[100]),
    Category(
        name: 'Salads',
        imageUrl: 'assets/icons/salad.png',
        bgColor: Colors.cyan[100])
  ];

  List<Food> bestOrder = [
    Food(
      name: 'Burger Double',
      time: '30-40',
      price: '2.00',
      imageUrl: 'assets/images/burger1.jpeg',
      bgColor: Colors.amber[100],
    ),
    Food(
      name: 'Chees Burger',
      time: '30-40',
      price: '3.00',
      imageUrl: 'assets/images/burger2.jpeg',
      bgColor: Colors.blue[100],
    ),
    Food(
      name: 'Grill Burger',
      time: '30-40',
      price: '5.00',
      imageUrl: 'assets/images/burger3.jpeg',
      bgColor: Colors.red[100],
    )
  ];

  List<Food> todayOffer = [
    Food(
      name: 'Shrimp Double',
      time: '30-40',
      price: '2.00',
      imageUrl: 'assets/images/burger4.jpeg',
      bgColor: Colors.red[100],
    ),
    Food(
      name: 'Tuna Burger',
      time: '30-40',
      price: '3.00',
      imageUrl: 'assets/images/burger5.jpeg',
      bgColor: Colors.amber[100],
    ),
    Food(
      name: 'Beef Burger',
      time: '30-40',
      price: '5.00',
      imageUrl: 'assets/images/burger6.jpeg',
      bgColor: Colors.blue[100],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.apps_outlined),
        backgroundColor: Color(0xffDE3163),
        title: Text(
          'Home',
          textScaleFactor: 1.0,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:
                            BorderSide(color: Color(0xffDE3163), width: 1.5)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:
                            BorderSide(color: Color(0xffDE3163), width: 1.5)),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Color(0xffDE3163),
                      fontWeight: FontWeight.bold,
                    ),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Color(0xffDE3163),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Category',
                    textScaleFactor: 1.0,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (Category category in categoryList)
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                InkWell(
                                  onTap: () => null,
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: category.bgColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 15,
                                  right: 15,
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image:
                                                AssetImage(category.imageUrl))),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              category.name,
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5),
                            )
                          ],
                        ),
                      )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Today Best Orders',
                    textScaleFactor: 1.0,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (Food foodItem in bestOrder) _buildFoodCard(foodItem)
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Today Offers',
                    textScaleFactor: 1.0,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (Food foodItem in todayOffer) _buildFoodCard(foodItem)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFoodCard(Food food) {
    return Card(
      color: food.bgColor,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.16,
            width: MediaQuery.of(context).size.width * 0.35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(food.imageUrl))),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text(food.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ))),
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text('${food.time} Min',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12))),
          Container(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.21),
              child: Text('${food.price} Usd',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 12))),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
