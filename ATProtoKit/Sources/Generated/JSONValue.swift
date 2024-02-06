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

        switch typeValue {
            
            case "app.bsky.embed.record":
                do {
                    let decodedObject = try AppBskyEmbedRecord.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyEmbedRecord: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedRecord: \(error)")
                }
            
            case "app.bsky.embed.record#view":
                do {
                    let decodedObject = try AppBskyEmbedRecord.View.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyEmbedRecord.View: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedRecord.View: \(error)")
                }
            
            case "app.bsky.embed.record#viewRecord":
                do {
                    let decodedObject = try AppBskyEmbedRecord.ViewRecord.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyEmbedRecord.ViewRecord: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedRecord.ViewRecord: \(error)")
                }
            
            case "app.bsky.embed.record#viewNotFound":
                do {
                    let decodedObject = try AppBskyEmbedRecord.ViewNotFound.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyEmbedRecord.ViewNotFound: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedRecord.ViewNotFound: \(error)")
                }
            
            case "app.bsky.embed.record#viewBlocked":
                do {
                    let decodedObject = try AppBskyEmbedRecord.ViewBlocked.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyEmbedRecord.ViewBlocked: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedRecord.ViewBlocked: \(error)")
                }
            
            case "app.bsky.embed.images":
                do {
                    let decodedObject = try AppBskyEmbedImages.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyEmbedImages: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedImages: \(error)")
                }
            
            case "app.bsky.embed.images#image":
                do {
                    let decodedObject = try AppBskyEmbedImages.Image.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyEmbedImages.Image: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedImages.Image: \(error)")
                }
            
            case "app.bsky.embed.images#aspectRatio":
                do {
                    let decodedObject = try AppBskyEmbedImages.AspectRatio.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyEmbedImages.AspectRatio: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedImages.AspectRatio: \(error)")
                }
            
            case "app.bsky.embed.images#view":
                do {
                    let decodedObject = try AppBskyEmbedImages.View.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyEmbedImages.View: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedImages.View: \(error)")
                }
            
            case "app.bsky.embed.images#viewImage":
                do {
                    let decodedObject = try AppBskyEmbedImages.ViewImage.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyEmbedImages.ViewImage: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedImages.ViewImage: \(error)")
                }
            
            case "app.bsky.embed.recordWithMedia":
                do {
                    let decodedObject = try AppBskyEmbedRecordWithMedia.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyEmbedRecordWithMedia: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedRecordWithMedia: \(error)")
                }
            
            case "app.bsky.embed.recordWithMedia#view":
                do {
                    let decodedObject = try AppBskyEmbedRecordWithMedia.View.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyEmbedRecordWithMedia.View: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedRecordWithMedia.View: \(error)")
                }
            
            case "app.bsky.embed.external":
                do {
                    let decodedObject = try AppBskyEmbedExternal.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyEmbedExternal: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedExternal: \(error)")
                }
            
            case "app.bsky.embed.external#external":
                do {
                    let decodedObject = try AppBskyEmbedExternal.External.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyEmbedExternal.External: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedExternal.External: \(error)")
                }
            
            case "app.bsky.embed.external#view":
                do {
                    let decodedObject = try AppBskyEmbedExternal.View.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyEmbedExternal.View: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedExternal.View: \(error)")
                }
            
            case "app.bsky.embed.external#viewExternal":
                do {
                    let decodedObject = try AppBskyEmbedExternal.ViewExternal.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyEmbedExternal.ViewExternal: \(error)")
                    self = .decodeError("Error decoding AppBskyEmbedExternal.ViewExternal: \(error)")
                }
            
            case "app.bsky.notification.listNotifications#notification":
                do {
                    let decodedObject = try AppBskyNotificationListNotifications.Notification.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyNotificationListNotifications.Notification: \(error)")
                    self = .decodeError("Error decoding AppBskyNotificationListNotifications.Notification: \(error)")
                }
            
            case "app.bsky.unspecced.defs#skeletonSearchPost":
                do {
                    let decodedObject = try AppBskyUnspeccedDefs.SkeletonSearchPost.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyUnspeccedDefs.SkeletonSearchPost: \(error)")
                    self = .decodeError("Error decoding AppBskyUnspeccedDefs.SkeletonSearchPost: \(error)")
                }
            
            case "app.bsky.unspecced.defs#skeletonSearchActor":
                do {
                    let decodedObject = try AppBskyUnspeccedDefs.SkeletonSearchActor.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyUnspeccedDefs.SkeletonSearchActor: \(error)")
                    self = .decodeError("Error decoding AppBskyUnspeccedDefs.SkeletonSearchActor: \(error)")
                }
            
            case "app.bsky.graph.block":
                do {
                    let decodedObject = try AppBskyGraphBlock.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyGraphBlock: \(error)")
                    self = .decodeError("Error decoding AppBskyGraphBlock: \(error)")
                }
            
            case "app.bsky.graph.follow":
                do {
                    let decodedObject = try AppBskyGraphFollow.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyGraphFollow: \(error)")
                    self = .decodeError("Error decoding AppBskyGraphFollow: \(error)")
                }
            
            case "app.bsky.graph.defs#listViewBasic":
                do {
                    let decodedObject = try AppBskyGraphDefs.ListViewBasic.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyGraphDefs.ListViewBasic: \(error)")
                    self = .decodeError("Error decoding AppBskyGraphDefs.ListViewBasic: \(error)")
                }
            
            case "app.bsky.graph.defs#listView":
                do {
                    let decodedObject = try AppBskyGraphDefs.ListView.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyGraphDefs.ListView: \(error)")
                    self = .decodeError("Error decoding AppBskyGraphDefs.ListView: \(error)")
                }
            
            case "app.bsky.graph.defs#listItemView":
                do {
                    let decodedObject = try AppBskyGraphDefs.ListItemView.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyGraphDefs.ListItemView: \(error)")
                    self = .decodeError("Error decoding AppBskyGraphDefs.ListItemView: \(error)")
                }
            
            case "app.bsky.graph.defs#listViewerState":
                do {
                    let decodedObject = try AppBskyGraphDefs.ListViewerState.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyGraphDefs.ListViewerState: \(error)")
                    self = .decodeError("Error decoding AppBskyGraphDefs.ListViewerState: \(error)")
                }
            
            case "app.bsky.graph.listblock":
                do {
                    let decodedObject = try AppBskyGraphListblock.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyGraphListblock: \(error)")
                    self = .decodeError("Error decoding AppBskyGraphListblock: \(error)")
                }
            
            case "app.bsky.graph.listitem":
                do {
                    let decodedObject = try AppBskyGraphListitem.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyGraphListitem: \(error)")
                    self = .decodeError("Error decoding AppBskyGraphListitem: \(error)")
                }
            
            case "app.bsky.graph.list":
                do {
                    let decodedObject = try AppBskyGraphList.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyGraphList: \(error)")
                    self = .decodeError("Error decoding AppBskyGraphList: \(error)")
                }
            
            case "app.bsky.feed.generator":
                do {
                    let decodedObject = try AppBskyFeedGenerator.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedGenerator: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedGenerator: \(error)")
                }
            
            case "app.bsky.feed.defs#postView":
                do {
                    let decodedObject = try AppBskyFeedDefs.PostView.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedDefs.PostView: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.PostView: \(error)")
                }
            
            case "app.bsky.feed.defs#viewerState":
                do {
                    let decodedObject = try AppBskyFeedDefs.ViewerState.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedDefs.ViewerState: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.ViewerState: \(error)")
                }
            
            case "app.bsky.feed.defs#feedViewPost":
                do {
                    let decodedObject = try AppBskyFeedDefs.FeedViewPost.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedDefs.FeedViewPost: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.FeedViewPost: \(error)")
                }
            
            case "app.bsky.feed.defs#replyRef":
                do {
                    let decodedObject = try AppBskyFeedDefs.ReplyRef.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedDefs.ReplyRef: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.ReplyRef: \(error)")
                }
            
            case "app.bsky.feed.defs#reasonRepost":
                do {
                    let decodedObject = try AppBskyFeedDefs.ReasonRepost.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedDefs.ReasonRepost: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.ReasonRepost: \(error)")
                }
            
            case "app.bsky.feed.defs#threadViewPost":
                do {
                    let decodedObject = try AppBskyFeedDefs.ThreadViewPost.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedDefs.ThreadViewPost: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.ThreadViewPost: \(error)")
                }
            
            case "app.bsky.feed.defs#notFoundPost":
                do {
                    let decodedObject = try AppBskyFeedDefs.NotFoundPost.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedDefs.NotFoundPost: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.NotFoundPost: \(error)")
                }
            
            case "app.bsky.feed.defs#blockedPost":
                do {
                    let decodedObject = try AppBskyFeedDefs.BlockedPost.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedDefs.BlockedPost: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.BlockedPost: \(error)")
                }
            
            case "app.bsky.feed.defs#blockedAuthor":
                do {
                    let decodedObject = try AppBskyFeedDefs.BlockedAuthor.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedDefs.BlockedAuthor: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.BlockedAuthor: \(error)")
                }
            
            case "app.bsky.feed.defs#generatorView":
                do {
                    let decodedObject = try AppBskyFeedDefs.GeneratorView.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedDefs.GeneratorView: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.GeneratorView: \(error)")
                }
            
            case "app.bsky.feed.defs#generatorViewerState":
                do {
                    let decodedObject = try AppBskyFeedDefs.GeneratorViewerState.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedDefs.GeneratorViewerState: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.GeneratorViewerState: \(error)")
                }
            
            case "app.bsky.feed.defs#skeletonFeedPost":
                do {
                    let decodedObject = try AppBskyFeedDefs.SkeletonFeedPost.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedDefs.SkeletonFeedPost: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.SkeletonFeedPost: \(error)")
                }
            
            case "app.bsky.feed.defs#skeletonReasonRepost":
                do {
                    let decodedObject = try AppBskyFeedDefs.SkeletonReasonRepost.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedDefs.SkeletonReasonRepost: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.SkeletonReasonRepost: \(error)")
                }
            
            case "app.bsky.feed.defs#threadgateView":
                do {
                    let decodedObject = try AppBskyFeedDefs.ThreadgateView.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedDefs.ThreadgateView: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDefs.ThreadgateView: \(error)")
                }
            
            case "app.bsky.feed.getLikes#like":
                do {
                    let decodedObject = try AppBskyFeedGetLikes.Like.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedGetLikes.Like: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedGetLikes.Like: \(error)")
                }
            
            case "app.bsky.feed.threadgate":
                do {
                    let decodedObject = try AppBskyFeedThreadgate.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedThreadgate: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedThreadgate: \(error)")
                }
            
            case "app.bsky.feed.threadgate#mentionRule":
                do {
                    let decodedObject = try AppBskyFeedThreadgate.MentionRule.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedThreadgate.MentionRule: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedThreadgate.MentionRule: \(error)")
                }
            
            case "app.bsky.feed.threadgate#followingRule":
                do {
                    let decodedObject = try AppBskyFeedThreadgate.FollowingRule.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedThreadgate.FollowingRule: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedThreadgate.FollowingRule: \(error)")
                }
            
            case "app.bsky.feed.threadgate#listRule":
                do {
                    let decodedObject = try AppBskyFeedThreadgate.ListRule.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedThreadgate.ListRule: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedThreadgate.ListRule: \(error)")
                }
            
            case "app.bsky.feed.like":
                do {
                    let decodedObject = try AppBskyFeedLike.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedLike: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedLike: \(error)")
                }
            
            case "app.bsky.feed.repost":
                do {
                    let decodedObject = try AppBskyFeedRepost.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedRepost: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedRepost: \(error)")
                }
            
            case "app.bsky.feed.describeFeedGenerator#feed":
                do {
                    let decodedObject = try AppBskyFeedDescribeFeedGenerator.Feed.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedDescribeFeedGenerator.Feed: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDescribeFeedGenerator.Feed: \(error)")
                }
            
            case "app.bsky.feed.describeFeedGenerator#links":
                do {
                    let decodedObject = try AppBskyFeedDescribeFeedGenerator.Links.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedDescribeFeedGenerator.Links: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedDescribeFeedGenerator.Links: \(error)")
                }
            
            case "app.bsky.feed.post":
                do {
                    let decodedObject = try AppBskyFeedPost.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedPost: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedPost: \(error)")
                }
            
            case "app.bsky.feed.post#replyRef":
                do {
                    let decodedObject = try AppBskyFeedPost.ReplyRef.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedPost.ReplyRef: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedPost.ReplyRef: \(error)")
                }
            
            case "app.bsky.feed.post#entity":
                do {
                    let decodedObject = try AppBskyFeedPost.Entity.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedPost.Entity: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedPost.Entity: \(error)")
                }
            
            case "app.bsky.feed.post#textSlice":
                do {
                    let decodedObject = try AppBskyFeedPost.TextSlice.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyFeedPost.TextSlice: \(error)")
                    self = .decodeError("Error decoding AppBskyFeedPost.TextSlice: \(error)")
                }
            
            case "app.bsky.richtext.facet":
                do {
                    let decodedObject = try AppBskyRichtextFacet.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyRichtextFacet: \(error)")
                    self = .decodeError("Error decoding AppBskyRichtextFacet: \(error)")
                }
            
            case "app.bsky.richtext.facet#mention":
                do {
                    let decodedObject = try AppBskyRichtextFacet.Mention.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyRichtextFacet.Mention: \(error)")
                    self = .decodeError("Error decoding AppBskyRichtextFacet.Mention: \(error)")
                }
            
            case "app.bsky.richtext.facet#link":
                do {
                    let decodedObject = try AppBskyRichtextFacet.Link.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyRichtextFacet.Link: \(error)")
                    self = .decodeError("Error decoding AppBskyRichtextFacet.Link: \(error)")
                }
            
            case "app.bsky.richtext.facet#tag":
                do {
                    let decodedObject = try AppBskyRichtextFacet.Tag.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyRichtextFacet.Tag: \(error)")
                    self = .decodeError("Error decoding AppBskyRichtextFacet.Tag: \(error)")
                }
            
            case "app.bsky.richtext.facet#byteSlice":
                do {
                    let decodedObject = try AppBskyRichtextFacet.ByteSlice.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyRichtextFacet.ByteSlice: \(error)")
                    self = .decodeError("Error decoding AppBskyRichtextFacet.ByteSlice: \(error)")
                }
            
            case "app.bsky.actor.defs#profileViewBasic":
                do {
                    let decodedObject = try AppBskyActorDefs.ProfileViewBasic.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyActorDefs.ProfileViewBasic: \(error)")
                    self = .decodeError("Error decoding AppBskyActorDefs.ProfileViewBasic: \(error)")
                }
            
            case "app.bsky.actor.defs#profileView":
                do {
                    let decodedObject = try AppBskyActorDefs.ProfileView.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyActorDefs.ProfileView: \(error)")
                    self = .decodeError("Error decoding AppBskyActorDefs.ProfileView: \(error)")
                }
            
            case "app.bsky.actor.defs#profileViewDetailed":
                do {
                    let decodedObject = try AppBskyActorDefs.ProfileViewDetailed.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyActorDefs.ProfileViewDetailed: \(error)")
                    self = .decodeError("Error decoding AppBskyActorDefs.ProfileViewDetailed: \(error)")
                }
            
            case "app.bsky.actor.defs#viewerState":
                do {
                    let decodedObject = try AppBskyActorDefs.ViewerState.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyActorDefs.ViewerState: \(error)")
                    self = .decodeError("Error decoding AppBskyActorDefs.ViewerState: \(error)")
                }
            
            case "app.bsky.actor.defs#preferences":
                do {
                    let decodedObject = try AppBskyActorDefs.Preferences.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyActorDefs.Preferences: \(error)")
                    self = .decodeError("Error decoding AppBskyActorDefs.Preferences: \(error)")
                }
            
            case "app.bsky.actor.defs#adultContentPref":
                do {
                    let decodedObject = try AppBskyActorDefs.AdultContentPref.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyActorDefs.AdultContentPref: \(error)")
                    self = .decodeError("Error decoding AppBskyActorDefs.AdultContentPref: \(error)")
                }
            
            case "app.bsky.actor.defs#contentLabelPref":
                do {
                    let decodedObject = try AppBskyActorDefs.ContentLabelPref.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyActorDefs.ContentLabelPref: \(error)")
                    self = .decodeError("Error decoding AppBskyActorDefs.ContentLabelPref: \(error)")
                }
            
            case "app.bsky.actor.defs#savedFeedsPref":
                do {
                    let decodedObject = try AppBskyActorDefs.SavedFeedsPref.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyActorDefs.SavedFeedsPref: \(error)")
                    self = .decodeError("Error decoding AppBskyActorDefs.SavedFeedsPref: \(error)")
                }
            
            case "app.bsky.actor.defs#personalDetailsPref":
                do {
                    let decodedObject = try AppBskyActorDefs.PersonalDetailsPref.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyActorDefs.PersonalDetailsPref: \(error)")
                    self = .decodeError("Error decoding AppBskyActorDefs.PersonalDetailsPref: \(error)")
                }
            
            case "app.bsky.actor.defs#feedViewPref":
                do {
                    let decodedObject = try AppBskyActorDefs.FeedViewPref.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyActorDefs.FeedViewPref: \(error)")
                    self = .decodeError("Error decoding AppBskyActorDefs.FeedViewPref: \(error)")
                }
            
            case "app.bsky.actor.defs#threadViewPref":
                do {
                    let decodedObject = try AppBskyActorDefs.ThreadViewPref.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyActorDefs.ThreadViewPref: \(error)")
                    self = .decodeError("Error decoding AppBskyActorDefs.ThreadViewPref: \(error)")
                }
            
            case "app.bsky.actor.profile":
                do {
                    let decodedObject = try AppBskyActorProfile.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding AppBskyActorProfile: \(error)")
                    self = .decodeError("Error decoding AppBskyActorProfile: \(error)")
                }
            
            case "com.atproto.admin.defs#statusAttr":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.StatusAttr.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.StatusAttr: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.StatusAttr: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventView":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventView.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventView: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventView: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventViewDetail":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventViewDetail.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventViewDetail: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventViewDetail: \(error)")
                }
            
            case "com.atproto.admin.defs#reportView":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ReportView.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ReportView: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ReportView: \(error)")
                }
            
            case "com.atproto.admin.defs#subjectStatusView":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.SubjectStatusView.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.SubjectStatusView: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.SubjectStatusView: \(error)")
                }
            
            case "com.atproto.admin.defs#reportViewDetail":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ReportViewDetail.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ReportViewDetail: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ReportViewDetail: \(error)")
                }
            
            case "com.atproto.admin.defs#repoView":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.RepoView.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.RepoView: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.RepoView: \(error)")
                }
            
            case "com.atproto.admin.defs#repoViewDetail":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.RepoViewDetail.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.RepoViewDetail: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.RepoViewDetail: \(error)")
                }
            
            case "com.atproto.admin.defs#accountView":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.AccountView.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.AccountView: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.AccountView: \(error)")
                }
            
            case "com.atproto.admin.defs#repoViewNotFound":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.RepoViewNotFound.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.RepoViewNotFound: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.RepoViewNotFound: \(error)")
                }
            
            case "com.atproto.admin.defs#repoRef":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.RepoRef.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.RepoRef: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.RepoRef: \(error)")
                }
            
            case "com.atproto.admin.defs#repoBlobRef":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.RepoBlobRef.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.RepoBlobRef: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.RepoBlobRef: \(error)")
                }
            
            case "com.atproto.admin.defs#recordView":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.RecordView.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.RecordView: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.RecordView: \(error)")
                }
            
            case "com.atproto.admin.defs#recordViewDetail":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.RecordViewDetail.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.RecordViewDetail: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.RecordViewDetail: \(error)")
                }
            
            case "com.atproto.admin.defs#recordViewNotFound":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.RecordViewNotFound.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.RecordViewNotFound: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.RecordViewNotFound: \(error)")
                }
            
            case "com.atproto.admin.defs#moderation":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.Moderation.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.Moderation: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.Moderation: \(error)")
                }
            
            case "com.atproto.admin.defs#moderationDetail":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModerationDetail.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModerationDetail: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModerationDetail: \(error)")
                }
            
            case "com.atproto.admin.defs#blobView":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.BlobView.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.BlobView: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.BlobView: \(error)")
                }
            
            case "com.atproto.admin.defs#imageDetails":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ImageDetails.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ImageDetails: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ImageDetails: \(error)")
                }
            
            case "com.atproto.admin.defs#videoDetails":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.VideoDetails.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.VideoDetails: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.VideoDetails: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventTakedown":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventTakedown.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventTakedown: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventTakedown: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventReverseTakedown":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventReverseTakedown.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventReverseTakedown: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventReverseTakedown: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventResolveAppeal":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventResolveAppeal.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventResolveAppeal: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventResolveAppeal: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventComment":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventComment.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventComment: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventComment: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventReport":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventReport.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventReport: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventReport: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventLabel":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventLabel.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventLabel: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventLabel: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventAcknowledge":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventAcknowledge.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventAcknowledge: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventAcknowledge: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventEscalate":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventEscalate.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventEscalate: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventEscalate: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventMute":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventMute.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventMute: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventMute: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventUnmute":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventUnmute.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventUnmute: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventUnmute: \(error)")
                }
            
            case "com.atproto.admin.defs#modEventEmail":
                do {
                    let decodedObject = try ComAtprotoAdminDefs.ModEventEmail.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoAdminDefs.ModEventEmail: \(error)")
                    self = .decodeError("Error decoding ComAtprotoAdminDefs.ModEventEmail: \(error)")
                }
            
            case "com.atproto.label.defs#label":
                do {
                    let decodedObject = try ComAtprotoLabelDefs.Label.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoLabelDefs.Label: \(error)")
                    self = .decodeError("Error decoding ComAtprotoLabelDefs.Label: \(error)")
                }
            
            case "com.atproto.label.defs#selfLabels":
                do {
                    let decodedObject = try ComAtprotoLabelDefs.SelfLabels.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoLabelDefs.SelfLabels: \(error)")
                    self = .decodeError("Error decoding ComAtprotoLabelDefs.SelfLabels: \(error)")
                }
            
            case "com.atproto.label.defs#selfLabel":
                do {
                    let decodedObject = try ComAtprotoLabelDefs.SelfLabel.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoLabelDefs.SelfLabel: \(error)")
                    self = .decodeError("Error decoding ComAtprotoLabelDefs.SelfLabel: \(error)")
                }
            
            case "com.atproto.server.defs#inviteCode":
                do {
                    let decodedObject = try ComAtprotoServerDefs.InviteCode.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoServerDefs.InviteCode: \(error)")
                    self = .decodeError("Error decoding ComAtprotoServerDefs.InviteCode: \(error)")
                }
            
            case "com.atproto.server.defs#inviteCodeUse":
                do {
                    let decodedObject = try ComAtprotoServerDefs.InviteCodeUse.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoServerDefs.InviteCodeUse: \(error)")
                    self = .decodeError("Error decoding ComAtprotoServerDefs.InviteCodeUse: \(error)")
                }
            
            case "com.atproto.server.listAppPasswords#appPassword":
                do {
                    let decodedObject = try ComAtprotoServerListAppPasswords.AppPassword.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoServerListAppPasswords.AppPassword: \(error)")
                    self = .decodeError("Error decoding ComAtprotoServerListAppPasswords.AppPassword: \(error)")
                }
            
            case "com.atproto.server.createInviteCodes#accountCodes":
                do {
                    let decodedObject = try ComAtprotoServerCreateInviteCodes.AccountCodes.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoServerCreateInviteCodes.AccountCodes: \(error)")
                    self = .decodeError("Error decoding ComAtprotoServerCreateInviteCodes.AccountCodes: \(error)")
                }
            
            case "com.atproto.server.createAppPassword#appPassword":
                do {
                    let decodedObject = try ComAtprotoServerCreateAppPassword.AppPassword.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoServerCreateAppPassword.AppPassword: \(error)")
                    self = .decodeError("Error decoding ComAtprotoServerCreateAppPassword.AppPassword: \(error)")
                }
            
            case "com.atproto.server.describeServer#links":
                do {
                    let decodedObject = try ComAtprotoServerDescribeServer.Links.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoServerDescribeServer.Links: \(error)")
                    self = .decodeError("Error decoding ComAtprotoServerDescribeServer.Links: \(error)")
                }
            
            case "com.atproto.sync.listRepos#repo":
                do {
                    let decodedObject = try ComAtprotoSyncListRepos.Repo.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoSyncListRepos.Repo: \(error)")
                    self = .decodeError("Error decoding ComAtprotoSyncListRepos.Repo: \(error)")
                }
            
            case "com.atproto.repo.strongRef":
                do {
                    let decodedObject = try ComAtprotoRepoStrongRef.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoRepoStrongRef: \(error)")
                    self = .decodeError("Error decoding ComAtprotoRepoStrongRef: \(error)")
                }
            
            case "com.atproto.repo.applyWrites#create":
                do {
                    let decodedObject = try ComAtprotoRepoApplyWrites.Create.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoRepoApplyWrites.Create: \(error)")
                    self = .decodeError("Error decoding ComAtprotoRepoApplyWrites.Create: \(error)")
                }
            
            case "com.atproto.repo.applyWrites#update":
                do {
                    let decodedObject = try ComAtprotoRepoApplyWrites.Update.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoRepoApplyWrites.Update: \(error)")
                    self = .decodeError("Error decoding ComAtprotoRepoApplyWrites.Update: \(error)")
                }
            
            case "com.atproto.repo.applyWrites#delete":
                do {
                    let decodedObject = try ComAtprotoRepoApplyWrites.Delete.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoRepoApplyWrites.Delete: \(error)")
                    self = .decodeError("Error decoding ComAtprotoRepoApplyWrites.Delete: \(error)")
                }
            
            case "com.atproto.repo.listRecords#record":
                do {
                    let decodedObject = try ComAtprotoRepoListRecords.Record.init(from: decoder)
                    self = .custom(decodedObject)
                } catch {
                    print("Error decoding ComAtprotoRepoListRecords.Record: \(error)")
                    self = .decodeError("Error decoding ComAtprotoRepoListRecords.Record: \(error)")
                }
            
                default:
                    do {
                        let unknownObject = try JSONValue.decodeAny(from: container)
                        self = .unknownType(typeValue, unknownObject)
                    } catch {
                        self = .decodeError("Decoding unknown type error: \(error)")
                    }

            }
        } else {
            do {
                let container = try decoder.singleValueContainer()

                if let stringValue = try? container.decode(String.self) {
                    self = .string(stringValue)
                } else if let intValue = try? container.decode(Int.self) {
                    self = .number(intValue)
                } else if let bigNumberString = try? container.decode(String.self) {
                    self = .bigNumber(bigNumberString)
                } else if let boolValue = try? container.decode(Bool.self) {
                    self = .bool(boolValue)
                } else if container.decodeNil() {
                    self = .null
                } else if var arrayContainer = try? decoder.unkeyedContainer() {
                    var array = [JSONValue]()
                    while !arrayContainer.isAtEnd {
                        let value = try arrayContainer.decode(JSONValue.self)
                        array.append(value)
                    }
                    self = .array(array)
                } else if let object = try? container.decode([String: JSONValue].self) {
                    self = .object(object)
                } else {
                    throw DecodingError.dataCorruptedError(in: container, debugDescription: "JSONValue cannot be decoded")
                }
            } catch {
                self = .decodeError("Decoding error: \\(error)")
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