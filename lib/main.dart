import 'package:flutter/material.dart';
import 'package:full_app_with_mockapi_and_search/core/config/get_it_config.dart';
import 'package:full_app_with_mockapi_and_search/core/res/app_string.dart';
import 'package:full_app_with_mockapi_and_search/core/res/app_text_style.dart';
import 'package:full_app_with_mockapi_and_search/model/product_model.dart';
import 'package:full_app_with_mockapi_and_search/model/user_login_model.dart';
import 'package:full_app_with_mockapi_and_search/service/auth_service.dart';
import 'package:full_app_with_mockapi_and_search/service/product_serivce.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: core.get<SharedPreferences>().getString('token') == null
            ? SplashScreen()
            : ProductsPage());
  }
}

class ProductsPage extends StatelessWidget {
  List<ProductModel> result = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => History(),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(child: Icon(Icons.menu)),
                ),
              ),
              InkWell(
                onTap: () {
                  core.get<SharedPreferences>().clear();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SplashScreen(),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(child: Icon(Icons.logout)),
                ),
              ),
            ],
          ),
          Text(
            HELLO,
            style: headlineTextStyle,
          ),
          FutureBuilder(
            future: ProductSerivceImpl().getAllProduct(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products =
                    snapshot.data as List<ProductModel>;
                result = products;
                return StatefulBuilder(builder: (context, refresh) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 300,
                              child: TextField(
                                onChanged: (value) {
                                  result = [];
                                  refresh(() {
                                    products.forEach(
                                      (element) {
                                        if (element.title.contains(value)) {
                                          result.add(element);
                                        }
                                      },
                                    );
                                    core
                                        .get<SharedPreferences>()
                                        .setString('last result', value);
                                  });
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Icon(Icons.search)
                        ],
                      ),
                      SizedBox(
                        height: 400,
                        child: GridView.builder(
                          itemCount: result.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                          productModel: result[index]),
                                    ));
                              },
                              child: Card(
                                child: Hero(
                                  tag: result[index].title,
                                  child: Container(
                                    child: Text(result[index].title),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: Image.network(
                                                  result[index].thumbnail)
                                              .image),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  );
                });
              } else {
                return Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 300,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Icon(Icons.search)
                      ],
                    ),
                    LinearProgressIndicator()
                  ],
                );
              }
            },
          )
        ],
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, required this.productModel});
  ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Hero(
              tag: productModel.title,
              child: Image.network(productModel.thumbnail)),
          ListTile(
            title: Text(productModel.title),
            subtitle: Text(productModel.description),
          )
        ],
      ),
    );
  }
}

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(core.get<SharedPreferences>().getString('last result') ??
            "No Result"),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LogInPage(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Text(
          LAZA,
          style: styleOfSplashScreen,
        ),
      ),
    );
  }
}

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 400,
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 400,
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: InkWell(
          onTap: () async {
            bool status = await AuthSeviceImp().logIn(
                UserLoginModel(email: email.text, password: password.text));
            if (status) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductsPage(),
                  ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Failed to Log In"),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
          child: Icon(Icons.send)),
    );
  }
}
