import Foundation
import SQLite
import SwiftUI

func addName(pName: String){
    do {
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let path = documents + "/diacompanion.db"
        let sourcePath = Bundle.main.path(forResource: "diacompanion", ofType: "db")!
        _=copyDatabaseIfNeeded(sourcePath: sourcePath)
        let db = try Connection(path)
        let users = Table("usermac")
        let name = Expression<String>("fio")
        let _id = Expression<Int>("id")
        
        let all = Array(try db.prepare(users.select(_id)))
        if all.count != 0 {
            try db.run(users.update(name <- pName))
        } else {
            try db.run(users.insert(name <- pName))
        }
        
    } catch {
        print(error)
    }
}

func addDate(pDate: String){
    do {
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let path = documents + "/diacompanion.db"
        let sourcePath = Bundle.main.path(forResource: "diacompanion", ofType: "db")!
        _=copyDatabaseIfNeeded(sourcePath: sourcePath)
        let db = try Connection(path)
        let users = Table("usermac")
        let bdate = Expression<String>("birthday")
        let _id = Expression<Int>("id")
        let all = Array(try db.prepare(users.select(_id)))
        if all.count != 0 {
            try db.run(users.update(bdate <- pDate))
        } else {
            try db.run(users.insert(bdate <- pDate))
        }
    } catch {
        print(error)
    }
}

func addVrach(pVrach: String){
    do {
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let path = documents + "/diacompanion.db"
        let sourcePath = Bundle.main.path(forResource: "diacompanion", ofType: "db")!
        _=copyDatabaseIfNeeded(sourcePath: sourcePath)
        let db = try Connection(path)
        let users = Table("usermac")
        let doc = Expression<String>("doc")
        let _id = Expression<Int>("id")
        let all = Array(try db.prepare(users.select(_id)))
        if all.count != 0 {
            try db.run(users.update(doc <- pVrach))
        } else {
            try db.run(users.insert(doc <- pVrach))
        }
    } catch {
        print(error)
    }
}

func addDateS(pDate: String){
    do {
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let path = documents + "/diacompanion.db"
        let sourcePath = Bundle.main.path(forResource: "diacompanion", ofType: "db")!
        _=copyDatabaseIfNeeded(sourcePath: sourcePath)
        let db = try Connection(path)
        let users = Table("usermac")
        let dateS = Expression<String>("datebegin")
        let _id = Expression<Int>("id")
        let all = Array(try db.prepare(users.select(_id)))
        if all.count != 0 {
            try db.run(users.update(dateS <- pDate))
        } else {
            try db.run(users.insert(dateS <- pDate))
        }
    } catch {
        print(error)
    }
}

func addWeekDay(week: Int, day: Int){
    do {
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let path = documents + "/diacompanion.db"
        let sourcePath = Bundle.main.path(forResource: "diacompanion", ofType: "db")!
        _=copyDatabaseIfNeeded(sourcePath: sourcePath)
        let db = try Connection(path)
        let users = Table("usermac")
        let pweek = Expression<Int>("week")
        let pday = Expression<Int>("day")
        let _id = Expression<Int>("id")
        let all = Array(try db.prepare(users.select(_id)))
        if all.count != 0 {
            try db.run(users.update(pweek <- week, pday <- day))
        } else {
            try db.run(users.insert(pweek <- week, pday <- day))
        }
    } catch {
        print(error)
    }
}

func addID(id: Int){
    do {
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let path = documents + "/diacompanion.db"
        let sourcePath = Bundle.main.path(forResource: "diacompanion", ofType: "db")!
        _=copyDatabaseIfNeeded(sourcePath: sourcePath)
        let db = try Connection(path)
        let users = Table("usermac")
        let _id = Expression<Int>("id")
        let all = Array(try db.prepare(users.select(_id)))
        if all.count != 0 {
            try db.run(users.update(_id <- id))
        } else {
            try db.run(users.insert(_id <- id))
        }
    } catch {
        print(error)
    }
}

func addWeight(Weight: Double){
    do {
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let path = documents + "/diacompanion.db"
        let sourcePath = Bundle.main.path(forResource: "diacompanion", ofType: "db")!
        _=copyDatabaseIfNeeded(sourcePath: sourcePath)
        let db = try Connection(path)
        let users = Table("usermac")
        let weight = Expression<Double>("weight")
        let _id = Expression<Int>("id")
        let all = Array(try db.prepare(users.select(_id)))
        if all.count != 0 {
            try db.run(users.update(weight <- Weight))
        } else {
            try db.run(users.insert(weight <- Weight))
        }
    } catch {
        print(error)
    }
}

