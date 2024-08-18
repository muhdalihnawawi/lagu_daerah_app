import 'package:flutter/material.dart';
import 'package:lagu_daerah_app/models/province.dart';
import 'package:lagu_daerah_app/pages/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isListView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lagu Daerah', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 2,
        backgroundColor: const Color.fromARGB(255, 34, 73, 105),
        actions: [
          ToggleButtons(
            onPressed: (int index) {
              setState(() {
                isListView = index == 0;
              });
            },
            isSelected: [isListView, !isListView],
            color: const Color.fromARGB(255, 195, 187, 187),
            selectedColor: const Color.fromARGB(255, 227, 223, 223),
            children: const <Widget>[
              Icon(Icons.list),
              Icon(Icons.grid_on),
            ],
          ),
        ],
      ),
      body: isListView
          ? ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailPage(
                        province: laguDaerahList[index],
                      );
                    }));
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(laguDaerahList[index].laguDaerah),
                      subtitle: Text(
                          '${laguDaerahList[index].nama} - ${laguDaerahList[index].ibuKota}'),
                      leading: Image.network(
                        laguDaerahList[index].photo,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              itemCount: laguDaerahList.length,
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemCount: laguDaerahList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailPage(
                        province: laguDaerahList[index],
                      );
                    }));
                  },
                  child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Image.network(
                          laguDaerahList[index].photo,
                          height: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 6),
                      ListTile(
                        title: Text(laguDaerahList[index].laguDaerah),
                        subtitle: Text(
                            '${laguDaerahList[index].nama} - ${laguDaerahList[index].ibuKota}'),
                      ),
                    ],
                  ),
                ),
                );
              },
            ),
      );        
  }
  }



















