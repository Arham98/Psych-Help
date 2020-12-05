import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:psych_help/addpsych.dart';
// import 'package:psych_help/psychlist.dart';
// import 'package:psych_help/globals.dart';
// import 'package:psych_help/services.dart';

class newcomplaint extends StatefulWidget {
  @override
  _newcomplaint createState() => _newcomplaint();
}

class _newcomplaint extends State<newcomplaint> {
    String tempcomplaint;
   final complaintcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:
          AppBar(title: Text('New Complaint'), backgroundColor: Colors.green),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Username'),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              title: Text('View User Complaints'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Legal'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Help'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () async {
                Navigator.popUntil(
                    context, ModalRoute.withName(Navigator.defaultRouteName));
              },
            ),
          ],
        ),
      ),
      resizeToAvoidBottomPadding: false,
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Colors.green.shade300],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.5, 0.9],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    // CircleAvatar(
                    //   backgroundColor: Colors.green.shade300,
                    //   minRadius: 35.0,
                    //   child: Icon(
                    //     Icons.call,
                    //     size: 30.0,
                    //   ),
                    // ),
                    CircleAvatar(
                      backgroundColor: Colors.white70,
                      minRadius: 60.0,
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(
                            'https://scontent-sin6-2.xx.fbcdn.net/v/t1.0-9/1969304_722096291160404_4811753763754301623_n.jpg?_nc_cat=102&ccb=2&_nc_sid=174925&_nc_ohc=HstJEskV-6IAX9dJEWm&_nc_ht=scontent-sin6-2.xx&oh=ff1df406a07006c7f9828c927dd747b8&oe=5FED0FBA'),
                      ),
                    ),
                    // CircleAvatar(
                    //   backgroundColor: Colors.green.shade500,
                    //   minRadius: 35.0,
                    //   child: IconButton (
                    //   icon: Icon(
                    //     Icons.message,
                    //     size: 30.0,
                    //   ),
                    //   onPressed: () {
                        
                    //   },
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Uzair Mustafa',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Karachi, Pakistan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                // Expanded(
                //   child: Container(
                //     color: Colors.green.shade300,
                //     child: ListTile(
                //       title: Text(
                //         '5',
                //         textAlign: TextAlign.center,
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontSize: 30,
                //           color: Colors.white,
                //         ),
                //       ),
                //       subtitle: Text(
                //         'Average Rating',
                //         textAlign: TextAlign.center,
                //         style: TextStyle(
                //           fontSize: 20,
                //           color: Colors.white70,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                // Container(
                //     padding: new EdgeInsets.all(20.0),
                //     child: RatingBar.builder(
                //         initialRating: 3,
                //         minRating: 1,
                //         direction: Axis.horizontal,
                //         allowHalfRating: true,
                //         itemCount: 5,
                //         itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                //         itemBuilder: (context, _) => Icon(
                //               Icons.star,
                //               color: Colors.green,
                //             ),
                //         onRatingUpdate: (rating) {
                //           print(rating);
                //         })),
                // Divider(),
                // ListTile(
                //   title: Text(
                //     'Counseling Type',
                //     style: TextStyle(
                //       color: Colors.green,
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                //   subtitle: Text(
                //     'Child Psychologist',
                //     style: TextStyle(
                //       fontSize: 18,
                //     ),
                //   ),
                // ),
                Divider(),
                ListTile(
                  title: Text(
                    'Please enter your complaint: ',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // subtitle: Text(
                  //   'sex bomb',
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //   ),
                  // ),
                ),
              ],
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
            ),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: complaintcontroller,
            onChanged: (String text1) {
                    tempcomplaint = text1;
                  },
            
          ),
          const SizedBox(height: 10),
          RaisedButton(
            color: Colors.green,
            onPressed: () {},
            textColor: Colors.white,
            
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child:
                const Text('Submit Complaint', style: TextStyle(fontSize: 20)),
              ),   
          ),       
          // Row(
          //   children: <Widget>[
          //     SizedBox(width: 60),
          //     Container(
          //       height: 40.0,
          //       width: 275.0,
          //       child: Material(
          //         borderRadius: BorderRadius.circular(20.0),
          //         shadowColor: Colors.red,
          //         color: Colors.red,
          //         elevation: 7.0,
          //         child: InkWell(
          //             hoverColor: Colors.red,
          //             splashColor: Colors.blueAccent,
          //             onTap: () {},
          //             child: Center(
          //               child: Text("Delete",
          //                   style: TextStyle(
          //                     color: Colors.white,
          //                     fontWeight: FontWeight.bold,
          //                   )),
          //             )),
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(height: 10),
          // Row(
          //   children: <Widget>[
          //     SizedBox(width: 160),
          //     Container(
          //       child: InkWell(
          //         onTap: () {},
          //         child: Text('Edit Details',
          //             style: TextStyle(
          //                 color: Colors.grey,
          //                 fontWeight: FontWeight.bold,
          //                 decoration: TextDecoration.underline)),
          //       ),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
