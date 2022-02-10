//
//  Note.swift
//  praxis-domain
//
//  Created by Anmol Verma on 10/02/22.
//

import Foundation

public class Note : Identifiable{
    public var id: UUID
    public var note: String
    public var date: Date
    
    public init(id: UUID, note:String, date:Date){
        self.id = id
        self.note = note
        self.date = date
    }
}
