//
//  ViewController.swift
//  tutorial8
//
//  Created by mobiledev on 7/5/2022.
//
import Firebase
import FirebaseFirestoreSwift
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let db = Firestore.firestore()
        print("\nINITIALIZED FIRESTORE APP \(db.app.name)\n")
        
        
        
        let movieCollection = db.collection("movies")
//        let matrix = Movie(title: "Lord of the Rings", year: 2001, duration: 9001)
//        do {
//            try movieCollection.addDocument(from: matrix, completion: { (err) in
//                if let err = err {
//                    print("Error adding document: \(err)")
//                } else {
//                    print("Successfully created movie")
//                }
//            })
//        } catch let error {
//            print("Error writing city to Firestore: \(error)")
//        }
        
        movieCollection.getDocuments() { (result, err) in
          //check for server error
          if let err = err
          {
              print("Error getting documents: \(err)")
          }
          else
          {
              //loop through the results
              for document in result!.documents
              {
                  //attempt to convert to Movie object
                  let conversionResult = Result
                  {
                      try document.data(as: Movie.self)
                  }

                  //check if conversionResult is success or failure (i.e. was an exception/error thrown?
                  switch conversionResult
                  {
                      //no problems (but could still be nil)
                      case .success(let movie):
                          
                              // A `Movie` value was successfully initialized from the DocumentSnapshot.
                              print("Movie: \(movie)")
                          
//                          else
//                          {
//                              // A nil value was successfully initialized from the DocumentSnapshot,
//                              // or the DocumentSnapshot was nil.
//                              print("Document does not exist")
//                          }
                      case .failure(let error):
                          // A `Movie` value could not be initialized from the DocumentSnapshot.
                          print("Error decoding movie: \(error)")
                  }
              }
          }
        }
    }


}

