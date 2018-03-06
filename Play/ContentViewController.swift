//
//  ContentViewController.swift
//  RoastMe
//
//  Created by Cynthia Zhou on 3/5/18.
//  Copyright © 2018 Cynthia Zhou. All rights reserved.
//

import UIKit

/*
class Profile_Roasts {
    var content: String?
    var corr_roastpic: UIImage = UIImage()
    var fire: UIImage = UIImage(named: "fire")!
    
    /*
     A few declarations:
     var imageA1: UIImage? = nil
     var imageA2: UIImage!
     var imageA3: UIImage = UIImage()
     var imageA4: UIImage? = UIImage()
     var imageA5: UIImage = UIImage(named: "redQuestionMark")!
     var imageA6: UIImage? = UIImage(named: "redQuestionMark")
    */
    
    /*
    var backgroundColor: UIColor {
        if action == "sell" {
            return UIColor.greenColor()
        }
        return UIColor.blueColor()
    }
    
    var typeColor: UIColor {
        if action == "sell" {
            return UIColor.blackColor()
        }
        return UIColor.purpleColor()
    }
    
    var priceLabelColor: UIColor {
        if action == "sell" {
            return UIColor.redColor()
        }
        return UIColor.greenColor()
    }
 */
}
*/
/*

class Profile_RoastCell: UITableViewCell {
    
    let padding: CGFloat = 5
    var background: UIView!
    var content: String?
    var contentLabel: UILabel!
    var corr_roastpic: UIImage = UIImage()
    var fire: UIImage = UIImage(named: "fire")!
    
    /*
    var stock: Stock? {
        didSet {
            if let s = stock {
                background.backgroundColor = s.backgroundColor
                priceLabel.text = s.price
                priceLabel.backgroundColor = s.priceLabelColor
                typeLabel.text = s.action
                typeLabel.backgroundColor = s.typeColor
                nameLabel.text = s.name
                setNeedsLayout()
            }
        }
    }
    */
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.clearColor
        selectionStyle = .none
        
        background = UIView(frame: CGRectZero)
        background.alpha = 0.6
        contentView.addSubview(background)
        contentLabel = UILabel(frame: CGRectZero)
        contentLabel.textAlignment = .Left
        contentLabel.textColor = UIColor.blackColor()
        contentView.addSubview(content)
        
        typeLabel = UILabel(frame: CGRectZero)
        typeLabel.textAlignment = .Center
        typeLabel.textColor = UIColor.whiteColor()
        contentView.addSubview(typeLabel)
        
        priceLabel = UILabel(frame: CGRectZero)
        priceLabel.textAlignment = .Center
        priceLabel.textColor = UIColor.whiteColor()
        contentView.addSubview(priceLabel)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        background.frame = CGRectMake(0, padding, frame.width, frame.height - 2 * padding)
        typeLabel.frame = CGRectMake(padding, (frame.height - 25)/2, 40, 25)
        priceLabel.frame = CGRectMake(frame.width - 100, padding, 100, frame.height - 2 * padding)
        nameLabel.frame = CGRectMake(CGRectGetMaxX(typeLabel.frame) + 10, 0, frame.width - priceLabel.frame.width - (CGRectGetMaxX(typeLabel.frame) + 10), frame.height)
    }
}

/********************************************
 TABLE VIEW
 ********************************************/

class StockCell: UITableViewCell {
    
    let padding: CGFloat = 5
    var background: UIView!
    var typeLabel: UILabel!
    var nameLabel: UILabel!
    var priceLabel: UILabel!
    
