import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

///Helper functions for cloud-related operations
class TCloudHelperFunctions{
  //Helper function to check the stae of a single database record
  //Returns a widget based on the state of the snapshot
  //If data is still loading, it returns a CircularProgressIndicator
  //If no data is foun, it returns a generic "No Data found" message
  //If an error occurs, it returns a generic error message
  //Otherwise, it returns null
  static Widget? checkSingleRecordSate<T>(AsyncSnapshot<T> snapshot){
    if (snapshot.connectionState == ConnectionState.waiting){
      return const Center(child: CircularProgressIndicator());
    }
    if(!snapshot.hasData || snapshot.data == null ){
                return const Center(child: Text('No Data Found!'));
              }
              if(snapshot.hasError){
                return const Center(child: Text('Something went wrong.'));
              }   
              return  null;
  }
    //Helper function to check the stae of multiple(List) database record
  //Returns a widget based on the state of the snapshot
  //If data is still loading, it returns a CircularProgressIndicator
  //If no data is foun, it returns a generic "No Data found" message
  //If an error occurs, it returns a generic error message
  //Otherwise, it returns null
    static Widget? checkMultiRecordSate<T>(
      {required AsyncSnapshot<List<T>> snapshot,Widget? loader,Widget? error,Widget? nothingFound}
      ){
    if (snapshot.connectionState == ConnectionState.waiting){
      if (loader != null) return loader;
      return const Center(child: CircularProgressIndicator());
    }
    if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
if(nothingFound != null) return nothingFound;

                return const Center(child: Text('No Data Found!'));
              }
              if(snapshot.hasError){
                if(error!= null) return error;
                return const Center(child: Text('Something went wrong.'));
              }

   
              return  null;
            
  }
   //Create a reference with an initial file path and name and retrieve the download URL
   static Future<String> getURLFromFilePathAndName(String path) async{
    try{
      if(path.isEmpty) return '';
final ref = FirebaseStorage.instance.ref().child(path);
final url = await ref.getDownloadURL();
return url;
    } on FirebaseException catch(e){
      throw e.message!;

    } on PlatformException catch(e){
            throw e.message!;

    } catch(e){
      throw 'Something went wrong.';
    }
   }
}