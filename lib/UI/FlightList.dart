import 'package:flutter/material.dart';

final Color discountBackgroundColore = Color(0xFFFFE08D);
final Color flightBorderColore = Color(0xFFE6E6E6);
final Color ChipBackgroundColore = Color(0xFFF6F6F6);

class FlightList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0.0,
        title: Text('Result'),
        centerTitle: true,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            FlighListTopPart(),
            SizedBox(height: 20.0,),
            FlighListBottomPart()
          ],
        ),
      ),
    );
  }
}

class FlighListTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShaepClipper(),
          child: Container(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.orange, Colors.orange])),
            height: 160.0,
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              margin: EdgeInsets.symmetric(horizontal: 18.0),
              elevation: 10.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 25.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'gaza city',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.black87),
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 28.0,
                          ),
                          Text(
                            'New York City ',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.import_export,
                          color: Colors.black,
                          size: 32.0,
                        )),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class FlighListBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Best Deals for News & Months",
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ListView(

            shrinkWrap: true,
            physics: ClampingScrollPhysics(),

            scrollDirection: Axis.vertical,
            children: <Widget>[
              FlighCard(),
              FlighCard(),
              FlighCard(),
              FlighCard(),
              FlighCard(),
              FlighCard(),
              FlighCard(),
              FlighCard(),
              FlighCard(),
            ],
          )
        ],
      ),
    );
  }
}

class FlighCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              border: Border.all(color: Colors.grey.withOpacity(0.5)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "\$4000",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(width: 4.0,),
                      Text(
                        "\$ 90000",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: <Widget>[
                      FlightDetailChip(Icons.calendar_today,"june 2019"),
                      FlightDetailChip(Icons.flight_takeoff,"jet Ariways"),
                      FlightDetailChip(Icons.star,"4.5"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
               top: 10.0,
               right: 0.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
                 child: Text("55%",style: TextStyle(color: Colors.orange,fontSize: 14.0,),),
                 decoration: BoxDecoration(color: discountBackgroundColore, borderRadius: BorderRadius.all(Radius.circular(10.0))),
              )
          ),
        ],
      ),
    );
  }
}

class FlightDetailChip extends StatelessWidget {
    final IconData iconData;
    final String lable;
  FlightDetailChip(this.iconData, this.lable);
  @override
  Widget build(BuildContext context) {
    return RawChip(
       label: Text(lable,),
       labelStyle: TextStyle(color: Colors.black,fontSize: 14.0,),
       backgroundColor: Colors.grey.shade100,
       avatar: Icon(iconData,size: 17.0,),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
    );
  }

}


class CustomShaepClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    final Path path = Path();
    path.lineTo(0.0, size.height);
    var firstEndPoint = Offset(size.width * .5, size.height - 30.0);
    var firstControlPoint = Offset(size.width * 0.25, size.height - 50.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 80);
    var secondControlPoint = Offset(size.width * .75, size.height - 10);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
