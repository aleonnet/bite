import 'package:bite/models/user_repo.dart';
import 'package:bite/screens/login/login_screen.dart';
import 'package:bite/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnboardingScreen extends StatefulWidget {
  final UserRepository _userRepository;

  OnboardingScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  UserRepository get _userRepository => widget._userRepository;

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  int _numPages = 4;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 8,
      width: isActive ? 24 : 18,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white12,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
              0.1,
              0.4,
              0.7,
            ],
                colors: [
              Colors.red[600],
              Colors.red[500],
              Colors.red[400],
            ])),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return LoginScreen(
                          userRepository: _userRepository,
                        );
                      }));
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  )),
              Container(
                height: 600,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    buildScreenOne(),
                    buildScreenTwo(),
                    buildScreenThree(),
                    buildScreenFour(),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding buildScreenOne() {
    return Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white12,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/food4.png')),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'Welcome to bite',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'The food delivery system built by students, for students.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }

  Padding buildScreenThree() {
    return Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white12,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/food4.png')),
                  )),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                'Earn money',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'Earn credit by delivering food to your fellow students. Turn those extra meal swipes into profit!',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }

  Padding buildScreenTwo() {
    return Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white12,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/food4.png')),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'Order food without fear',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                ' Only students have access to the bite ecosystem. Ordering from on-campus locations has never been this fast, safe, and easy. \n \n ',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }

  Padding buildScreenFour() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          MaterialButton(
            height: 60,
            elevation: 0,
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return LoginScreen(
                  userRepository: _userRepository,
                );
              }));
            },
            child: Text(
              'Get started',
              style: TextStyle(color: appTheme().accentColor),
            ),
          )
        ],
      ),
    );
  }
}
