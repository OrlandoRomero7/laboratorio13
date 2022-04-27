import 'package:flutter/material.dart';
import 'package:lab13/pages/mostrar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Estudiante> estudiante = [
    Estudiante(
        "18760462",
        "Orlando Romero Galván",
        "Ing. Sistemas Computacionales",
        "8vo",
        "646-235-48-53",
        "al8760462@ite.edu.mx"),
    Estudiante("18760463", "Juan Ramírez Pérez", "Ing. Industrial", "6to",
        "646-231-55-74", "al18760463@ite.edu.mx"),
    Estudiante("19775315", "Edmundo Meza Portillo", "Ing. Gestión Empresarial",
        "4to", "646-187-45-56", "al19775315@ite.edu.mx")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 233, 57, 115),
          title: const Text("Estudiantes"),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://i.pinimg.com/originals/9e/a9/5e/9ea95e67a35d51a1bf5ac9f1c0bf590d.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView.builder(
              itemCount: estudiante.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    estudiante[index].nombre,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(estudiante[index].carrera),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Mostrar(estudiantes: estudiante[index]),
                      ),
                    );
                  },
                );
              }),
        ));
  }
}

class Estudiante {
  String matricula = "";
  String nombre = "";
  String carrera = "";
  String semestre = "";
  String telefono = "";
  String correo = "";

  Estudiante(this.matricula, this.nombre, this.carrera, this.semestre,
      this.telefono, this.correo);
}
