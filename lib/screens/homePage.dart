import 'dart:convert';
import 'package:fashion_app/screens/productDetails.dart';
import 'package:flutter/material.dart';
import 'package:lecle_flutter_carousel_pro/lecle_flutter_carousel_pro.dart';
import '../models/singleItemData.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer_animation/shimmer_animation.dart';


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

  ];

  Future<List<SingleItemData>> fetchFakeStoreData() async {
    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((item) {
          return SingleItemData(
            image: item['image'],
            title: item['title'],
            description: item['description'],
            rating: item['rating'].toString(),
            price: '\$${item['price'].toStringAsFixed(2)}',
          );
        }).toList();
      } else {
        throw Exception('Failed to load data from fakestoreapi.com');
      }
    } catch (e) {
      print('Error fetching data: $e');
      throw e; // Rethrow the error to notify the caller
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const searchRowWidget(),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Icon(Icons.home), Text("Home")],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.payments_outlined), Text("Voucher")],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.wallet_giftcard), Text("Wallet")],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.settings), Text("Settings")],
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: carouselWidget(),
          ),
          const SliverToBoxAdapter(
            child: categoryWidget(),
          ),

          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Our Latest Fashion",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See More",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
      
          // FutureBuilder<List<SingleItemData>>(
          //   future: fetchFakeStoreData(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       // Return a SliverToBoxAdapter to keep the space occupied
          //       return const SliverToBoxAdapter(
          //
          //       );
          //     } else if (snapshot.hasError) {
          //       return SliverToBoxAdapter(
          //         child: Text('Error: ${snapshot.error}'),
          //       );
          //     } else {
          //       final List<SingleItemData> items = snapshot.data!;
          //       return SliverGrid(
          //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 2,
          //           childAspectRatio: 0.7,
          //         ),
          //         delegate: SliverChildBuilderDelegate(
          //               (BuildContext context, int index) {
          //             final item = items[index];
          //             return SingleItem(item: item);
          //           },
          //           childCount: items.length,
          //         ),
          //       );
          //     }
          //   },
          // )


          FutureBuilder<List<SingleItemData>>(
            future: fetchFakeStoreData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SliverToBoxAdapter(
                  child: Shimmer(
                    color: Colors.greenAccent,
                    duration: Duration(seconds: 12), // Adjust duration as needed
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 120.0,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 4.0),
                        Container(
                          width: double.infinity,
                          height: 16.0,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 4.0),
                        Container(
                          width: double.infinity,
                          height: 16.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return SliverToBoxAdapter(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                final List<SingleItemData> items = snapshot.data!;
                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      final item = items[index];
                      return SingleItem(item: item);
                    },
                    childCount: items.length,
                  ),
                );
              }
            },
          )



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
    return InkWell(
      onTap: () {
        // Navigate to the ItemDetailPage and pass the selected item
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ItemDetailPage(item: item),
          ),
        );
      },
      child: Card(
        elevation: 0.2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image(
                  image: NetworkImage(item.image), // Use NetworkImage to load image from URL
                  width: double.infinity,
                  height: 120.0,
                  fit: BoxFit.cover,
                ),
                const Expanded(
                  child: Icon(
                    Icons.favorite,
                     color: Colors.red,
                    size: 24.0,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ),

            // Expanded(
            //   child: Text(
            //     item.description,
            //     style: const TextStyle(
            //       fontSize: 14.0,
            //     ),
            //   ),
            // ),

            // Expanded(
            //   child:
            //       Row(
            //         children: [
            //           const Icon(
            //             Icons.star,
            //             color: Colors.yellow,
            //             size: 16.0,
            //           ),
            //           Text(
            //             item.rating,
            //             style: const TextStyle(
            //               fontSize: 14.0,
            //             ),
            //           ),
            //
            //       Text(
            //         item.price,
            //         style: const TextStyle(
            //           fontSize: 16.0,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),


                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      item.price,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue
                      ),
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
    return const SingleChildScrollView(
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
      child: const Carousel(
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
