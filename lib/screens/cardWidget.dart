import 'package:flutter/material.dart';

class SingleItem extends StatelessWidget {
  const SingleItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 300,
        child: Card(
          elevation: 0.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.asset(
                    'images/products/blazer1.jpeg',
                    width: double.infinity,
                    height: 160.0, // Set your desired image height
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite,
                      // color: Colors.red,
                      size: 24.0, // Adjust the size of the favorite icon
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Image Title',
                  style: TextStyle(
                    fontSize: 16.0, // Adjust the title font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ' Lorem Ipsum has been the industrys standard dummy text ever since the 1500s', // Add your subtitle here
                  style: TextStyle(
                    fontSize: 14.0, // Adjust the subtitle font size
                  ),
                ),
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 16.0, // Adjust the rating icon size
                      ),
                      SizedBox(width: 4.0), // Add spacing between icon and rating
                      Text(
                        '4.5', // Replace with your rating value
                        style: TextStyle(
                          fontSize: 14.0, // Adjust the rating font size
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 50,),
                  Text(
                    '\Ksh.999.99', // Replace with your price
                    style: TextStyle(
                      fontSize: 16.0, // Adjust the price font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}





