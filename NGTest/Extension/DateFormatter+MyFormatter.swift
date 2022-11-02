//
//  DateFormatter+MyFormatter.swift
//  NGTest
//
import Foundation


extension DateFormatter {
   static let formatArticle: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
      return formatter
   }()
    
    static let formatAffichage: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
       return formatter
    }()
}


extension Date {
   func formatToString(using formatter: DateFormatter) -> String {
      return formatter.string(from: self)
   }
}