    var stock: Stock? {
        didSet {
            if let s = stock {
                background.backgroundColor = s.backgroundColor
                priceLabel.text = s.price
                priceLabel.backgroundColor = s.priceLabelColor
                typeLabel.text = s.action
                typeLabel.backgroundColor = s.typeColor
                nameLabel.text = s.name
                setNeedsLayout()
            }
        }
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.clearColor()
        selectionStyle = .None
        
        background = UIView(frame: CGRectZero)
        background.alpha = 0.6
        contentView.addSubview(background)
        
        nameLabel = UILabel(frame: CGRectZero)
        nameLabel.textAlignment = .Left
        nameLabel.textColor = UIColor.blackColor()
        contentView.addSubview(nameLabel)
        
        typeLabel = UILabel(frame: CGRectZero)
        typeLabel.textAlignment = .Center
        typeLabel.textColor = UIColor.whiteColor()
        contentView.addSubview(typeLabel)
        
        priceLabel = UILabel(frame: CGRectZero)
        priceLabel.textAlignment = .Center
        priceLabel.textColor = UIColor.whiteColor()
        contentView.addSubview(priceLabel)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    
    class Stock {
        var name: String?
        var action: String?
        var price: String?
        init(stockData: [String: AnyObject]) {
            if let n = stockData["stockName"] as? String {
                name = n
            }
            if let a = stockData["action"] as? String {
                action = a
            }
            if let p = stockData["stockPrice"] as? Float {
                price = NSString(format: "%.2f", p)
            }
        }
        
        var backgroundColor: UIColor {
            if action == "sell" {
                return UIColor.greenColor()
            }
            return UIColor.blueColor()
        }
        
        var typeColor: UIColor {
            if action == "sell" {
                return UIColor.blackColor()
            }
            return UIColor.purpleColor()
        }
        
        var priceLabelColor: UIColor {
            if action == "sell" {
                return UIColor.redColor()
            }
            return UIColor.greenColor()
        }
    }
    
/********************************************
TABLE VIEW CELL
********************************************/
    
    class StockCell: UITableViewCell {
        
        let padding: CGFloat = 5
        var background: UIView!
        var typeLabel: UILabel!
        var nameLabel: UILabel!
        var priceLabel: UILabel!
        
        var stock: Stock? {
            didSet {
                if let s = stock {
                    background.backgroundColor = s.backgroundColor
                    priceLabel.text = s.price
                    priceLabel.backgroundColor = s.priceLabelColor
                    typeLabel.text = s.action
                    typeLabel.backgroundColor = s.typeColor
                    nameLabel.text = s.name
                    setNeedsLayout()
                }
            }
        }
        
        override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            backgroundColor = UIColor.clearColor()
            selectionStyle = .None
            
            background = UIView(frame: CGRectZero)
            background.alpha = 0.6
            contentView.addSubview(background)
            
            nameLabel = UILabel(frame: CGRectZero)
            nameLabel.textAlignment = .Left
            nameLabel.textColor = UIColor.blackColor()
            contentView.addSubview(nameLabel)
            
            typeLabel = UILabel(frame: CGRectZero)
            typeLabel.textAlignment = .Center
            typeLabel.textColor = UIColor.whiteColor()
            contentView.addSubview(typeLabel)
            
            priceLabel = UILabel(frame: CGRectZero)
            priceLabel.textAlignment = .Center
            priceLabel.textColor = UIColor.whiteColor()
            contentView.addSubview(priceLabel)
        }
        
        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func prepareForReuse() {
            super.prepareForReuse()
            
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            background.frame = CGRectMake(0, padding, frame.width, frame.height - 2 * padding)
            typeLabel.frame = CGRectMake(padding, (frame.height - 25)/2, 40, 25)
            priceLabel.frame = CGRectMake(frame.width - 100, padding, 100, frame.height - 2 * padding)
            nameLabel.frame = CGRectMake(CGRectGetMaxX(typeLabel.frame) + 10, 0, frame.width - priceLabel.frame.width - (CGRectGetMaxX(typeLabel.frame) + 10), frame.height)
        }
    }
    in your view controller
    
