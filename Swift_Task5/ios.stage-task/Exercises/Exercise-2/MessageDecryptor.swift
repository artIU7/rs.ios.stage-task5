import UIKit

class MessageDecryptor: NSObject {
    var decodeMessage = ""
    func decryptMessage(_ message: String) -> String {
        var mutableMessage = message
        for ch in mutableMessage {
            if ch.isNumber {
                let countRepeat = Int(String(ch))
                mutableMessage.removeFirst()
                let endIndex = searchMess(message: mutableMessage)
               
                let sMess = mutableMessage.index(mutableMessage.startIndex, offsetBy: 1)
                let eMess = mutableMessage.index(mutableMessage.startIndex, offsetBy: endIndex - 1)
                //
                let mMess = mutableMessage.index(mutableMessage.startIndex, offsetBy: endIndex)
                for _ in 0...countRepeat! - 1 {
                     decodeMessage += String(mutableMessage[sMess..<eMess])
                     print("Decode message : \(decodeMessage)")
                }
                mutableMessage = String(mutableMessage[mMess..<mutableMessage.endIndex])
                print("Mut sring : \(mutableMessage)")
                if !mutableMessage.isEmpty {
                    print(" call method with \(mutableMessage)")
                    decryptMessage(mutableMessage)
                }

            } else {
                decodeMessage += String(ch)
                if mutableMessage.count != 0 {
                    mutableMessage.removeFirst()
                }
            }
        }
        return decodeMessage
    }
    func searchMess(message : String) -> Int {
        var indexSearch : Int = 0
        for ch in message {
            indexSearch += 1
            if ch == "]" {
                break
            }
        }
        return indexSearch
    }
}