func addHeight(Height: Double){
    do {
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let path = documents + "/diacompanion.db"
        let sourcePath = Bundle.main.path(forResource: "diacompanion", ofType: "db")!
        _=copyDatabaseIfNeeded(sourcePath: sourcePath)
        let db = try Connection(path)
        let users = Table("usermac")
        let height = Expression<Double>("height")
        let _id = Expression<Int>("id")
        let all = Array(try db.prepare(users.select(_id)))
        if all.count != 0 {
            try db.run(users.update(height <- Height))
        } else {
            try db.run(users.insert(height <- Height))
        }
    } catch {
        print(error)
    }
}

func addSugarChange(lvl: Double, period: String, physical: Int, time: String){
    do {
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let path = documents + "/diacompanion.db"
        let sourcePath = Bundle.main.path(forResource: "diacompanion", ofType: "db")!
        _=copyDatabaseIfNeeded(sourcePath: sourcePath)
        let db = try Connection(path)
        let sugar = Table("sugarChange")
        let _lvl = Expression<Double>("lvl")
        let _period = Expression<String>("period")
        let _physical = Expression<Int>("physical")
        let _time = Expression<String>("time")
        try db.run(sugar.insert(_lvl <- lvl, _period <- period, _physical <- physical, _time <- time))
    }
    catch {
        print(error)
    }
}

func addAct(min: Int, rod: String, time: String){
    do {
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let path = documents + "/diacompanion.db"
        let sourcePath = Bundle.main.path(forResource: "diacompanion", ofType: "db")!
        _=copyDatabaseIfNeeded(sourcePath: sourcePath)
        let db = try Connection(path)
        let act = Table("act")
        let _min = Expression<Int>("min")
        let _rod = Expression<String>("rod")
        let _time = Expression<String>("time")
        try db.run(act.insert(_min <- min, _rod <- rod, _time <- time))
    }
    catch {
        print(error)
    }
}

func addInject(ed: Double, type: String, priem: String, time: String){
    do {
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let path = documents + "/diacompanion.db"
        let sourcePath = Bundle.main.path(forResource: "diacompanion", ofType: "db")!
        _=copyDatabaseIfNeeded(sourcePath: sourcePath)
        let db = try Connection(path)
        let inject = Table("inject")
        let _ed = Expression<Double>("ed")
        let _type = Expression<String>("type")
        let _priem = Expression<String>("priem")
        let _time = Expression<String>("time")
        try db.run(inject.insert(_ed <- ed, _type <- type, _priem <- priem, _time <- time))
    }
    catch {
        print(error)
    }
}

func addMassa(m: Double, time: String){
    do {
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let path = documents + "/diacompanion.db"
        let sourcePath = Bundle.main.path(forResource: "diacompanion", ofType: "db")!
        _=copyDatabaseIfNeeded(sourcePath: sourcePath)
        let db = try Connection(path)
        let massa = Table("massa")
        let _m = Expression<Double>("m")
        let _time = Expression<String>("time")
        try db.run(massa.insert(_m <- m, _time <- time))
    }
    catch {
        print(error)
    }
}

func addKetonur(mmol: Double, time: String){
    do {
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let path = documents + "/diacompanion.db"
        let sourcePath = Bundle.main.path(forResource: "diacompanion", ofType: "db")!
        _=copyDatabaseIfNeeded(sourcePath: sourcePath)
        let db = try Connection(path)
        let ketonut = Table("ketonur")
        let _mmol = Expression<Double>("mmol")
        let _time = Expression<String>("time")
        try db.run(ketonut.insert(_mmol <- mmol, _time <- time))
    }
    catch{
        print(error)
    }
}

func addDatesToDB(dates: [Date]) {
    var exist_dates : [Date] = []
    do {
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let path = documents + "/diacompanion.db"
        let sourcePath = Bundle.main.path(forResource: "diacompanion", ofType: "db")!
        _=copyDatabaseIfNeeded(sourcePath: sourcePath)
        let db = try Connection(path)
        let fulldays = Table("fulldays")
        let day = Expression<String>("day")
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.setLocalizedDateFormatFromTemplate("dd.MM.yyyy")
        
        for i in try db.prepare(fulldays.select(day)){
            exist_dates.append(dateFormatter.date(from: i[day])!)
        }
        
        for i in 0..<dates.count {
            if  !exist_dates.contains(dates[i]) {
                try db.run(fulldays.insert(day <- dateFormatter.string(from: dates[i])))
            }
        }
        
        for i in 0..<exist_dates.count {
            if  !dates.contains(exist_dates[i]) {
                try db.run(fulldays.filter(day == dateFormatter.string(from:exist_dates[i])).delete())
            }
        }
    }
    catch {
        print(error)
    }
}

