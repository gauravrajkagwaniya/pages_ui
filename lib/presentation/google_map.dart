import 'package:flutter/material.dart';import 'package:page_ui/presentation/service_home.dart';import 'custom_widget/custom_pins.dart';import 'list_top.dart';import 'package:font_awesome_flutter/font_awesome_flutter.dart';import 'package:google_maps_flutter/google_maps_flutter.dart';class GoogleMaps extends StatefulWidget {  @override  _GoogleMapsState createState() => _GoogleMapsState();}class _GoogleMapsState extends State<GoogleMaps> {  BitmapDescriptor icon;  @override  Widget build(BuildContext context) {    return Scaffold(        drawer: _buildDrawer(context),        appBar: AppBar(          iconTheme: new IconThemeData(color: Colors.brown[900]),          backgroundColor: Colors.orangeAccent,          elevation: 0.0,          title: Row(            mainAxisAlignment: MainAxisAlignment.start,            crossAxisAlignment: CrossAxisAlignment.start,            children: [              Flexible(                  child: Container(                color: Colors.transparent,                width: 150,                child: Text(                  '300 mount lebanon boulevard pittsburgh pa 15234 USA',                  maxLines: 2,                  style: TextStyle(color: Colors.brown[900], fontSize: 10),                ),              )),              Icon(                Icons.edit,                size: 7,                color: Colors.brown[900],              )            ],          ),          actions: [            IconButton(                icon: Icon(Icons.search, color: Colors.brown[900]),                onPressed: () {}),          ],        ),        body: Container(          color: Colors.black,          child: Stack(            children: [              // maps              _buildMap(context),              /*Container(              height: MediaQuery.of(context).size.height,              child: Image.asset(                'assets/images/map.JPG',                fit: BoxFit.cover,              )),*/              Container(                height: MediaQuery.of(context).size.height * .10,                width: MediaQuery.of(context).size.width,                decoration: BoxDecoration(                  color: Colors.orangeAccent,                  borderRadius: BorderRadius.only(                      bottomRight: Radius.circular(20.0),                      bottomLeft: Radius.circular(20.0)),                ),                child: Card(                    margin: EdgeInsets.all(20),                    shape: RoundedRectangleBorder(                      borderRadius: BorderRadius.all(Radius.circular(30)),                    ),                    child: ListTop()),              ),              /*   SizedBox(            height: 150,          ),*/              Positioned(top: 150, child: CustomPins()),              Positioned(top: 165, left: 65, child: CustomPins()),              Positioned(top: 185, left: 85, child: CustomPins()),              Positioned(top: 300, right: 95, child: CustomPins()),              ServiceHome(),            ],          ),        ));  }  Widget _buildMap(BuildContext context) {    return Container(      height: MediaQuery.of(context).size.height,      width: MediaQuery.of(context).size.width,      child: GoogleMap(        mapType: MapType.normal,        initialCameraPosition:            CameraPosition(target: LatLng(40.431478,-80.0505409), zoom: 10),       /* onMapCreated: (GoogleMapController controller) {          // _controller.complete(controller);        },*/       markers: {pin1, pin2, pin3, pin4},      ),    );  }  // icon Marker  getIcons() async {    var icon = await BitmapDescriptor.fromAssetImage(        ImageConfiguration(devicePixelRatio: 3.0),        "assets/images/dog.jpg");    setState(() {      this.icon = icon;    });  }  Marker pin1 = Marker(    markerId: MarkerId('pin1'),    position: LatLng(40.431478,-80.0532609),    //infoWindow: InfoWindow(title: 'Gramercy Tavern'),    icon: BitmapDescriptor.defaultMarkerWithHue(      BitmapDescriptor.hueOrange,    ),  );  Marker pin2 = Marker(    markerId: MarkerId('pin2'),    position: LatLng(40.431478,-80.0532509),    //infoWindow: InfoWindow(title: 'Gramercy Tavern'),    icon: BitmapDescriptor.defaultMarkerWithHue(      BitmapDescriptor.hueOrange,    ),  );  Marker pin3 = Marker(    markerId: MarkerId('pin3'),    position: LatLng(40.431478,-80.0565409),    //infoWindow: InfoWindow(title: 'Gramercy Tavern'),    icon: BitmapDescriptor.defaultMarkerWithHue(      BitmapDescriptor.hueOrange,    ),  );  Marker pin4 = Marker(    markerId: MarkerId('pin4'),    position: LatLng(40.431478,-80.078409),    //infoWindow: InfoWindow(title: 'Gramercy Tavern'),    icon: BitmapDescriptor.defaultMarkerWithHue(      BitmapDescriptor.hueOrange,    ),  );  Widget _buildDrawer(BuildContext context) {    return Drawer(        child: ListView(      children: <Widget>[        DrawerHeader(          child: Text('login info'),          decoration: BoxDecoration(            color: Colors.orangeAccent,          ),        ),        ListTile(          leading: Icon(Icons.home, color: Colors.brown[900]),          title: Text(            'Home',            style: TextStyle(color: Colors.brown[900]),          ),          onTap: () {},        ),        ListTile(          leading: FaIcon(            FontAwesomeIcons.userCircle,            color: Colors.brown,          ),          title: Text(            'PROFILE',            style: TextStyle(              color: Colors.brown,            ),          ),          onTap: () {},        ),        ListTile(          leading: Icon(            Icons.calendar_today,            color: Colors.brown,          ),          title: Text(            'BOOKING',            style: TextStyle(              color: Colors.brown,            ),          ),          onTap: () {},        ),        ListTile(          leading: Icon(            Icons.thumb_up,            color: Colors.brown,          ),          title: Text(            'Like',            style: TextStyle(              color: Colors.brown,            ),          ),          onTap: () {},        ),        ListTile(          leading: FaIcon(            FontAwesomeIcons.envelopeOpenText,            color: Colors.brown,          ),          title: Text(            'MESSAGES',            style: TextStyle(              color: Colors.brown,            ),          ),          onTap: () {},        ),        ListTile(          leading: Icon(            Icons.exit_to_app,            color: Colors.brown,          ),          title: Text(            'LogOut',            style: TextStyle(              color: Colors.brown,            ),          ),          onTap: () {},        ),      ],    ));  }}