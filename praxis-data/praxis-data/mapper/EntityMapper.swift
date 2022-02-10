//
//  EntityMapper.swift
//  praxis-data
//
//  Created by Anmol Verma on 10/02/22.
//

import Foundation
import praxis_domain

public class EntityMapper<DataLayer,Domain> {
    func mapToDomain(data:DataLayer) -> Domain {
     abort()
    }
    func mapToData(domain:Domain) -> DataLayer {
        abort()
    }
}


public class NoteEntityMapper : EntityMapper<NoteEntity,Note>{
    
    public override init() {
        
    }
    
    public  override func mapToData(domain: Note) -> NoteEntity {
        let entity = NoteEntity()
        entity.id = domain.id
        entity.timestamp = domain.date
        entity.note = domain.note
        return entity
    }
    
    public  override func mapToDomain(data: NoteEntity) -> Note {
        return Note(id: data.id ?? UUID.init(), note: data.note ?? "NA", date: data.timestamp ?? Date())
    }
    
}
