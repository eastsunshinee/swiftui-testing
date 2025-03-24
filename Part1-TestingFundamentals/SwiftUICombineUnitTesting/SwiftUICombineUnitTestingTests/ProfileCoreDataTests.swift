//
//  ProfileCoreDataTests.swift
//  SwiftUICombineUnitTestingTests
//
//  Created by 김동현 on 3/25/25.
//

import XCTest
import CoreData
@testable import SwiftUICombineUnitTesting

final class ProfileCoreDataTests: XCTestCase {

    func testSaveAndFetchUser_FromInMemoryStore() {
        let context = TestCoreDataManager.shared.context
        let user = UserEntity(context: context)
        user.id = UUID()
        user.name = "Lisa"

        try? context.save()

        let fetchRequest: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        fetchRequest.fetchLimit = 1

        let result = try? context.fetch(fetchRequest)
        XCTAssertEqual(result?.first?.name, "Lisa")
    }
}
