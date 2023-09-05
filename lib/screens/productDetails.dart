import 'package:flutter/material.dart';
import '../models/singleItemData.dart';

class ItemDetailPage extends StatelessWidget {
  final SingleItemData item;

  const ItemDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title), // Display item title in the app bar
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  child: Column(
                    children: [
                      const Text("Total Price"),
                      Text(item.price,style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20),)
                    ],
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                    color: Colors.green[500],
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("1",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),

                    ],
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  height: 50,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                   color: Colors.black,
                 ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Buy Now",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),

                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              item.imagePath,
              width: double.infinity,
              // height: 200.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            Text(
              item.description,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Icon(Icons.star,color: Colors.red,),
                Text(
                  item.rating,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(width: 10,),
                Text(
                  item.price,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
