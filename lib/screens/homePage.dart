import 'package:flutter/material.dart';
import 'package:lecle_flutter_carousel_pro/lecle_flutter_carousel_pro.dart';
import '../models/singleItemData.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Defining a list of items
  final List<SingleItemData> items = [
    SingleItemData(
      imagePath: "images/products/blazer1.jpeg",
      title: "Blazer",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ",
      rating: "4.5",
      price: "Ksh.999.99",
    ),
    SingleItemData(
      imagePath: "images/products/shoe1.jpg",
      title: "Shoe",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ",
      rating: "4.2",
      price: "Ksh.799.99",
    ),
    SingleItemData(
      imagePath: "images/products/skt1.jpeg",
      title: "Skirt",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ",
      rating: "4.8",
      price: "Ksh.1499.99",
    ),
    SingleItemData(
      imagePath: "images/products/img2.jpg",
      title: "Trouser",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ",
      rating: "4.0",
      price: "Ksh.599.99",
    ),
    SingleItemData(
      imagePath: "images/products/img4.jpg",
      title: "Top",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ",
      rating: "4.0",
      price: "Ksh.599.99",
    ),
    SingleItemData(
      imagePath: "images/products/img6.jpg",
      title: "Shirt",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ",
      rating: "4.0",
      price: "Ksh.599.99",
    ),
    SingleItemData(
      imagePath: "images/cats/dress.png",
      title: "Title 4",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ",
      rating: "4.0",
      price: "Ksh.599.99",
    ),
    SingleItemData(
      imagePath: "images/products/img10.jpg",
      title: "Title 4",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ",
      rating: "4.0",
      price: "Ksh.599.99",
    ),
    SingleItemData(
      imagePath: "images/cats/jeans.jpg",
      title: "Jeans",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ",
      rating: "4.0",
      price: "Ksh.599.99",
    ),
    SingleItemData(
      imagePath: "images/cats/shirt.jpg",
      title: "Shirts",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ",
      rating: "4.0",
      price: "Ksh.599.99",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: searchRowWidget(),
        ),
      ),
      body: Column(
        children: [
          carouselWidget(),
          categoryWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Our Latest Fashion",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),), Text("See More",style: TextStyle(color: Colors.green,fontSize: 16),)],
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7, // Adjust the aspect ratio as needed
              ),
              itemCount: items.length, // Number of items in the list
              itemBuilder: (context, index) {
                final item = items[index];
                return SingleItem(item: item);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SingleItem extends StatelessWidget {
  final SingleItemData item;

  const SingleItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      child: Card(
        elevation: 0.2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.asset(
                  item.imagePath,
                  width: double.infinity,
                  height: 80.0, // Set your desired image height
                  fit: BoxFit.cover,
                ),
                const Expanded(
                  child: Icon(
                    Icons.favorite,
                    // color: Colors.red,
                    size: 24.0, // Adjust the size of the favorite icon
                  ),
                ),
              ],
            ),
            Expanded(
              child: Text(
                item.title,
                style: const TextStyle(
                  fontSize: 16.0, // Adjust the title font size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                item.description,
                style: const TextStyle(
                  fontSize: 14.0, // Adjust the subtitle font size
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 16.0, // Adjust the rating icon size
                      ),
                      Text(
                        item.rating, // Replace with your rating value
                        style: TextStyle(
                          fontSize: 14.0, // Adjust the rating font size
                        ),
                      ),
                    ],
                  ),
                  Text(
                    item.price, // Replace with your price
                    style: TextStyle(
                      fontSize: 16.0, // Adjust the price font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class categoryWidget extends StatelessWidget {
  const categoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(
                  Icons.menu,
                ),
                Text(
                  "All",
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(Icons.flight),
                Text(
                  "women's clothing",
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(
                  Icons.account_balance_wallet,
                ),
                Text(
                  "men's clothing",
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(Icons.three_g_mobiledata),
                Text(
                  "jewelery",
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(
                  Icons.money_outlined,
                ),
                Text(
                  "electronics",
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(Icons.category_outlined),
                Text(
                  "Shoes",
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class carouselWidget extends StatelessWidget {
  const carouselWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Carousel(
        dotSize: 3,
        dotBgColor: Colors.transparent,
        boxFit: BoxFit.cover,
        images: [
          AssetImage("images/products/img1.jpg"),
          AssetImage("images/products/img2.jpg"),
          AssetImage("images/products/img3.jpg"),
          AssetImage("images/products/img4.jpg"),
          AssetImage("images/products/img5.jpg"),
          AssetImage("images/products/img6.jpg"),
        ],
      ),
    );
  }
}

class searchRowWidget extends StatelessWidget {
  const searchRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 8,
          child: Container(
            height: 40,
            child: TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  labelText: "Search...",
                  // prefixText: "Products: ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
        ),
        const Expanded(
          child: Icon(
            Icons.notification_add_outlined,
            size: 30,
            color: Colors.black38,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Expanded(
          child: Icon(
            Icons.message_rounded,
            size: 30,
            color: Colors.black38,
          ),
        ),
      ],
    );
  }
}
