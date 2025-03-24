//
//  TestCoreDataManager.swift
//  SwiftUICombineUnitTesting
//
//  Created by 김동현 on 3/25/25.
//

import Foundation
import CoreData

final class TestCoreDataManager {
    static let shared = TestCoreDataManager()

    let persistentContainer: NSPersistentContainer

    private init() {
        persistentContainer = NSPersistentContainer(name: "UserModel") // 모델 이름과 일치시켜야 함!

        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType

        persistentContainer.persistentStoreDescriptions = [description]

        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("❌ CoreData In-Memory 초기화 실패: \(error)")
            }
        }
    }

    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
}
