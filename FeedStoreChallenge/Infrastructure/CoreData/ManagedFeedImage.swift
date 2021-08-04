//
//  ManagedFeedImage.swift
//  FeedStoreChallenge
//
//  Created by Avelino Rodrigues on 04/08/2021.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import CoreData

@objc(ManagedFeedImage)
internal class ManagedFeedImage: NSManagedObject {
	@NSManaged internal var id: UUID
	@NSManaged internal var imageDescription: String?
	@NSManaged internal var imageLocation: String?
	@NSManaged internal var url: URL
	@NSManaged internal var cache: ManagedCache

	internal static func images(from localFeed: [LocalFeedImage], in context: NSManagedObjectContext) -> NSOrderedSet {
		NSOrderedSet(array: localFeed.map { local in
			let managed = ManagedFeedImage(context: context)
			managed.id = local.id
			managed.imageDescription = local.description
			managed.imageLocation = local.location
			managed.url = local.url
			return managed
		})
	}

	internal var local: LocalFeedImage {
		return LocalFeedImage(id: id, description: imageDescription, location: imageLocation, url: url)
	}
}
