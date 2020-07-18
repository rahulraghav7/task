import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:task/ui/views/home_viewmodel.dart';
import 'home_viewmodel.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class HomeView extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FutureExampleViewModel>.reactive(
      
      builder: (context,model,child)=>SafeArea(
              child: Scaffold(
          body: Center(
            child:model.isBusy?CircularProgressIndicator():
              
                
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context,index)
                
                {
                  return Center(
                    child: Column(
                      
                      children: <Widget>[
                        
                        GestureDetector(
                          onLongPress: () { 
                            model.selected(index);
                           
                          },
                                          child: Container(
                            color: Colors.blue,
                            width: 250,
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                Center(child: Text('${model.data[index] }  ',style: TextStyle(fontSize: 15),)),
                                Text('you have selected ${model.isselected} ')
                              ],
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                  );
                }),
              
         
          ),
          
          
          ),
          
      ),
       viewModelBuilder: ()=>FutureExampleViewModel());
    

    
  }
}