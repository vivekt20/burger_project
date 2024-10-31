import 'package:burger_project/database.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String imagePath;
  final String name;

  DetailsScreen({required this.imagePath, required this.name});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        leading: Icon(Icons.arrow_back),
        title: Text("Details"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.imagePath), fit: BoxFit.cover)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.red,
                ),
                SizedBox(width: 15),
                CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.grey,
                ),
                SizedBox(width: 15),
                CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.grey,
                )
              ],
            ),
            Row(
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  "\$${7.5}",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 15,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  size: 15,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  size: 15,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  size: 15,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  size: 15,
                  color: Colors.yellow,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text("Ingredients",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            SizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    width: 80,
                    decoration: BoxDecoration(
                      color: Database.itemsList[index]["color"],
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(Database.itemsList[index]["image"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 30);
                },
                itemCount: Database.itemsList.length,
              ),
            ),
            SizedBox(height: 20),
            Text("Description",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              "This beef burger uses 100% quality beef with\nsliced tomatoes,cucumbers,vegetales and\n onions...Read More",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisSize: MainAxisSize.min, // This wraps the Row's content
              children: [
                Container(
                    width: 150,
                    height: 50, // Set a height to ensure it's visible
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white),
                          child: Center(
                              child: Text("-",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))),
                        ),
                        Text("1",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.red),
                          child: Center(
                              child: Text("+",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))),
                        ),
                      ],
                    )),
                SizedBox(width: 35), // Spacing between the container and button
                SizedBox(
                  width: 180,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Add To Cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}