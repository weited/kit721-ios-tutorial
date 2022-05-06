//
//  Movie.swift
//  tutorial8
//
//  Created by mobiledev on 7/5/2022.
//

import Foundation

import Firebase
import FirebaseFirestoreSwift

public struct Movie : Codable
{
    @DocumentID var id:String?
    var title:String
    var year:Int32
    var duration:Float
}