func getDatesFromDB() -> [Date] {
    var dates : [Date] = []
    do {
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let path = documents + "/diacompanion.db"
        let sourcePath = Bundle.main.path(forResource: "diacompanion", ofType: "db")!
        _=copyDatabaseIfNeeded(sourcePath: sourcePath)
        let db = try Connection(path)
        let fulldays = Table("fulldays")
        let day = Expression<String>("day")
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.setLocalizedDateFormatFromTemplate("dd.MM.yyyy")
        for i in try db.prepare(fulldays.select(day)) {
            dates.append(dateFormatter.date(from: i[day])!)
        }
    }
    catch {
        print(error)
    }
    return dates
}

func copyDatabaseIfNeeded(sourcePath: String) -> Bool {
    let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    let destinationPath = documents + "/diacompanion.db"
    let exists = FileManager.default.fileExists(atPath: destinationPath)
    guard !exists else { return false }
    do {
        try FileManager.default.copyItem(atPath: sourcePath, toPath: destinationPath)
        return true
    } catch {
        print("error during file copy: \(error)")
        return false
    }
}

enum inputErorrs: Error {
    case decimalError
    case EmptyError
    case SymbolicError
    case UndefinedError
}

func convert(txt: String) throws -> Double {
    let decimal = txt.components(separatedBy:",")
    guard decimal.count-1 < 2 else {
        throw inputErorrs.decimalError
    }
    guard !txt.isEmpty else {
        throw inputErorrs.EmptyError
    }
    guard (Double(String(txt.map{ $0 == "," ? "." : $0})) != nil) else {
        throw inputErorrs.UndefinedError
    }
    return Double(String(txt.map{ $0 == "," ? "." : $0}))!
}

func convertToInt(txt: String) throws -> Int {
    guard !txt.isEmpty else {
        throw inputErorrs.EmptyError
    }
    guard (Int(txt) != nil) else {
        throw inputErorrs.UndefinedError
    }
    return Int(txt)!
}

func checkName(txt: String) throws -> String {
    guard !txt.isEmpty else {
        throw inputErorrs.EmptyError
    }
    guard !txt.contains(where: {$0 == "." || $0 == "," || $0 == "?" || $0 == "/" || $0 == "$" || $0 == "%" || $0 == ":" || $0 == "!" || $0 == "@" || $0 == "#" || $0 == "^" || $0 == "&" || $0 == "*" || $0 == ";"}) else {
        throw inputErorrs.SymbolicError
    }
    return txt
}


func checkBMI() -> Bool {
    var res: Bool = false
    do {
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let path = documents + "/diacompanion.db"
        let sourcePath = Bundle.main.path(forResource: "diacompanion", ofType: "db")!
        _=copyDatabaseIfNeeded(sourcePath: sourcePath)
        let db = try Connection(path)
        let pacient = Table("usermac")
        let w = Expression<Double?>("weight")
        let h = Expression<Double?>("height")
        for i in try db.prepare(pacient.select(w,h)){
            if (i[w] != nil && i[h] != nil) {
                res = true
            }
        }
    }
    catch {
        print(error)
    }
    return res
}

func deleteAccaunt() {
    do {
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let path = documents + "/diacompanion.db"
        let sourcePath = Bundle.main.path(forResource: "diacompanion", ofType: "db")!
        _=copyDatabaseIfNeeded(sourcePath: sourcePath)
        let db = try Connection(path)
        let act = Table("act")
        try db.run(act.delete())
        let deleted = Table("deleted")
        try db.run(deleted.delete())
        let diary = Table("diary")
        try db.run(diary.delete())
        let fulldays = Table("fulldays")
        try db.run(fulldays.delete())
        let inject = Table("inject")
        try db.run(inject.delete())
        let ketonur = Table("ketonur")
        try db.run(ketonur.delete())
        let massa = Table("massa")
        try db.run(massa.delete())
        let predicted = Table("predicted")
        try db.run(predicted.delete())
        let sugarChange = Table("sugarChange")
        try db.run(sugarChange.delete())
        let usermac = Table("usermac")
        let id = Expression<Int>("id")
        let loggedin = Expression<Int>("loggedin")
        try db.run(usermac.delete())
        try db.run(usermac.insert(id <- 1, loggedin <- 0))
    }
    catch {
        print(error)
    }
}
