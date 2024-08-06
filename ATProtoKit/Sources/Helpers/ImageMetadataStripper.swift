import Foundation
import ImageIO
import MobileCoreServices

public class ImageMetadataStripper {
    public static func stripMetadata(from imageData: Data) -> Data? {
        guard let source = CGImageSourceCreateWithData(imageData as CFData, nil) else {
            print("Failed to create image source")
            return nil
        }
        
        let mutableData = NSMutableData()
        guard let destination = CGImageDestinationCreateWithData(mutableData, CGImageSourceGetType(source)!, 1, nil) else {
            print("Failed to create image destination")
            return nil
        }
        
        guard let imageProperties = CGImageSourceCopyPropertiesAtIndex(source, 0, nil) as? [String: Any] else {
            print("Failed to copy image properties")
            return nil
        }
        
        var strippedProperties = imageProperties
        
        // Remove EXIF data
        strippedProperties[kCGImagePropertyExifDictionary as String] = nil
        
        // Remove GPS data
        strippedProperties[kCGImagePropertyGPSDictionary as String] = nil
        
        // Remove TIFF data
        strippedProperties[kCGImagePropertyTIFFDictionary as String] = nil
        
        // Remove IPTC data
        strippedProperties[kCGImagePropertyIPTCDictionary as String] = nil
        
        CGImageDestinationAddImageFromSource(destination, source, 0, strippedProperties as CFDictionary)
        
        guard CGImageDestinationFinalize(destination) else {
            print("Failed to finalize image destination")
            return nil
        }
        
        return mutableData as Data
    }
}