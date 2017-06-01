//
//  WeekCalendarCell.swift
//  WeekCalendar
//
//  Created by User on 6/1/17.
//  Copyright © 2017 vikram singh rajpoot. All rights reserved.
//

import UIKit

protocol WeekCalendarCellDelegate:class {
    func dateDidSelected(index:Int)
}

class WeekCalendarCell:UICollectionViewCell{
    
    let color = UIColor(red: 53/255, green: 155/255, blue: 210/255, alpha: 1)
    
    @IBOutlet weak var dateBtn: UIButton!
    weak var delegate:WeekCalendarCellDelegate?
    
    func updateDay(day:String){
        self.dateBtn.setTitle(day, for: .normal)
    }
    
    func configureCell(indexPath: IndexPath,nextDate:Date) -> Void {
        self.dateBtn.tag = indexPath.row
        //Setting day on button
        let day = nextDate.dayOfWeek()
        self.dateBtn.setTitle(String(day), for: .normal)

    }
    
    func showSelecteDate(selectedDate:Date?,nexteDate:Date){
        let nextDateString = nexteDate.getDateMonthYear()
        var currentDateString:String?
       
        if let nonNilSelectedDate = selectedDate {
            currentDateString = nonNilSelectedDate.getDateMonthYear()
        }else{
            currentDateString = Date().getDateMonthYear()
        }
        
        if(currentDateString == nextDateString){
            self.dateBtn.backgroundColor = UIColor.white
            self.dateBtn.setTitleColor(color, for: .normal)
        }else{
            self.dateBtn.backgroundColor = color
            self.dateBtn.setTitleColor(UIColor.white, for: .normal)
            
        }
    }
    
    override func awakeFromNib() {
        dateBtn.layer.cornerRadius = dateBtn.frame.width / 2
    }
    
    @IBAction func dateSelected(_ sender: UIButton) {
      let index = sender.tag
      self.delegate?.dateDidSelected(index: index)
    }
}