    var stocks: [Stock] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        
        for stockData in dataArray {
            var stock = Stock(stockData: stockData)
            stocks.append(stock)
        }
        
        
        tableView = UITableView(frame: view.bounds, style: .Grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .None
        tableView.registerClass(StockCell.self, forCellReuseIdentifier: NSStringFromClass(StockCell))
        view.addSubview(tableView)
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier( NSStringFromClass(StockCell), forIndexPath: indexPath) as StockCell
        cell.stock = stocks[indexPath.row]
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    Custom Cell
    
    class StockCell: UITableViewCell {
        
        let padding: CGFloat = 5
        var background: UIView!
        var typeLabel: UILabel!
        var nameLabel: UILabel!
        var priceLabel: UILabel!
        
        var stock: Stock? {
            didSet {
                if let s = stock {
                    background.backgroundColor = s.backgroundColor
                    priceLabel.text = s.price
                    priceLabel.backgroundColor = s.priceLabelColor
                    typeLabel.text = s.action
                    typeLabel.backgroundColor = s.typeColor
                    nameLabel.text = s.name
                    setNeedsLayout()
                }
            }
        }
        
        override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            backgroundColor = UIColor.clearColor()
            selectionStyle = .None
            
            background = UIView(frame: CGRectZero)
            background.alpha = 0.6
            contentView.addSubview(background)
            
            nameLabel = UILabel(frame: CGRectZero)
            nameLabel.textAlignment = .Left
            nameLabel.textColor = UIColor.blackColor()
            contentView.addSubview(nameLabel)
            
            typeLabel = UILabel(frame: CGRectZero)
            typeLabel.textAlignment = .Center
            typeLabel.textColor = UIColor.whiteColor()
            contentView.addSubview(typeLabel)
            
            priceLabel = UILabel(frame: CGRectZero)
            priceLabel.textAlignment = .Center
            priceLabel.textColor = UIColor.whiteColor()
            contentView.addSubview(priceLabel)
        }
        
        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func prepareForReuse() {
            super.prepareForReuse()
            
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            background.frame = CGRectMake(0, padding, frame.width, frame.height - 2 * padding)
            typeLabel.frame = CGRectMake(padding, (frame.height - 25)/2, 40, 25)
            priceLabel.frame = CGRectMake(frame.width - 100, padding, 100, frame.height - 2 * padding)
            nameLabel.frame = CGRectMake(CGRectGetMaxX(typeLabel.frame) + 10, 0, frame.width - priceLabel.frame.width - (CGRectGetMaxX(typeLabel.frame) + 10), frame.height)
        }
    }
*/
/********************************************
VIEW CONTROLLER
********************************************/

class ContentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    /*
    var contentLabel: UILabel!{
        didSet {
            contentLabel.textColor = .black
            contentLabel.textAlignment = .center
            contentLabel.font = UIFont.boldSystemFont(ofSize: 25)
            contentLabel.text = content
            view.addSubview(contentLabel)
     
            contentLabel.translatesAutoresizingMaskIntoConstraints = false
     
            // constaints of text/label
            NSLayoutConstraint.activate([
                contentLabel.topAnchor.constraint(equalTo: self.view.topAnchor),
                contentLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor),
                contentLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                contentLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
                ])
        }
    }
    */
    
    var content: String = ""
    let myArray = ["First","Second","Third"]
    var myTableView: UITableView!
    // var stocks: [Stock] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // Set Up TableView
        // myTableView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
 
    
        if content == "Posts" {
            
            print(content)
            //contentLabel = UILabel(frame: CGRect(x: 0, y: view.center.y - 50, width: view.frame.width, height: 50))
        }
        
        else if content == "Roasts" {
            print(content)
            //contentLabel = UILabel(frame: CGRect(x: 0, y: view.center.y - 50, width: view.frame.width, height: 50))
        }
        
        else if content == "Other" {
            print(content)
            //contentLabel = UILabel(frame: CGRect(x: 0, y: view.center.y - 50, width: view.frame.width, height: 50))
        }
    
        else {
            print("ERROR: content does not exist in ContentViewController")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myArray[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! TableViewCell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as UITableViewCell
        cell.textLabel!.text = myArray[indexPath.row]
        return cell
  
    }

}
