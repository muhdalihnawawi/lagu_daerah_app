// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:lagu_daerah_app/models/province.dart';

class DetailPage extends StatefulWidget {
  final Province province;
  const DetailPage({
    Key? key,
    required this.province,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.province.nama),
        elevation: 20,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(widget.province.laguDaerah, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '${widget.province.nama} - ${widget.province.ibuKota}',
            textAlign: TextAlign.center,),
          const SizedBox(
            height: 12,
          ),
          Image.network(widget.province.photo, height: 300,),
          const SizedBox(height: 12,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 235, 235, 233),
              borderRadius: BorderRadius.all(Radius.circular(35))
            ),
            
            
            child: Text(
              widget.province.lirikLaguDaerah,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
              ),
          ),
        ],
      ),
    );
  }
}
