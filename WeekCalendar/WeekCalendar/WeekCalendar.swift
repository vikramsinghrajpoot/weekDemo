//
//  ViewController.swift
//  WeekCalendar
//
//  Created by vikram singh rajpoot on 31/05/17.
//  Copyright © 2017 vikram singh rajpoot. All rights reserved.
//

import UIKit

class WeekCalendar: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var monthLbl: UILabel!
    
    var weekStartDate:Date? = Date().getWeekStartDate()
    var selectedDate:Date?
    var numberOfWeeks = 20 * 7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.monthLbl.text = Date().getDateMonthYear()

    }
     
    var screenWidth:CGFloat{
        return self.view.bounds.size.width
    }
    
    var cellSize:CGFloat{
        return (screenWidth) / 7
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension WeekCalendar:UICollectionViewDataSource{
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return numberOfWeeks
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell:WeekCalendarCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! WeekCalendarCell
        cell.delegate = self
        let nextDate = weekStartDate?.getNextDay(value: indexPath.row)
        cell.configureCell(indexPath: indexPath, nextDate: nextDate!)
        cell.showSelecteDate(selectedDate: self.selectedDate, nexteDate: nextDate!)
        return cell
    }

}

extension WeekCalendar:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: cellSize, height: cellSize)
    }
}

extension WeekCalendar:WeekCalendarCellDelegate{
    
    func dateDidSelected(index:Int){
        self.selectedDate = weekStartDate?.getNextDay(value: index)
        self.monthLbl.text = self.selectedDate?.getDateMonthYear()
        self.collectionView.reloadData()
    }

}

