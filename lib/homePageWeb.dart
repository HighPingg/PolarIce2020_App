import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:polar_ice_app/aboutUs.dart';
import 'package:polar_ice_app/bundleItemPage.dart';
import 'package:polar_ice_app/product.dart';
import 'package:polar_ice_app/productShowcase.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
//https://d1o107zu815354.cloudfront.net/websites/4596/topdesigninspiration-extra_large.jpg?1450187625

class HomePageWeb extends StatelessWidget {
  const HomePageWeb({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/iceCreamScoopsWeb.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment(-1, -0.9),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 25.0),
                        child: Image.asset(
                          'assets/images/PolariceLogo.png',
                          height: 150.0,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Center(
                        child: Text(
                          'WELCOME',
                          style: TextStyle(
                              fontSize: 50.0, fontFamily: 'ArchivoBlack'),
                        ),
                      ),
                      Center(
                        child: Text(
                          'to a new world of flavour',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontFamily: 'OpenSans',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff2bbfff),
                      Color(0xffff00b3),
                    ],
                    tileMode: TileMode.repeated,
                  ),
                ),
                child: Center(
                  child: Wrap(
                    children: <Widget>[
                      GestureDetector(
                          child: Container(
                            height: 400,
                            constraints: BoxConstraints(
                              minWidth: 400,
                              maxWidth: 700,
                            ),
                            margin: EdgeInsets.all(50),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 2,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/CozyWinterDark.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        seasonSpecial.name,
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BundleItemPage(
                                        name: seasonSpecial.name,
                                        imagePath: seasonSpecial.imagePath,
                                        description: seasonSpecial.descrip,
                                      )))),
                      webContainer(
                          context,
                          'Bundles',
                          'assets/images/realSprinklesDark.png',
                          Bundles.toList()),
                      webContainer(
                          context,
                          'Boxes',
                          'assets/images/iceCreamScoopsDark.png',
                          Boxes.toList()),
                    ],
                  ),
                ),
              ),
              Container(
                color: Color(0xffff00b3),
                height: 200,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: 'Want to learn more about us?',
                          style: TextStyle(color: Colors.white),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AboutUs())),
                              text: '  Click Here',
                              style: TextStyle(
                                color: Colors.blue[300],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            //if any issues with FontAwesomeFlutter -> use imgs instead
                            mediaIconButton(Icon(FontAwesomeIcons.facebook),
                                'https://facebook.com'),
                            mediaIconButton(Icon(FontAwesomeIcons.youtube),
                                'https://www.youtube.com/channel/UC3j8qvaPmvTTwtwrgJStu5A')
                          ],//
                        ),
                      ),
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

  webContainer(
      BuildContext context, String text, String imagePath, List<Product> list) {
    return GestureDetector(
      child: Container(
        height: 400,
        constraints: BoxConstraints(
          minWidth: 400,
          maxWidth: 700,
        ),
        margin: EdgeInsets.all(50),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(40)),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductShowcase(
                    title: text,
                    list: list,
                  ))),
    );
  }

  mediaIconButton(Icon icon, String url) {
    return IconButton(icon: icon, onPressed: () => launch(url));
  }
}
