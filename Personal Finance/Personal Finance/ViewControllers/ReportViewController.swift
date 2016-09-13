//
//  ReportViewController.swift
//  Personal Finance
//
//  Created by Admin on ۱۳۹۵/۶/۲۱ ه‍.ش..
//  Copyright © ۱۳۹۵ ه‍.ش. Mohammad Lashgarbolouk. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let languageData = ProgrammingLanguageDataStore.generate()



    @IBOutlet weak var chart: ShinobiChart!
    

    @IBOutlet weak var tblExpenceCategoryAmount: UITableView!
    @IBOutlet weak var dpvDate: UIDatePicker!
    @IBAction func btnEstimateAction(sender: AnyObject) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        chart.datasource = self
        chart.licenseKey = "mlIqU2GfM6nHleNMjAxNjEwMTJtbGFzaGdhcmJvbG9rQGhvdG1haWwuY29tFDLY2kDCt1YixnHGhQVgSkyCi9HnxGsUuOvSy45kLMYrpBSH6xIwarde/pUkRqmdAiOF7ynMWkc6ZzcNOXa7NO2nnT744ApR95zrSmavshKKG00eFPKrNVaxGEmiuxmy/fI6I11HsihEXZnapjEiMvJB0Vrc=AXR/y+mxbZFM+Bz4HYAHkrZ/ekxdI/4Aa6DClSrE4o73czce7pcia/eHXffSfX9gssIRwBWEPX9e+kKts4mY6zZWsReM+aaVF0BL6G9Vj2249wYEThll6JQdqaKda41AwAbZXwcssavcgnaHc3rxWNBjJDOk6Cd78fr/LwdW8q7gmlj4risUXPJV0h7d21jO1gzaaFCPlp5G8l05UUe2qe7rKbarpjoddMoXrpErC9j8Lm5Oj7XKbmciqAKap+71+9DGNE2sBC+sY4V/arvEthfhk52vzLe3kmSOsvg5q+DQG/W9WbgZTmlMdWHY2B2nbgm3yZB7jFCiXH/KfzyE1A==PFJTQUtleVZhbHVlPjxNb2R1bHVzPnh6YlRrc2dYWWJvQUh5VGR6dkNzQXUrUVAxQnM5b2VrZUxxZVdacnRFbUx3OHZlWStBK3pteXg4NGpJbFkzT2hGdlNYbHZDSjlKVGZQTTF4S2ZweWZBVXBGeXgxRnVBMThOcDNETUxXR1JJbTJ6WXA3a1YyMEdYZGU3RnJyTHZjdGhIbW1BZ21PTTdwMFBsNWlSKzNVMDg5M1N4b2hCZlJ5RHdEeE9vdDNlMD08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjwvUlNBS2V5VmFsdWU+"
        chart.delegate = self


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ECACell") as! ExpenseCategoryAmountCell

        
        cell.lblCategoryName.text = "Category"
        
        cell.lblCategoryAmount.text = "1256 $"
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Expences"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}





struct ProgrammingLanguage {
    let name: String
    let popularity: Double
}

class ProgrammingLanguageDataStore {
    class func generate() -> [ProgrammingLanguage]
    {
        return [ProgrammingLanguage(name: "C#",popularity: 50) ,
                ProgrammingLanguage(name: "C++",popularity: 20) ,
                ProgrammingLanguage(name: "Java",popularity: 30) ]
    }
}

extension ReportViewController : SChartDatasource
{
    func numberOfSeriesInSChart(chart: ShinobiChart) -> Int {
        return 1

    }


    func sChart(chart: ShinobiChart, dataPointAtIndex dataIndex: Int, forSeriesAtIndex seriesIndex: Int) -> SChartData {
        let language = languageData[dataIndex]

        let dataPoint = SChartRadialDataPoint()

        dataPoint.name = language.name
        dataPoint.value = language.popularity

        return dataPoint
    }


    func sChart(chart: ShinobiChart, numberOfDataPointsForSeriesAtIndex seriesIndex: Int) -> Int {
        return languageData.count
    }

    func sChart(chart: ShinobiChart, seriesAtIndex index: Int) -> SChartSeries {

        let series = SChartPieSeries()

        series.style().labelFont = UIFont.systemFontOfSize(15)
        series.selectedStyle().protrusion = 30

        series.gesturePanningEnabled = true

        return series


    }
}

extension ReportViewController : SChartDelegate
{
    func sChart(chart: ShinobiChart, alterLabel label: UILabel, forDatapoint datapoint: SChartRadialDataPoint, atSliceIndex index: Int, inRadialSeries series: SChartRadialSeries) {
        label.text = datapoint.name! + " (" + String(datapoint.value!) + "%)"
    }
}





