import Foundation
import Kitura
import LoggerAPI

class KituraFile: RouterMiddleware {
    /// Default directory where files will be uploaded
    let defaultDirectory: String
    
    /// Instance of the class that will generate a name for the file to upload
    /// Default : UUID()
    /// Generates a UUID without - lowercased
    let fileNameGenerator: FileNameGenerator
    
    /// Instance of FileManager to create files
    let fm = FileManager.default
    
    enum FileError: Error {
        case create(String, String)
        
        var localizedDescription: String {
            switch self {
            case .create(let filename, let defaultDir):
                return "Couldn't create file \(filename) at \(defaultDir))"
            }
        }
    }
    
    public init(forDirectory d: String = "public", fileNameGenerator fng: FileNameGenerator = UUID()) {
        defaultDirectory = fm.currentDirectoryPath + d
        fileNameGenerator = fng
    }
    
    func handle(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
        let storageName = fileNameGenerator.generateFileName()
        request.file = File(name: nil, data: nil, storageName: storageName, fileType: nil)
        Log.info("File will be stored with name \(storageName)")
        
        next()
        
        if let file = request.file {
            let completeFilePath = defaultDirectory + storageName
            if (!fm.createFile(atPath: completeFilePath, contents: file.data, attributes: nil)) {
                throw FileError.create(request.file?.name ?? storageName, defaultDirectory)
            } else {
                Log.info("Successfully created \(completeFilePath)")
            }
        } else {
            if nil != request.userInfo["file"] {
                Log.error("Couldn't handle file sent.\nMake sure it is an instance of File")
            } else {
                Log.info("No file was found for route \(request.parsedURL)")
            }
        }
    }
}

extension RouterRequest {
    var file: File? {
        get {
            return userInfo["file"] as? File
        }
        set {
            userInfo["file"] = newValue
        }
    }
}
