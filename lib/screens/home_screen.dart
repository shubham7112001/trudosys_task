
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trudosys/models/data_model.dart';
import 'package:trudosys/providers/home_screen_provider.dart';
import 'package:trudosys/screens/user_screen.dart';
import 'package:trudosys/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<Datum>? paginatedData;
  HomeScreenProvider? homeScreenProvider;
  // var scrollController = ScrollController();

  // void pagination() {
  //   if ((scrollController.position.pixels ==
  //       scrollController.position.maxScrollExtent) && (paginatedData!.length <= homeScreenProvider!.apiList.length)) {
  //     setState(() {
  //       homeScreenProvider!.isLoading = true;
  //
  //     });
  //   }
  // }

  @override
  void initState() {
    // scrollController.addListener(pagination);
    super.initState();
    homeScreenProvider = Provider.of<HomeScreenProvider>(context,listen: false);
    homeScreenProvider?.fetchData();

  }

  @override
  Widget build(BuildContext context) {
    homeScreenProvider = context.watch();
    return ChangeNotifierProvider<HomeScreenProvider>(
      create: (context) => HomeScreenProvider(),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Trudosys',
            style: TextStyle(color: AppColors.appMainColor),
          ),
          centerTitle: true,
        ),
        body: homeScreenProvider!.isLoading
        ?const Center(child: CircularProgressIndicator(
          color: AppColors.appMainColor,
        ))
        :Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: homeScreenProvider!.apiList.length,
                  itemBuilder: ((context, index) => GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>UserScreen(model: homeScreenProvider!.apiList[index]))
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal:8,vertical:8),
                      decoration: const BoxDecoration(
                        color: AppColors.appMainColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),

                      child: ListTile(

                        // tileColor: AppColors.appMainColor,
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(homeScreenProvider!.apiList[index].avatar.toString()),
                          backgroundColor: Colors.greenAccent,
                          radius: 30,
                        ),
                            title: Text("${homeScreenProvider!.apiList[index].firstName} ${homeScreenProvider!.apiList[index].lastName}",style: const TextStyle(color: Colors.white),),
                            subtitle: Text(homeScreenProvider!.apiList[index].email.toString(),style: const TextStyle(color: Colors.white)),
                          ),
                    ),
                  ))),
            ),
            if(homeScreenProvider!.hasNextPage)
              ElevatedButton(
                onPressed: ()=>homeScreenProvider!.fetchData(),
                child: const Text('Load More',style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.appMainColor,

                ),
              ),
          ],
        )
         )
      );
  }
}
