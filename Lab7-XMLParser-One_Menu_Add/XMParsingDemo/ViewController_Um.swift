import UIKit

class ViewController_Um: UIViewController, XMLParserDelegate, UITableViewDataSource {

    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var title1 = NSMutableString()
    var date = NSMutableString()
    
    
    var imageurl = NSMutableString()
    
    @IBOutlet weak var tbData: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()
        // Do any additional setup after loading the view.
    }
    
    func beginParsing(){
        posts = []
        parser = XMLParser(contentsOf:(URL(string:"key"))!)!
        parser.delegate = self
        parser.parse()
        tbData!.reloadData()
    }
    func parser (_ parser: XMLParser, didStartElement elementName: String, namespaceURI : String?, qualifiedName qName : String?, attributes attributeDict: [String : String]){
        element = elementName as NSString
        if (elementName as NSString).isEqual(to: "row"){
            elements = NSMutableDictionary()
            elements = [:]
            title1 = NSMutableString()
            title1 = ""
            date = NSMutableString()
            date = ""
            
            imageurl = NSMutableString()
            imageurl = ""
        }
    }
    func parser(_ parser: XMLParser, foundCharacters string: String){
        if element.isEqual(to: "GET_NAME"){
            title1.append(string)
        }
        else if element.isEqual(to: "GET_POSITION"){
            date.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName : String, namespaceURI: String?, qualifiedName qName : String?){
        if (elementName as NSString).isEqual(to: "row"){
            if !title1.isEqual(nil){
                elements.setObject(title1, forKey: "title" as NSCopying)
            }
            if !date.isEqual(nil){
                elements.setObject(date, forKey: "date" as NSCopying)
            }
            posts.add(elements)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int{
        return posts.count
    }
    func tableView(_ tableView : UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "title") as! NSString as String
        cell.detailTextLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "date") as! NSString as String
    
        return cell
    }
}

