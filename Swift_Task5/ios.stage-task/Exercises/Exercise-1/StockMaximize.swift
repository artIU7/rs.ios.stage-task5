import Foundation

class StockMaximize {
    
    var res : Int = -1
    var buyCount : Int = 0
    var buySumma : Int = 0
    
    var saleCount : Int = 0
    var saleSumma : Int = 0
    
    func countProfit(prices: [Int]) -> Int {
     
     
        let check = prices.allSatisfy({ $0 == prices.first})//)({ $0 == prices.first })
        
        print(check)
        if prices == [] || prices.count == 1 || prices.allSatisfy({ $0 == prices.first}) {
            self.res = 0
        }
        for i in 0...prices.count - 1 {
            if i != prices.count - 1 {
            if prices[i] < prices[i+1] {
                buyCount += 1
                buySumma += prices[i]
            } else {
                saleCount += 1
                saleSumma += prices[i] * saleCount
                res += saleSumma - buySumma
            }
            } else {
                saleCount += 1
                saleSumma += prices[i] * saleCount
                res += saleSumma - buySumma
            }
        }
        return res
    }

}


