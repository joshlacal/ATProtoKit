//
//  RichText.swift
//
//
//  Created by Josh LaCalamito on 11/30/23.
//

import Foundation
import SwiftUI


public enum RichTextElement {
    case mention(start: Int, end: Int, value: String)
    case link(start: Int, end: Int, value: String)
    case tag(start: Int, end: Int, value: String)
}

public final class RichTextManager {
    
    public static func processRichTextFacets(_ facets: [AppBskyRichtextFacet]) -> [RichTextElement] {
        var richTextElements: [RichTextElement] = []
        
        for facet in facets {
            let startOffset = facet.index.byteStart
            let endOffset = facet.index.byteEnd
            
            for feature in facet.features {
                switch feature {
                case .appBskyRichtextFacetMention(let mention):
                    richTextElements.append(.mention(start: startOffset, end: endOffset, value: mention.did))
                case .appBskyRichtextFacetLink(let link):
                    richTextElements.append(.link(start: startOffset, end: endOffset, value: link.uri.uriString()))
                case .appBskyRichtextFacetTag(let tag):
                    richTextElements.append(.tag(start: startOffset, end: endOffset, value: tag.tag))
                default:
                    break
                }
            }
        }
        
        return richTextElements
    }
    
    public static func extractByteSlice(from string: String, byteStart: Int, byteEnd: Int) -> String? {
        let data = string.data(using: .utf8)!
        
        // Ensure the byte range is valid
        guard byteStart >= 0, byteEnd <= data.count, byteStart < byteEnd else {
            return nil
        }
        
        let range = byteStart ..< byteEnd
        let slice = data.subdata(in: range)
        
        // Convert the data slice back to a string
        return String(data: slice, encoding: .utf8)
    }
    
    public struct TextSegment {
        let start: Int
        let end: Int
        let value: String
    }
    
    public static func parseMentionsAndLinks(in text: String) -> ([TextSegment], [TextSegment]) {
        let mentionPattern = "@([a-zA-Z0-9_-]+)"
        let urlPattern = "(https?:\\/\\/[a-zA-Z0-9\\.\\-\\_\\/?=&]+)"
        
        let mentions = text.ranges(of: mentionPattern).map { range -> TextSegment in
            let value = String(text[range])
            return TextSegment(start: text.distance(from: text.startIndex, to: range.lowerBound),
                               end: text.distance(from: text.startIndex, to: range.upperBound),
                               value: value)
        }
        
        let urls = text.ranges(of: urlPattern).map { range -> TextSegment in
            // Extract the match and its range
            let value = String(text[range])
            return TextSegment(start: text.distance(from: text.startIndex, to: range.lowerBound),
                               end: text.distance(from: text.startIndex, to: range.upperBound),
                               value: value)
        }
        
        return (mentions, urls)
    }
    
    public static func createFacets(forMentions mentions: [TextSegment], andLinks links: [TextSegment]) -> [AppBskyRichtextFacet] {
        var facets = [AppBskyRichtextFacet]()
        
        for mention in mentions {
            let byteSlice = AppBskyRichtextFacet.ByteSlice(byteStart: mention.start, byteEnd: mention.end)
            let mentionFeature = AppBskyRichtextFacet.Mention(did: mention.value)
            let facet = AppBskyRichtextFacet(index: byteSlice, features: [.appBskyRichtextFacetMention(mentionFeature)])
            facets.append(facet)
        }
        
        for link in links {
            let byteSlice = AppBskyRichtextFacet.ByteSlice(byteStart: link.start, byteEnd: link.end)
            let linkFeature = AppBskyRichtextFacet.Link(uri: URI(uriString: link.value))
            let facet = AppBskyRichtextFacet(index: byteSlice, features: [.appBskyRichtextFacetLink(linkFeature)])
            facets.append(facet)
        }
        
        return facets
    }
    
    public static func getStartEndIndices(from element: RichTextElement) -> (Int, Int) {
        switch element {
        case .mention(let start, let end, _),
                .link(let start, let end, _),
                .tag(let start, let end, _):
            return (start, end)
        }
    }
    
    public static func getUrl(from element: RichTextElement) -> URL? {
        switch element {
        case .link(_, _, let value):
            return URL(string: value)
        default:
            return nil
        }
    }
    
    public static func extractPostTextAndFacets(from record: ATProtocolValueContainer) -> (String, [AppBskyRichtextFacet])? {
        if case let .knownType(anyATProtocolValue) = record  {
            if let feedPost = anyATProtocolValue as? AppBskyFeedPost {
                
                return (feedPost.text, feedPost.facets ?? [])
            }
        }                 else {
            return nil
        }
        return nil

    }
}
