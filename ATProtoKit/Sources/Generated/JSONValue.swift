public indirect enum JSONValue: Codable, ATProtocolCodable, ATProtocolValue {
    case custom(any ATProtocolValue)
    case string(String)
    case number(Int)
    case bigNumber(String)
    case object([String: JSONValue])
    case array([JSONValue])
    case bool(Bool)
    case null
    case link(ATProtoLink)
    case bytes(Bytes)
    case unknownType(String, JSONValue)
    case decodeError(String)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
        if let typeName = container.allKeys.first(where: { $0.stringValue == "$type" }),
           let typeValue = try? container.decode(String.self, forKey: typeName) {
            
        print("Attempting to decode type: \(typeValue)")

        switch typeValue {
            
            case "app.bsky.embed.record":
                print("Attempting to decode type: \(typeValue) as AppBskyEmbedRecord")
                do {
                    let decodedObject = try AppBskyEmbedRecord.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyEmbedRecord")
                } catch {
                    print("Error decoding AppBskyEmbedRecord: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedRecord: \(error)")
                }
            
            case "app.bsky.embed.record#view":
                print("Attempting to decode type: \(typeValue) as AppBskyEmbedRecord.View")
                do {
                    let decodedObject = try AppBskyEmbedRecord.View.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyEmbedRecord.View")
                } catch {
                    print("Error decoding AppBskyEmbedRecord.View: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedRecord.View: \(error)")
                }
            
            case "app.bsky.embed.record#viewRecord":
                print("Attempting to decode type: \(typeValue) as AppBskyEmbedRecord.ViewRecord")
                do {
                    let decodedObject = try AppBskyEmbedRecord.ViewRecord.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyEmbedRecord.ViewRecord")
                } catch {
                    print("Error decoding AppBskyEmbedRecord.ViewRecord: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedRecord.ViewRecord: \(error)")
                }
            
            case "app.bsky.embed.record#viewNotFound":
                print("Attempting to decode type: \(typeValue) as AppBskyEmbedRecord.ViewNotFound")
                do {
                    let decodedObject = try AppBskyEmbedRecord.ViewNotFound.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyEmbedRecord.ViewNotFound")
                } catch {
                    print("Error decoding AppBskyEmbedRecord.ViewNotFound: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedRecord.ViewNotFound: \(error)")
                }
            
            case "app.bsky.embed.record#viewBlocked":
                print("Attempting to decode type: \(typeValue) as AppBskyEmbedRecord.ViewBlocked")
                do {
                    let decodedObject = try AppBskyEmbedRecord.ViewBlocked.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyEmbedRecord.ViewBlocked")
                } catch {
                    print("Error decoding AppBskyEmbedRecord.ViewBlocked: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedRecord.ViewBlocked: \(error)")
                }
            
            case "app.bsky.embed.images":
                print("Attempting to decode type: \(typeValue) as AppBskyEmbedImages")
                do {
                    let decodedObject = try AppBskyEmbedImages.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyEmbedImages")
                } catch {
                    print("Error decoding AppBskyEmbedImages: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedImages: \(error)")
                }
            
            case "app.bsky.embed.images#image":
                print("Attempting to decode type: \(typeValue) as AppBskyEmbedImages.Image")
                do {
                    let decodedObject = try AppBskyEmbedImages.Image.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyEmbedImages.Image")
                } catch {
                    print("Error decoding AppBskyEmbedImages.Image: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedImages.Image: \(error)")
                }
            
            case "app.bsky.embed.images#aspectRatio":
                print("Attempting to decode type: \(typeValue) as AppBskyEmbedImages.AspectRatio")
                do {
                    let decodedObject = try AppBskyEmbedImages.AspectRatio.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyEmbedImages.AspectRatio")
                } catch {
                    print("Error decoding AppBskyEmbedImages.AspectRatio: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedImages.AspectRatio: \(error)")
                }
            
            case "app.bsky.embed.images#view":
                print("Attempting to decode type: \(typeValue) as AppBskyEmbedImages.View")
                do {
                    let decodedObject = try AppBskyEmbedImages.View.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyEmbedImages.View")
                } catch {
                    print("Error decoding AppBskyEmbedImages.View: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedImages.View: \(error)")
                }
            
            case "app.bsky.embed.images#viewImage":
                print("Attempting to decode type: \(typeValue) as AppBskyEmbedImages.ViewImage")
                do {
                    let decodedObject = try AppBskyEmbedImages.ViewImage.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyEmbedImages.ViewImage")
                } catch {
                    print("Error decoding AppBskyEmbedImages.ViewImage: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedImages.ViewImage: \(error)")
                }
            
            case "app.bsky.embed.recordWithMedia":
                print("Attempting to decode type: \(typeValue) as AppBskyEmbedRecordWithMedia")
                do {
                    let decodedObject = try AppBskyEmbedRecordWithMedia.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyEmbedRecordWithMedia")
                } catch {
                    print("Error decoding AppBskyEmbedRecordWithMedia: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedRecordWithMedia: \(error)")
                }
            
            case "app.bsky.embed.recordWithMedia#view":
                print("Attempting to decode type: \(typeValue) as AppBskyEmbedRecordWithMedia.View")
                do {
                    let decodedObject = try AppBskyEmbedRecordWithMedia.View.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyEmbedRecordWithMedia.View")
                } catch {
                    print("Error decoding AppBskyEmbedRecordWithMedia.View: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedRecordWithMedia.View: \(error)")
                }
            
            case "app.bsky.embed.external":
                print("Attempting to decode type: \(typeValue) as AppBskyEmbedExternal")
                do {
                    let decodedObject = try AppBskyEmbedExternal.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyEmbedExternal")
                } catch {
                    print("Error decoding AppBskyEmbedExternal: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedExternal: \(error)")
                }
            
            case "app.bsky.embed.external#external":
                print("Attempting to decode type: \(typeValue) as AppBskyEmbedExternal.External")
                do {
                    let decodedObject = try AppBskyEmbedExternal.External.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyEmbedExternal.External")
                } catch {
                    print("Error decoding AppBskyEmbedExternal.External: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedExternal.External: \(error)")
                }
            
            case "app.bsky.embed.external#view":
                print("Attempting to decode type: \(typeValue) as AppBskyEmbedExternal.View")
                do {
                    let decodedObject = try AppBskyEmbedExternal.View.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyEmbedExternal.View")
                } catch {
                    print("Error decoding AppBskyEmbedExternal.View: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedExternal.View: \(error)")
                }
            
            case "app.bsky.embed.external#viewExternal":
                print("Attempting to decode type: \(typeValue) as AppBskyEmbedExternal.ViewExternal")
                do {
                    let decodedObject = try AppBskyEmbedExternal.ViewExternal.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyEmbedExternal.ViewExternal")
                } catch {
                    print("Error decoding AppBskyEmbedExternal.ViewExternal: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedExternal.ViewExternal: \(error)")
                }
            
            case "app.bsky.notification.listNotifications#notification":
                print("Attempting to decode type: \(typeValue) as AppBskyNotificationListNotifications.Notification")
                do {
                    let decodedObject = try AppBskyNotificationListNotifications.Notification.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyNotificationListNotifications.Notification")
                } catch {
                    print("Error decoding AppBskyNotificationListNotifications.Notification: \(error)")
                    self = .decodeError("Error decoding AppBskyNotificationListNotifications.Notification: \(error)")
                }
            
            case "app.bsky.unspecced.defs#skeletonSearchPost":
                print("Attempting to decode type: \(typeValue) as AppBskyUnspeccedDefs.SkeletonSearchPost")
                do {
                    let decodedObject = try AppBskyUnspeccedDefs.SkeletonSearchPost.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyUnspeccedDefs.SkeletonSearchPost")
                } catch {
                    print("Error decoding AppBskyUnspeccedDefs.SkeletonSearchPost: \(error)")
                    self = .decodeError("Error decoding AppBskyUnspeccedDefs.SkeletonSearchPost: \(error)")
                }
            
            case "app.bsky.unspecced.defs#skeletonSearchActor":
                print("Attempting to decode type: \(typeValue) as AppBskyUnspeccedDefs.SkeletonSearchActor")
                do {
                    let decodedObject = try AppBskyUnspeccedDefs.SkeletonSearchActor.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyUnspeccedDefs.SkeletonSearchActor")
                } catch {
                    print("Error decoding AppBskyUnspeccedDefs.SkeletonSearchActor: \(error)")
                    self = .decodeError("Error decoding AppBskyUnspeccedDefs.SkeletonSearchActor: \(error)")
                }
            
            case "app.bsky.graph.block":
                print("Attempting to decode type: \(typeValue) as AppBskyGraphBlock")
                do {
                    let decodedObject = try AppBskyGraphBlock.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyGraphBlock")
                } catch {
                    print("Error decoding AppBskyGraphBlock: \(error)")
                    self = .decodeError("Error decoding AppBskyGraphBlock: \(error)")
                }
            
            case "app.bsky.graph.follow":
                print("Attempting to decode type: \(typeValue) as AppBskyGraphFollow")
                do {
                    let decodedObject = try AppBskyGraphFollow.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyGraphFollow")
                } catch {
                    print("Error decoding AppBskyGraphFollow: \(error)")
                    self = .decodeError("Error decoding AppBskyGraphFollow: \(error)")
                }
            
            case "app.bsky.graph.defs#listViewBasic":
                print("Attempting to decode type: \(typeValue) as AppBskyGraphDefs.ListViewBasic")
                do {
                    let decodedObject = try AppBskyGraphDefs.ListViewBasic.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyGraphDefs.ListViewBasic")
                } catch {
                    print("Error decoding AppBskyGraphDefs.ListViewBasic: \(error)")
                    self = .decodeError("Error decoding AppBskyGraphDefs.ListViewBasic: \(error)")
                }
            
            case "app.bsky.graph.defs#listView":
                print("Attempting to decode type: \(typeValue) as AppBskyGraphDefs.ListView")
                do {
                    let decodedObject = try AppBskyGraphDefs.ListView.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyGraphDefs.ListView")
                } catch {
                    print("Error decoding AppBskyGraphDefs.ListView: \(error)")
                    self = .decodeError("Error decoding AppBskyGraphDefs.ListView: \(error)")
                }
            
            case "app.bsky.graph.defs#listItemView":
                print("Attempting to decode type: \(typeValue) as AppBskyGraphDefs.ListItemView")
                do {
                    let decodedObject = try AppBskyGraphDefs.ListItemView.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyGraphDefs.ListItemView")
                } catch {
                    print("Error decoding AppBskyGraphDefs.ListItemView: \(error)")
                    self = .decodeError("Error decoding AppBskyGraphDefs.ListItemView: \(error)")
                }
            
            case "app.bsky.graph.defs#listViewerState":
                print("Attempting to decode type: \(typeValue) as AppBskyGraphDefs.ListViewerState")
                do {
                    let decodedObject = try AppBskyGraphDefs.ListViewerState.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyGraphDefs.ListViewerState")
                } catch {
                    print("Error decoding AppBskyGraphDefs.ListViewerState: \(error)")
                    self = .decodeError("Error decoding AppBskyGraphDefs.ListViewerState: \(error)")
                }
            
            case "app.bsky.graph.listblock":
                print("Attempting to decode type: \(typeValue) as AppBskyGraphListblock")
                do {
                    let decodedObject = try AppBskyGraphListblock.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyGraphListblock")
                } catch {
                    print("Error decoding AppBskyGraphListblock: \(error)")
                    self = .decodeError("Error decoding AppBskyGraphListblock: \(error)")
                }
            
            case "app.bsky.graph.listitem":
                print("Attempting to decode type: \(typeValue) as AppBskyGraphListitem")
                do {
                    let decodedObject = try AppBskyGraphListitem.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyGraphListitem")
                } catch {
                    print("Error decoding AppBskyGraphListitem: \(error)")
                    self = .decodeError("Error decoding AppBskyGraphListitem: \(error)")
                }
            
            case "app.bsky.graph.list":
                print("Attempting to decode type: \(typeValue) as AppBskyGraphList")
                do {
                    let decodedObject = try AppBskyGraphList.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyGraphList")
                } catch {
                    print("Error decoding AppBskyGraphList: \(error)")
                    self = .decodeError("Error decoding AppBskyGraphList: \(error)")
                }
            
            case "app.bsky.feed.generator":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedGenerator")
                do {
                    let decodedObject = try AppBskyFeedGenerator.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedGenerator")
                } catch {
                    print("Error decoding AppBskyFeedGenerator: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedGenerator: \(error)")
                }
            
            case "app.bsky.feed.defs#postView":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedDefs.PostView")
                do {
                    let decodedObject = try AppBskyFeedDefs.PostView.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedDefs.PostView")
                } catch {
                    print("Error decoding AppBskyFeedDefs.PostView: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.PostView: \(error)")
                }
            
            case "app.bsky.feed.defs#viewerState":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedDefs.ViewerState")
                do {
                    let decodedObject = try AppBskyFeedDefs.ViewerState.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedDefs.ViewerState")
                } catch {
                    print("Error decoding AppBskyFeedDefs.ViewerState: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.ViewerState: \(error)")
                }
            
            case "app.bsky.feed.defs#feedViewPost":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedDefs.FeedViewPost")
                do {
                    let decodedObject = try AppBskyFeedDefs.FeedViewPost.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedDefs.FeedViewPost")
                } catch {
                    print("Error decoding AppBskyFeedDefs.FeedViewPost: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.FeedViewPost: \(error)")
                }
            
            case "app.bsky.feed.defs#replyRef":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedDefs.ReplyRef")
                do {
                    let decodedObject = try AppBskyFeedDefs.ReplyRef.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedDefs.ReplyRef")
                } catch {
                    print("Error decoding AppBskyFeedDefs.ReplyRef: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.ReplyRef: \(error)")
                }
            
            case "app.bsky.feed.defs#reasonRepost":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedDefs.ReasonRepost")
                do {
                    let decodedObject = try AppBskyFeedDefs.ReasonRepost.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedDefs.ReasonRepost")
                } catch {
                    print("Error decoding AppBskyFeedDefs.ReasonRepost: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.ReasonRepost: \(error)")
                }
            
            case "app.bsky.feed.defs#threadViewPost":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedDefs.ThreadViewPost")
                do {
                    let decodedObject = try AppBskyFeedDefs.ThreadViewPost.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedDefs.ThreadViewPost")
                } catch {
                    print("Error decoding AppBskyFeedDefs.ThreadViewPost: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.ThreadViewPost: \(error)")
                }
            
            case "app.bsky.feed.defs#notFoundPost":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedDefs.NotFoundPost")
                do {
                    let decodedObject = try AppBskyFeedDefs.NotFoundPost.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedDefs.NotFoundPost")
                } catch {
                    print("Error decoding AppBskyFeedDefs.NotFoundPost: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.NotFoundPost: \(error)")
                }
            
            case "app.bsky.feed.defs#blockedPost":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedDefs.BlockedPost")
                do {
                    let decodedObject = try AppBskyFeedDefs.BlockedPost.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedDefs.BlockedPost")
                } catch {
                    print("Error decoding AppBskyFeedDefs.BlockedPost: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.BlockedPost: \(error)")
                }
            
            case "app.bsky.feed.defs#blockedAuthor":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedDefs.BlockedAuthor")
                do {
                    let decodedObject = try AppBskyFeedDefs.BlockedAuthor.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedDefs.BlockedAuthor")
                } catch {
                    print("Error decoding AppBskyFeedDefs.BlockedAuthor: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.BlockedAuthor: \(error)")
                }
            
            case "app.bsky.feed.defs#generatorView":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedDefs.GeneratorView")
                do {
                    let decodedObject = try AppBskyFeedDefs.GeneratorView.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedDefs.GeneratorView")
                } catch {
                    print("Error decoding AppBskyFeedDefs.GeneratorView: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.GeneratorView: \(error)")
                }
            
            case "app.bsky.feed.defs#generatorViewerState":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedDefs.GeneratorViewerState")
                do {
                    let decodedObject = try AppBskyFeedDefs.GeneratorViewerState.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedDefs.GeneratorViewerState")
                } catch {
                    print("Error decoding AppBskyFeedDefs.GeneratorViewerState: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.GeneratorViewerState: \(error)")
                }
            
            case "app.bsky.feed.defs#skeletonFeedPost":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedDefs.SkeletonFeedPost")
                do {
                    let decodedObject = try AppBskyFeedDefs.SkeletonFeedPost.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedDefs.SkeletonFeedPost")
                } catch {
                    print("Error decoding AppBskyFeedDefs.SkeletonFeedPost: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.SkeletonFeedPost: \(error)")
                }
            
            case "app.bsky.feed.defs#skeletonReasonRepost":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedDefs.SkeletonReasonRepost")
                do {
                    let decodedObject = try AppBskyFeedDefs.SkeletonReasonRepost.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedDefs.SkeletonReasonRepost")
                } catch {
                    print("Error decoding AppBskyFeedDefs.SkeletonReasonRepost: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.SkeletonReasonRepost: \(error)")
                }
            
            case "app.bsky.feed.defs#threadgateView":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedDefs.ThreadgateView")
                do {
                    let decodedObject = try AppBskyFeedDefs.ThreadgateView.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedDefs.ThreadgateView")
                } catch {
                    print("Error decoding AppBskyFeedDefs.ThreadgateView: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.ThreadgateView: \(error)")
                }
            
            case "app.bsky.feed.getLikes#like":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedGetLikes.Like")
                do {
                    let decodedObject = try AppBskyFeedGetLikes.Like.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedGetLikes.Like")
                } catch {
                    print("Error decoding AppBskyFeedGetLikes.Like: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedGetLikes.Like: \(error)")
                }
            
            case "app.bsky.feed.threadgate":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedThreadgate")
                do {
                    let decodedObject = try AppBskyFeedThreadgate.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedThreadgate")
                } catch {
                    print("Error decoding AppBskyFeedThreadgate: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedThreadgate: \(error)")
                }
            
            case "app.bsky.feed.threadgate#mentionRule":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedThreadgate.MentionRule")
                do {
                    let decodedObject = try AppBskyFeedThreadgate.MentionRule.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedThreadgate.MentionRule")
                } catch {
                    print("Error decoding AppBskyFeedThreadgate.MentionRule: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedThreadgate.MentionRule: \(error)")
                }
            
            case "app.bsky.feed.threadgate#followingRule":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedThreadgate.FollowingRule")
                do {
                    let decodedObject = try AppBskyFeedThreadgate.FollowingRule.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedThreadgate.FollowingRule")
                } catch {
                    print("Error decoding AppBskyFeedThreadgate.FollowingRule: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedThreadgate.FollowingRule: \(error)")
                }
            
            case "app.bsky.feed.threadgate#listRule":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedThreadgate.ListRule")
                do {
                    let decodedObject = try AppBskyFeedThreadgate.ListRule.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedThreadgate.ListRule")
                } catch {
                    print("Error decoding AppBskyFeedThreadgate.ListRule: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedThreadgate.ListRule: \(error)")
                }
            
            case "app.bsky.feed.like":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedLike")
                do {
                    let decodedObject = try AppBskyFeedLike.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedLike")
                } catch {
                    print("Error decoding AppBskyFeedLike: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedLike: \(error)")
                }
            
            case "app.bsky.feed.repost":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedRepost")
                do {
                    let decodedObject = try AppBskyFeedRepost.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedRepost")
                } catch {
                    print("Error decoding AppBskyFeedRepost: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedRepost: \(error)")
                }
            
            case "app.bsky.feed.describeFeedGenerator#feed":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedDescribeFeedGenerator.Feed")
                do {
                    let decodedObject = try AppBskyFeedDescribeFeedGenerator.Feed.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedDescribeFeedGenerator.Feed")
                } catch {
                    print("Error decoding AppBskyFeedDescribeFeedGenerator.Feed: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDescribeFeedGenerator.Feed: \(error)")
                }
            
            case "app.bsky.feed.describeFeedGenerator#links":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedDescribeFeedGenerator.Links")
                do {
                    let decodedObject = try AppBskyFeedDescribeFeedGenerator.Links.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedDescribeFeedGenerator.Links")
                } catch {
                    print("Error decoding AppBskyFeedDescribeFeedGenerator.Links: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDescribeFeedGenerator.Links: \(error)")
                }
            
            case "app.bsky.feed.post":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedPost")
                do {
                    let decodedObject = try AppBskyFeedPost.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedPost")
                } catch {
                    print("Error decoding AppBskyFeedPost: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedPost: \(error)")
                }
            
            case "app.bsky.feed.post#replyRef":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedPost.ReplyRef")
                do {
                    let decodedObject = try AppBskyFeedPost.ReplyRef.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedPost.ReplyRef")
                } catch {
                    print("Error decoding AppBskyFeedPost.ReplyRef: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedPost.ReplyRef: \(error)")
                }
            
            case "app.bsky.feed.post#entity":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedPost.Entity")
                do {
                    let decodedObject = try AppBskyFeedPost.Entity.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedPost.Entity")
                } catch {
                    print("Error decoding AppBskyFeedPost.Entity: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedPost.Entity: \(error)")
                }
            
            case "app.bsky.feed.post#textSlice":
                print("Attempting to decode type: \(typeValue) as AppBskyFeedPost.TextSlice")
                do {
                    let decodedObject = try AppBskyFeedPost.TextSlice.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyFeedPost.TextSlice")
                } catch {
                    print("Error decoding AppBskyFeedPost.TextSlice: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedPost.TextSlice: \(error)")
                }
            
            case "app.bsky.richtext.facet":
                print("Attempting to decode type: \(typeValue) as AppBskyRichtextFacet")
                do {
                    let decodedObject = try AppBskyRichtextFacet.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyRichtextFacet")
                } catch {
                    print("Error decoding AppBskyRichtextFacet: \(error)")
                    self = .decodeError("Error decoding AppBskyRichtextFacet: \(error)")
                }
            
            case "app.bsky.richtext.facet#mention":
                print("Attempting to decode type: \(typeValue) as AppBskyRichtextFacet.Mention")
                do {
                    let decodedObject = try AppBskyRichtextFacet.Mention.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyRichtextFacet.Mention")
                } catch {
                    print("Error decoding AppBskyRichtextFacet.Mention: \(error)")
                    self = .decodeError("Error decoding AppBskyRichtextFacet.Mention: \(error)")
                }
            
            case "app.bsky.richtext.facet#link":
                print("Attempting to decode type: \(typeValue) as AppBskyRichtextFacet.Link")
                do {
                    let decodedObject = try AppBskyRichtextFacet.Link.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyRichtextFacet.Link")
                } catch {
                    print("Error decoding AppBskyRichtextFacet.Link: \(error)")
                    self = .decodeError("Error decoding AppBskyRichtextFacet.Link: \(error)")
                }
            
            case "app.bsky.richtext.facet#tag":
                print("Attempting to decode type: \(typeValue) as AppBskyRichtextFacet.Tag")
                do {
                    let decodedObject = try AppBskyRichtextFacet.Tag.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyRichtextFacet.Tag")
                } catch {
                    print("Error decoding AppBskyRichtextFacet.Tag: \(error)")
                    self = .decodeError("Error decoding AppBskyRichtextFacet.Tag: \(error)")
                }
            
            case "app.bsky.richtext.facet#byteSlice":
                print("Attempting to decode type: \(typeValue) as AppBskyRichtextFacet.ByteSlice")
                do {
                    let decodedObject = try AppBskyRichtextFacet.ByteSlice.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyRichtextFacet.ByteSlice")
                } catch {
                    print("Error decoding AppBskyRichtextFacet.ByteSlice: \(error)")
                    self = .decodeError("Error decoding AppBskyRichtextFacet.ByteSlice: \(error)")
                }
            
            case "app.bsky.actor.defs#profileViewBasic":
                print("Attempting to decode type: \(typeValue) as AppBskyActorDefs.ProfileViewBasic")
                do {
                    let decodedObject = try AppBskyActorDefs.ProfileViewBasic.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyActorDefs.ProfileViewBasic")
                } catch {
                    print("Error decoding AppBskyActorDefs.ProfileViewBasic: \(error)")
                    self = .decodeError("Error decoding AppBskyActorDefs.ProfileViewBasic: \(error)")
                }
            
            case "app.bsky.actor.defs#profileView":
                print("Attempting to decode type: \(typeValue) as AppBskyActorDefs.ProfileView")
                do {
                    let decodedObject = try AppBskyActorDefs.ProfileView.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyActorDefs.ProfileView")
                } catch {
                    print("Error decoding AppBskyActorDefs.ProfileView: \(error)")
                    self = .decodeError("Error decoding AppBskyActorDefs.ProfileView: \(error)")
                }
            
            case "app.bsky.actor.defs#profileViewDetailed":
                print("Attempting to decode type: \(typeValue) as AppBskyActorDefs.ProfileViewDetailed")
                do {
                    let decodedObject = try AppBskyActorDefs.ProfileViewDetailed.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyActorDefs.ProfileViewDetailed")
                } catch {
                    print("Error decoding AppBskyActorDefs.ProfileViewDetailed: \(error)")
                    self = .decodeError("Error decoding AppBskyActorDefs.ProfileViewDetailed: \(error)")
                }
            
            case "app.bsky.actor.defs#viewerState":
                print("Attempting to decode type: \(typeValue) as AppBskyActorDefs.ViewerState")
                do {
                    let decodedObject = try AppBskyActorDefs.ViewerState.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyActorDefs.ViewerState")
                } catch {
                    print("Error decoding AppBskyActorDefs.ViewerState: \(error)")
                    self = .decodeError("Error decoding AppBskyActorDefs.ViewerState: \(error)")
                }
            
            case "app.bsky.actor.defs#preferences":
                print("Attempting to decode type: \(typeValue) as AppBskyActorDefs.Preferences")
                do {
                    let decodedObject = try AppBskyActorDefs.Preferences.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyActorDefs.Preferences")
                } catch {
                    print("Error decoding AppBskyActorDefs.Preferences: \(error)")
                    self = .decodeError("Error decoding AppBskyActorDefs.Preferences: \(error)")
                }
            
            case "app.bsky.actor.defs#adultContentPref":
                print("Attempting to decode type: \(typeValue) as AppBskyActorDefs.AdultContentPref")
                do {
                    let decodedObject = try AppBskyActorDefs.AdultContentPref.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyActorDefs.AdultContentPref")
                } catch {
                    print("Error decoding AppBskyActorDefs.AdultContentPref: \(error)")
                    self = .decodeError("Error decoding AppBskyActorDefs.AdultContentPref: \(error)")
                }
            
            case "app.bsky.actor.defs#contentLabelPref":
                print("Attempting to decode type: \(typeValue) as AppBskyActorDefs.ContentLabelPref")
                do {
                    let decodedObject = try AppBskyActorDefs.ContentLabelPref.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyActorDefs.ContentLabelPref")
                } catch {
                    print("Error decoding AppBskyActorDefs.ContentLabelPref: \(error)")
                    self = .decodeError("Error decoding AppBskyActorDefs.ContentLabelPref: \(error)")
                }
            
            case "app.bsky.actor.defs#savedFeedsPref":
                print("Attempting to decode type: \(typeValue) as AppBskyActorDefs.SavedFeedsPref")
                do {
                    let decodedObject = try AppBskyActorDefs.SavedFeedsPref.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyActorDefs.SavedFeedsPref")
                } catch {
                    print("Error decoding AppBskyActorDefs.SavedFeedsPref: \(error)")
                    self = .decodeError("Error decoding AppBskyActorDefs.SavedFeedsPref: \(error)")
                }
            
            case "app.bsky.actor.defs#personalDetailsPref":
                print("Attempting to decode type: \(typeValue) as AppBskyActorDefs.PersonalDetailsPref")
                do {
                    let decodedObject = try AppBskyActorDefs.PersonalDetailsPref.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyActorDefs.PersonalDetailsPref")
                } catch {
                    print("Error decoding AppBskyActorDefs.PersonalDetailsPref: \(error)")
                    self = .decodeError("Error decoding AppBskyActorDefs.PersonalDetailsPref: \(error)")
                }
            
            case "app.bsky.actor.defs#feedViewPref":
                print("Attempting to decode type: \(typeValue) as AppBskyActorDefs.FeedViewPref")
                do {
                    let decodedObject = try AppBskyActorDefs.FeedViewPref.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyActorDefs.FeedViewPref")
                } catch {
                    print("Error decoding AppBskyActorDefs.FeedViewPref: \(error)")
                    self = .decodeError("Error decoding AppBskyActorDefs.FeedViewPref: \(error)")
                }
            
            case "app.bsky.actor.defs#threadViewPref":
                print("Attempting to decode type: \(typeValue) as AppBskyActorDefs.ThreadViewPref")
                do {
                    let decodedObject = try AppBskyActorDefs.ThreadViewPref.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyActorDefs.ThreadViewPref")
                } catch {
                    print("Error decoding AppBskyActorDefs.ThreadViewPref: \(error)")
                    self = .decodeError("Error decoding AppBskyActorDefs.ThreadViewPref: \(error)")
                }
            
            case "app.bsky.actor.profile":
                print("Attempting to decode type: \(typeValue) as AppBskyActorProfile")
                do {
                    let decodedObject = try AppBskyActorProfile.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as AppBskyActorProfile")
                } catch {
                    print("Error decoding AppBskyActorProfile: \(error)")
                    self = .decodeError("Error decoding AppBskyActorProfile: \(error)")
                }
            
            case "com.atproto.admin.defs#statusAttr":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.StatusAttr")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.StatusAttr.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.StatusAttr")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.StatusAttr: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.StatusAttr: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventView":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.ModEventView")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventView.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.ModEventView")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventView: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventView: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventViewDetail":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.ModEventViewDetail")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventViewDetail.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.ModEventViewDetail")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventViewDetail: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventViewDetail: \(error)")
                }
            
            case "com.atproto.admin.defs#reportView":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.ReportView")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ReportView.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.ReportView")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ReportView: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ReportView: \(error)")
                }
            
            case "com.atproto.admin.defs#subjectStatusView":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.SubjectStatusView")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.SubjectStatusView.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.SubjectStatusView")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.SubjectStatusView: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.SubjectStatusView: \(error)")
                }
            
            case "com.atproto.admin.defs#reportViewDetail":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.ReportViewDetail")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ReportViewDetail.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.ReportViewDetail")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ReportViewDetail: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ReportViewDetail: \(error)")
                }
            
            case "com.atproto.admin.defs#repoView":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.RepoView")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.RepoView.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.RepoView")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.RepoView: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.RepoView: \(error)")
                }
            
            case "com.atproto.admin.defs#repoViewDetail":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.RepoViewDetail")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.RepoViewDetail.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.RepoViewDetail")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.RepoViewDetail: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.RepoViewDetail: \(error)")
                }
            
            case "com.atproto.admin.defs#accountView":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.AccountView")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.AccountView.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.AccountView")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.AccountView: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.AccountView: \(error)")
                }
            
            case "com.atproto.admin.defs#repoViewNotFound":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.RepoViewNotFound")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.RepoViewNotFound.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.RepoViewNotFound")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.RepoViewNotFound: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.RepoViewNotFound: \(error)")
                }
            
            case "com.atproto.admin.defs#repoRef":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.RepoRef")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.RepoRef.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.RepoRef")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.RepoRef: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.RepoRef: \(error)")
                }
            
            case "com.atproto.admin.defs#repoBlobRef":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.RepoBlobRef")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.RepoBlobRef.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.RepoBlobRef")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.RepoBlobRef: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.RepoBlobRef: \(error)")
                }
            
            case "com.atproto.admin.defs#recordView":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.RecordView")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.RecordView.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.RecordView")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.RecordView: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.RecordView: \(error)")
                }
            
            case "com.atproto.admin.defs#recordViewDetail":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.RecordViewDetail")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.RecordViewDetail.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.RecordViewDetail")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.RecordViewDetail: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.RecordViewDetail: \(error)")
                }
            
            case "com.atproto.admin.defs#recordViewNotFound":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.RecordViewNotFound")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.RecordViewNotFound.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.RecordViewNotFound")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.RecordViewNotFound: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.RecordViewNotFound: \(error)")
                }
            
            case "com.atproto.admin.defs#moderation":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.Moderation")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.Moderation.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.Moderation")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.Moderation: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.Moderation: \(error)")
                }
            
            case "com.atproto.admin.defs#moderationDetail":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.ModerationDetail")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModerationDetail.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.ModerationDetail")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModerationDetail: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModerationDetail: \(error)")
                }
            
            case "com.atproto.admin.defs#blobView":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.BlobView")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.BlobView.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.BlobView")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.BlobView: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.BlobView: \(error)")
                }
            
            case "com.atproto.admin.defs#imageDetails":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.ImageDetails")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ImageDetails.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.ImageDetails")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ImageDetails: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ImageDetails: \(error)")
                }
            
            case "com.atproto.admin.defs#videoDetails":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.VideoDetails")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.VideoDetails.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.VideoDetails")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.VideoDetails: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.VideoDetails: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventTakedown":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.ModEventTakedown")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventTakedown.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.ModEventTakedown")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventTakedown: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventTakedown: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventReverseTakedown":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.ModEventReverseTakedown")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventReverseTakedown.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.ModEventReverseTakedown")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventReverseTakedown: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventReverseTakedown: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventResolveAppeal":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.ModEventResolveAppeal")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventResolveAppeal.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.ModEventResolveAppeal")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventResolveAppeal: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventResolveAppeal: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventComment":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.ModEventComment")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventComment.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.ModEventComment")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventComment: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventComment: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventReport":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.ModEventReport")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventReport.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.ModEventReport")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventReport: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventReport: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventLabel":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.ModEventLabel")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventLabel.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.ModEventLabel")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventLabel: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventLabel: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventAcknowledge":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.ModEventAcknowledge")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventAcknowledge.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.ModEventAcknowledge")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventAcknowledge: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventAcknowledge: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventEscalate":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.ModEventEscalate")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventEscalate.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.ModEventEscalate")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventEscalate: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventEscalate: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventMute":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.ModEventMute")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventMute.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.ModEventMute")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventMute: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventMute: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventUnmute":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.ModEventUnmute")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventUnmute.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.ModEventUnmute")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventUnmute: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventUnmute: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventEmail":
                print("Attempting to decode type: \(typeValue) as ComAtprotoAdminDefs.ModEventEmail")
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventEmail.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoAdminDefs.ModEventEmail")
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventEmail: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventEmail: \(error)")
                }
            
            case "com.atproto.label.defs#label":
                print("Attempting to decode type: \(typeValue) as ComAtprotoLabelDefs.Label")
                do {
                    let decodedObject = try ComAtprotoLabelDefs.Label.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoLabelDefs.Label")
                } catch {
                    print("Error decoding ComAtprotoLabelDefs.Label: \(error)")
                    self = .decodeError("Error decoding ComAtprotoLabelDefs.Label: \(error)")
                }
            
            case "com.atproto.label.defs#selfLabels":
                print("Attempting to decode type: \(typeValue) as ComAtprotoLabelDefs.SelfLabels")
                do {
                    let decodedObject = try ComAtprotoLabelDefs.SelfLabels.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoLabelDefs.SelfLabels")
                } catch {
                    print("Error decoding ComAtprotoLabelDefs.SelfLabels: \(error)")
                    self = .decodeError("Error decoding ComAtprotoLabelDefs.SelfLabels: \(error)")
                }
            
            case "com.atproto.label.defs#selfLabel":
                print("Attempting to decode type: \(typeValue) as ComAtprotoLabelDefs.SelfLabel")
                do {
                    let decodedObject = try ComAtprotoLabelDefs.SelfLabel.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoLabelDefs.SelfLabel")
                } catch {
                    print("Error decoding ComAtprotoLabelDefs.SelfLabel: \(error)")
                    self = .decodeError("Error decoding ComAtprotoLabelDefs.SelfLabel: \(error)")
                }
            
            case "com.atproto.server.defs#inviteCode":
                print("Attempting to decode type: \(typeValue) as ComAtprotoServerDefs.InviteCode")
                do {
                    let decodedObject = try ComAtprotoServerDefs.InviteCode.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoServerDefs.InviteCode")
                } catch {
                    print("Error decoding ComAtprotoServerDefs.InviteCode: \(error)")
                    self = .decodeError("Error decoding ComAtprotoServerDefs.InviteCode: \(error)")
                }
            
            case "com.atproto.server.defs#inviteCodeUse":
                print("Attempting to decode type: \(typeValue) as ComAtprotoServerDefs.InviteCodeUse")
                do {
                    let decodedObject = try ComAtprotoServerDefs.InviteCodeUse.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoServerDefs.InviteCodeUse")
                } catch {
                    print("Error decoding ComAtprotoServerDefs.InviteCodeUse: \(error)")
                    self = .decodeError("Error decoding ComAtprotoServerDefs.InviteCodeUse: \(error)")
                }
            
            case "com.atproto.server.listAppPasswords#appPassword":
                print("Attempting to decode type: \(typeValue) as ComAtprotoServerListAppPasswords.AppPassword")
                do {
                    let decodedObject = try ComAtprotoServerListAppPasswords.AppPassword.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoServerListAppPasswords.AppPassword")
                } catch {
                    print("Error decoding ComAtprotoServerListAppPasswords.AppPassword: \(error)")
                    self = .decodeError("Error decoding ComAtprotoServerListAppPasswords.AppPassword: \(error)")
                }
            
            case "com.atproto.server.createInviteCodes#accountCodes":
                print("Attempting to decode type: \(typeValue) as ComAtprotoServerCreateInviteCodes.AccountCodes")
                do {
                    let decodedObject = try ComAtprotoServerCreateInviteCodes.AccountCodes.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoServerCreateInviteCodes.AccountCodes")
                } catch {
                    print("Error decoding ComAtprotoServerCreateInviteCodes.AccountCodes: \(error)")
                    self = .decodeError("Error decoding ComAtprotoServerCreateInviteCodes.AccountCodes: \(error)")
                }
            
            case "com.atproto.server.createAppPassword#appPassword":
                print("Attempting to decode type: \(typeValue) as ComAtprotoServerCreateAppPassword.AppPassword")
                do {
                    let decodedObject = try ComAtprotoServerCreateAppPassword.AppPassword.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoServerCreateAppPassword.AppPassword")
                } catch {
                    print("Error decoding ComAtprotoServerCreateAppPassword.AppPassword: \(error)")
                    self = .decodeError("Error decoding ComAtprotoServerCreateAppPassword.AppPassword: \(error)")
                }
            
            case "com.atproto.server.describeServer#links":
                print("Attempting to decode type: \(typeValue) as ComAtprotoServerDescribeServer.Links")
                do {
                    let decodedObject = try ComAtprotoServerDescribeServer.Links.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoServerDescribeServer.Links")
                } catch {
                    print("Error decoding ComAtprotoServerDescribeServer.Links: \(error)")
                    self = .decodeError("Error decoding ComAtprotoServerDescribeServer.Links: \(error)")
                }
            
            case "com.atproto.sync.listRepos#repo":
                print("Attempting to decode type: \(typeValue) as ComAtprotoSyncListRepos.Repo")
                do {
                    let decodedObject = try ComAtprotoSyncListRepos.Repo.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoSyncListRepos.Repo")
                } catch {
                    print("Error decoding ComAtprotoSyncListRepos.Repo: \(error)")
                    self = .decodeError("Error decoding ComAtprotoSyncListRepos.Repo: \(error)")
                }
            
            case "com.atproto.repo.strongRef":
                print("Attempting to decode type: \(typeValue) as ComAtprotoRepoStrongRef")
                do {
                    let decodedObject = try ComAtprotoRepoStrongRef.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoRepoStrongRef")
                } catch {
                    print("Error decoding ComAtprotoRepoStrongRef: \(error)")
                    self = .decodeError("Error decoding ComAtprotoRepoStrongRef: \(error)")
                }
            
            case "com.atproto.repo.applyWrites#create":
                print("Attempting to decode type: \(typeValue) as ComAtprotoRepoApplyWrites.Create")
                do {
                    let decodedObject = try ComAtprotoRepoApplyWrites.Create.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoRepoApplyWrites.Create")
                } catch {
                    print("Error decoding ComAtprotoRepoApplyWrites.Create: \(error)")
                    self = .decodeError("Error decoding ComAtprotoRepoApplyWrites.Create: \(error)")
                }
            
            case "com.atproto.repo.applyWrites#update":
                print("Attempting to decode type: \(typeValue) as ComAtprotoRepoApplyWrites.Update")
                do {
                    let decodedObject = try ComAtprotoRepoApplyWrites.Update.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoRepoApplyWrites.Update")
                } catch {
                    print("Error decoding ComAtprotoRepoApplyWrites.Update: \(error)")
                    self = .decodeError("Error decoding ComAtprotoRepoApplyWrites.Update: \(error)")
                }
            
            case "com.atproto.repo.applyWrites#delete":
                print("Attempting to decode type: \(typeValue) as ComAtprotoRepoApplyWrites.Delete")
                do {
                    let decodedObject = try ComAtprotoRepoApplyWrites.Delete.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoRepoApplyWrites.Delete")
                } catch {
                    print("Error decoding ComAtprotoRepoApplyWrites.Delete: \(error)")
                    self = .decodeError("Error decoding ComAtprotoRepoApplyWrites.Delete: \(error)")
                }
            
            case "com.atproto.repo.listRecords#record":
                print("Attempting to decode type: \(typeValue) as ComAtprotoRepoListRecords.Record")
                do {
                    let decodedObject = try ComAtprotoRepoListRecords.Record.init(from: decoder)
                    self = .custom(decodedObject)
                    print("Successfully decoded \(typeValue) as ComAtprotoRepoListRecords.Record")
                } catch {
                    print("Error decoding ComAtprotoRepoListRecords.Record: \(error)")
                    self = .decodeError("Error decoding ComAtprotoRepoListRecords.Record: \(error)")
                }
            
                default:
                    do {
                        print("Attempting to decode an unknown type: \(typeValue)")
                        let unknownObject = try JSONValue.decodeAny(from: container)
                        self = .unknownType(typeValue, unknownObject)
                    } catch {
                        self = .decodeError("Decoding unknown type error: \(error)")
                    }

            }
        } else {

        do {
            let container = try decoder.singleValueContainer()
            
            print("Attempting to decode as String")
            if let stringValue = try? container.decode(String.self) {
                self = .string(stringValue)
                print("Successfully decoded as String")
            } else {
                print("Failed to decode as String, attempting to decode as Int")
                if let intValue = try? container.decode(Int.self) {
                    self = .number(intValue)
                    print("Successfully decoded as Int")
                } else {
                    print("Failed to decode as Int, attempting to decode as BigNumber")
                    if let bigNumberString = try? container.decode(String.self) {
                        self = .bigNumber(bigNumberString)
                        print("Successfully decoded as BigNumber")
                    } else {
                        print("Failed to decode as BigNumber, attempting to decode as Bool")
                        if let boolValue = try? container.decode(Bool.self) {
                            self = .bool(boolValue)
                            print("Successfully decoded as Bool")
                        } else {
                            print("Failed to decode as Bool, attempting to decode as Null")
                            if container.decodeNil() {
                                self = .null
                                print("Successfully decoded as Null")
                            } else {
                                print("Failed to decode as Null, attempting to decode as Array")
                                if var arrayContainer = try? decoder.unkeyedContainer() {
                                    var array = [JSONValue]()
                                    while !arrayContainer.isAtEnd {
                                        let value = try arrayContainer.decode(JSONValue.self)
                                        array.append(value)
                                    }
                                    self = .array(array)
                                    print("Successfully decoded as Array")
                                } else {
                                    print("Failed to decode as Array, attempting to decode as Object")
                                    if let object = try? container.decode([String: JSONValue].self) {
                                        self = .object(object)
                                        print("Successfully decoded as Object")
                                    } else {
                                        print("Failed to decode as Object, throwing DecodingError.dataCorruptedError")
                                        throw DecodingError.dataCorruptedError(in: container, debugDescription: "JSONValue cannot be decoded")
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } catch {
            print("Decoding error: \(error)")
            self = .decodeError("Decoding error: \(error)")
        }
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
            case .string(let stringValue):
                try container.encode(stringValue)
            case .number(let intValue):
                try container.encode(intValue)
            case .bigNumber(let bigNumberString):
                try container.encode(bigNumberString)
            case .bool(let boolValue):
                try container.encode(boolValue)
            case .null:
                try container.encodeNil()
            case .link(let linkValue):
                try container.encode(linkValue)
            case .bytes(let bytesValue):
                try container.encode(bytesValue)
            case .array(let arrayValue):
                var arrayContainer = encoder.unkeyedContainer()
                for value in arrayValue {
                    try arrayContainer.encode(value)
                }
            case .object(let objectValue):
                var objectContainer = encoder.container(keyedBy: DynamicCodingKeys.self)
                for (key, value) in objectValue {
                    let key = DynamicCodingKeys(stringValue: key)!
                    try objectContainer.encode(value, forKey: key)
                }
            case .custom(let customValue):
                try customValue.encode(to: encoder)
            case .unknownType(_, let unknownValue):
                try unknownValue.encode(to: encoder)
            case .decodeError(let errorMessage):
                throw EncodingError.invalidValue(errorMessage, EncodingError.Context(codingPath: encoder.codingPath, debugDescription: "Cannot encode a decoding error."))
        }
    }

    struct DynamicCodingKeys: CodingKey {
        var stringValue: String
        var intValue: Int?

        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        init?(intValue: Int) {
            self.intValue = intValue
            self.stringValue = String(intValue)
        }
    }

        private static func decodeAny(from container: KeyedDecodingContainer<DynamicCodingKeys>) throws -> JSONValue {
        var dictionary = [String: JSONValue]()
        for key in container.allKeys {
            if let boolValue = try? container.decode(Bool.self, forKey: key) {
                dictionary[key.stringValue] = .bool(boolValue)
            } else if let intValue = try? container.decode(Int.self, forKey: key) {
                dictionary[key.stringValue] = .number(intValue)
            } else if let doubleValue = try? container.decode(Double.self, forKey: key) {
                dictionary[key.stringValue] = .bigNumber(String(doubleValue))
            } else if let stringValue = try? container.decode(String.self, forKey: key) {
                dictionary[key.stringValue] = .string(stringValue)
            } else if let nestedContainer = try? container.nestedContainer(keyedBy: DynamicCodingKeys.self, forKey: key) {
                dictionary[key.stringValue] = try decodeAny(from: nestedContainer)
            } else if var arrayContainer = try? container.nestedUnkeyedContainer(forKey: key) {
                var array = [JSONValue]()
                while !arrayContainer.isAtEnd {
                    let value = try arrayContainer.decode(JSONValue.self)
                    array.append(value)
                }
                dictionary[key.stringValue] = .array(array)
            } else {
                throw DecodingError.dataCorruptedError(forKey: key, in: container, debugDescription: "Cannot decode value")
            }
        }
        return .object(dictionary)
    }

    private static func decodeAny(from unkeyedContainer: inout UnkeyedDecodingContainer) throws -> [Any] {
        // For decoding arrays
        var array = [Any]()
        while !unkeyedContainer.isAtEnd {
            if let value = try? unkeyedContainer.decode(Bool.self) {
                array.append(value)
            } else if let value = try? unkeyedContainer.decode(Int.self) {
                array.append(value)
            } else if let value = try? unkeyedContainer.decode(Double.self) {
                array.append(value)
            } else if let value = try? unkeyedContainer.decode(String.self) {
                array.append(value)
            } else if let nestedContainer = try? unkeyedContainer.nestedContainer(keyedBy: DynamicCodingKeys.self) {
                array.append(try decodeAny(from: nestedContainer))
            } else if var nestedArrayContainer = try? unkeyedContainer.nestedUnkeyedContainer() {
                array.append(try decodeAny(from: &nestedArrayContainer))
            } else {
                throw DecodingError.dataCorruptedError(in: unkeyedContainer, debugDescription: "Cannot decode array element")
            }
        }
        return array
    }


}