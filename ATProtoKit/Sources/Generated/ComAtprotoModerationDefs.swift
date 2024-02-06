import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.moderation.defs


public struct ComAtprotoModerationDefs { 
    public static let typeIdentifier = "com.atproto.moderation.defs"


        
public enum ReasonType: String, Codable, ATProtocolCodable, ATProtocolValue {
            // 
            case comAtprotoModerationDefsReasonSpam = "com.atproto.moderation.defs#reasonSpam"
            // 
            case comAtprotoModerationDefsReasonViolation = "com.atproto.moderation.defs#reasonViolation"
            // 
            case comAtprotoModerationDefsReasonMisleading = "com.atproto.moderation.defs#reasonMisleading"
            // 
            case comAtprotoModerationDefsReasonSexual = "com.atproto.moderation.defs#reasonSexual"
            // 
            case comAtprotoModerationDefsReasonRude = "com.atproto.moderation.defs#reasonRude"
            // 
            case comAtprotoModerationDefsReasonOther = "com.atproto.moderation.defs#reasonOther"
            // 
            case comAtprotoModerationDefsReasonAppeal = "com.atproto.moderation.defs#reasonAppeal"

            public func isEqual(to other: any ATProtocolValue) -> Bool {
                guard let otherEnum = other as? ReasonType else { return false }
                return self.rawValue == otherEnum.rawValue
            }
        }


}

                           
