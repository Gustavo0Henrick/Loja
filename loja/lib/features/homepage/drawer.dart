import 'package:flutter/material.dart';
import 'package:loja/src/core/colors.dart';
import 'package:loja/src/core/routes.dart';
import 'package:loja/src/pages/profile/editprofile.dart';
import 'package:loja/features/homepage/homepage.dart';

class NavDrawer extends StatelessWidget {
  final String name;
  final String email;
  final int id;

  const NavDrawer({Key key, this.name, this.email, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    CustomColors.yellow,
                    CustomColors.orangeMain,
                  ]),
            ),
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 10),
                    child: Text(
                      email,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text('Pagina Inicial'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => HomePage(id: id),
                  ));
            },
          ),
          ListTile(
            title: Text('Historico de Compras'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Favoritos'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(' Editar Perfil'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (builder) => EditProfile(id: id)));
            },
          ),
          ListTile(
            title: Text('Configurações'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Sair',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => CustomRoutes.loginpage));
            },
          ),
        ],
      ),
    );
  }
}
