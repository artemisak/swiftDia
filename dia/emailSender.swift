import SwiftUI
import UIKit
import MessageUI
import SQLite

enum emailErorrs: Error {
    case nilEmail
    case mailApp
}

class emailSender: NSObject, MFMailComposeViewControllerDelegate {
    
    public static let shared = emailSender()
    
    override init() {
    }

    func sendEmail(subject:String, body:String, to:String, xlsxFile: Data) throws {
        guard MFMailComposeViewController.canSendMail() else {
            throw emailErorrs.mailApp
        }
        let sender = MFMailComposeViewController()
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.setLocalizedDateFormatFromTemplate("dd.MM.yyyy")
        sender.mailComposeDelegate = self
        sender.modalPresentationStyle = .fullScreen
        sender.navigationBar.tintColor = UIColor(red: 0.20, green: 0.47, blue: 0.96, alpha: 1)
        sender.setSubject(subject)
        sender.setMessageBody(body, isHTML: true)
        sender.setToRecipients([to])
        sender.addAttachmentData(xlsxFile, mimeType: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", fileName: "Dial\(findPacientname()![0][0]+" "+findPacientname()![0][1]+" "+dateFormatter.string(from: date)).xlsx")
        UIApplication.shared.currentUIWindow()?.rootViewController?.present(sender, animated: true, completion: nil)
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}

func findAdress() throws -> String {
    do {
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let path = documents + "/diacompanion.db"
        let sourcePath = Bundle.main.path(forResource: "diacompanion", ofType: "db")!
        _=copyDatabaseIfNeeded(sourcePath: sourcePath)
        let db = try Connection(path)
        let users_info = Table("usermac")
        let doc = Expression<String?>("doc")
        var doc_adress: [String] = []
        for i in try db.prepare(users_info.select(doc)) {
            guard i[doc] != nil else {
                throw emailErorrs.nilEmail
            }
            doc_adress.append(i[doc]!)
        }
        switch doc_adress.first! {
        case "?????????????? ???????? ????????????????????":
            return "anchylove@mail.com"
        case "???????????????? ?????? ????????????????????":
            return "yanabolotko@gmail.com"
        case "?????????????? ???????????????????? ????????????????????????":
            return "aleksandra-dronova@yandex.ru"
        case "???????????? ???????????? ????????????????????":
            return "pvpopova@yandex.ru"
        case "???????????? ???????????????????? ??????????????????":
            return "aleksandra.tkachuk.1988@mail.com"
        case "???????????????? ?????????? ????????????????":
            return "elenavasukova2@gmail.com"
        default:
            return " "
        }
    }
    catch {
        print(error)
        return ""
    }
}

func findPacientname() -> [[String]]? {
    do {
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let path = documents + "/diacompanion.db"
        let sourcePath = Bundle.main.path(forResource: "diacompanion", ofType: "db")!
        _=copyDatabaseIfNeeded(sourcePath: sourcePath)
        let db = try Connection(path)
        let users_info = Table("usermac")
        let fio = Expression<String?>("fio")
        let id = Expression<Int?>("id")
        var metaInfo: [[String]] = []
        for i in try db.prepare(users_info.select(id, fio)){
            metaInfo.append([String(i[id] ?? 1), i[fio] ?? "?????????? ????????????????????????"])
        }
        return metaInfo
    }
    catch {
        print(error)
        return nil
    }
}
