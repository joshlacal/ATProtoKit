import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.moderation.defs


public struct ComAtprotoModerationDefs { 
    public static let typeIdentifier = "com.atproto.moderation.defs"


        
public enum ReasonType: String, Codable, ATProtocolCodable, ATProtocolValue {
            // 
            case Comatprotomoderationdefsreasonspam = "com.atproto.moderation.defs#reasonSpam"
            // 
            case Comatprotomoderationdefsreasonviolation = "com.atproto.moderation.defs#reasonViolation"
            // 
            case Comatprotomoderationdefsreasonmisleading = "com.atproto.moderation.defs#reasonMisleading"
            // 
            case Comatprotomoderationdefsreasonsexual = "com.atproto.moderation.defs#reasonSexual"
            // 
            case Comatprotomoderationdefsreasonrude = "com.atproto.moderation.defs#reasonRude"
            // 
            case Comatprotomoderationdefsreasonother = "com.atproto.moderation.defs#reasonOther"
            // 
            case Comatprotomoderationdefsreasonappeal = "com.atproto.moderation.defs#reasonAppeal"

            public func isEqual(to other: any ATProtocolValue) -> Bool {
                guard let otherEnum = other as? ReasonType else { return false }
                return self.rawValue == otherEnum.rawValue
            }
        }


}

                           
