import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// MyApp: Punto de entrada principal de la aplicación
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil de Usuario',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UserProfileScreen(),
    );
  }
}

// UserProfileScreen: Pantalla principal del perfil de usuario
class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MediaQuery para adaptarse al tamaño y orientación de la pantalla
    final screenSize = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de Usuario'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsScreen())),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(screenSize, isLandscape),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) =>
                  _responsiveLayout(constraints, context),
            ),
          ],
        ),
      ),
    );
  }

  // _buildProfileHeader: Construye el encabezado del perfil con imagen y texto
  Widget _buildProfileHeader(Size screenSize, bool isLandscape) {
    double imageSize =
        isLandscape ? screenSize.width * 0.15 : screenSize.height * 0.15;
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: imageSize,
            backgroundImage: NetworkImage(
                'https://scontent.floh1-1.fna.fbcdn.net/v/t1.6435-9/119461503_789273268550931_1930354509684210250_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=be3454&_nc_ohc=mCVpUJMl8I0AX-2iIX3&_nc_oc=AQlkH09C9i-JzOTe1s-5jaSMD3PPi-eRZ_owEMfhgQGYoYiXYDvrwlIAjnYlE8NyqoU&_nc_ht=scontent.floh1-1.fna&oh=00_AfBVuO2Ik1DJte3x1_wvIY-KumpAVeAXoC1PMceZI4HxHQ&oe=65CD798D'),
          ),
          SizedBox(height: 10),
          Text("Nombre del Usuario",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text("Correo electrónico", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  // _responsiveLayout: Ajusta el diseño según el tamaño de la pantalla
  Widget _responsiveLayout(BoxConstraints constraints, BuildContext context) {
    if (constraints.maxWidth > 600) {
      return _buildWideLayout(context);
    } else {
      return _buildNarrowLayout(context);
    }
  }

  // _buildWideLayout: Diseño para pantallas anchas
  Widget _buildWideLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _buildProfileOptions(context),
    );
  }

  // _buildNarrowLayout: Diseño para pantallas estrechas
  Widget _buildNarrowLayout(BuildContext context) {
    return Column(
      children: _buildProfileOptions(context),
    );
  }

  // _buildProfileOptions: Construye una lista de opciones para el perfil
  List<Widget> _buildProfileOptions(BuildContext context) {
    return [
      ProfileOption(
          title: "Editar Perfil",
          icon: Icons.edit,
          onTap: () {
            /* Acción /}),
ProfileOption(title: "Configuración", icon: Icons.settings, onTap: () {/ Acción /}),
ProfileOption(title: "Cerrar Sesión", icon: Icons.exit_to_app, onTap: () {/ Acción */
          }),
    ];
  }
}

// ProfileOption: Widget para las opciones del perfil
class ProfileOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  ProfileOption({required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 24),
            SizedBox(width: 10),
            Text(title),
          ],
        ),
      ),
    );
  }
}

// SettingsScreen: Pantalla de configuraciones
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuraciones"),
      ),
      body: Center(
        child: Text("Pantalla de Configuraciones"),
      ),
    );
  }
}
