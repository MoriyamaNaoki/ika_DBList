import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var ikaTable: UITableView!
    
    var ikaDBList = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //SQL文(全レコード取得)
        let sql = "SELECT * FROM ika_Data"
        cellView(sql: sql)
    }
    
    //dbのパスを取得
    func setPath() -> (String) {
        let path = "/Users/user/Desktop/ika_DBList/ika_DBList/ika_Data.db"
        return path
    }

    //ボタン：ガチホコ押下時実行
    @IBAction func ruleHokoButton(_ sender: Any) {
        //SQL文(ルール：ガチホコのみ取得)
        let sql = "SELECT * FROM ika_Data WHERE RULE = 'ガチホコバトル'"
        cellView(sql: sql)
    }
    
    //ボタン：全ルール押下時実行
    @IBAction func ruleAllButton(_ sender: Any) {
        //SQL文(ルール：全ルール取得)
        let sql = "SELECT * FROM ika_Data"
        cellView(sql: sql)
    }
    
    //ボタン：ガチエリア押下時実行
    @IBAction func ruleAreaButton(_ sender: Any) {
        //SQL文(ルール：ガチエリアのみ取得)
        let sql = "SELECT * FROM ika_Data WHERE RULE = 'ガチエリア'"
        cellView(sql: sql)
    }
    
    //ボタン：ガチヤグラ押下時実行
    @IBAction func ruleYaguraButton(_ sender: Any) {
        //SQL文(ルール：ガチヤグラのみ取得)
        let sql = "SELECT * FROM ika_Data WHERE RULE = 'ガチヤグラ'"
        cellView(sql: sql)
    }
    
    //ボタン：ガチアサリ押下時実行
    @IBAction func ruleAsariButton(_ sender: Any) {
        //SQL文(ルール：ガチアサリのみ取得)
        let sql = "SELECT * FROM ika_Data WHERE RULE = 'ガチアサリ'"
        cellView(sql: sql)
    }
    
    //db操作
    func cellView(sql: String) {
        //ikaDBListの初期化
        ikaDBList = [[String]]()
        //dbのパス
        let db = FMDatabase(path: setPath())
        //db接続
        db.open()
        //select実行
        let ika_list = db.executeQuery(sql, withArgumentsIn: [])
        //レコードが無くなるまで実行
        while ika_list!.next() {
            let dateq = ika_list!.string(forColumn: "DATE")
            let date = dateq!.components(separatedBy: " ")
            let result = ika_list!.string(forColumn: "RESULT")
            let rule = ika_list!.string(forColumn: "RULE")
            let stage = ika_list!.string(forColumn: "STAGE")
            let weapon = ika_list!.string(forColumn: "WEAPON")
            let kill = ika_list!.string(forColumn: "KILL")
            let deth = ika_list!.string(forColumn: "DETH")
            let special = ika_list!.string(forColumn: "SPECIAL")
            ikaDBList.append([date[0], result!, rule!, stage!, weapon!, kill!, deth!, special!])
        }
        //db切断
        db.close()
        //ikaTableを再読み込み
        ikaTable.reloadData()
    }

    //セル数を取得
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ikaDBList.count + 1
    }
    
    //セルに配列を格納
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ikaTableCell") as! ikaTableViewCell
        
        if indexPath.row != 0 {
            //ikaDBListを出力
            cell.dateLabel.text = ikaDBList[indexPath.row - 1][0]
            cell.resultLanel.text = ikaDBList[indexPath.row - 1][1]
            cell.ruleLabel.text = ikaDBList[indexPath.row - 1][2]
            cell.stageLabel.text = ikaDBList[indexPath.row - 1][3]
            cell.weaponLabel.text = ikaDBList[indexPath.row - 1][4]
            cell.killLabel.text = ikaDBList[indexPath.row - 1][5]
            cell.dethLabel.text = ikaDBList[indexPath.row - 1][6]
            cell.specialLabel.text = ikaDBList[indexPath.row - 1][7]
        } else {
            //項目名
            cell.dateLabel.text = "日時"
            cell.resultLanel.text = "結果"
            cell.ruleLabel.text = "ルール"
            cell.stageLabel.text = "ステージ"
            cell.weaponLabel.text = "ブキ"
            cell.killLabel.text = "K"
            cell.dethLabel.text = "D"
            cell.specialLabel.text = "SP"
        }
        return cell
    }
}

