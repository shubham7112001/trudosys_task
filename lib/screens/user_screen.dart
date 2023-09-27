import 'package:flutter/material.dart';
import 'package:trudosys/models/data_model.dart';
import 'package:trudosys/utils/colors.dart';

class UserScreen extends StatefulWidget {
  final Datum model;
  const UserScreen({required this.model, super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Detail',
          style: TextStyle(color: AppColors.appMainColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.appMainColor,
              image: DecorationImage(
                image: NetworkImage(widget.model.avatar.toString()),
                fit: BoxFit.fill
              )
            ),

          ),
          SizedBox(height: 20,),
          Text("${widget.model.firstName} ${widget.model.lastName}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Text("${widget.model.email}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
