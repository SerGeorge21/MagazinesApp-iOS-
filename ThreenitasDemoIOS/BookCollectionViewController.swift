//
//  BookCollectionViewController.swift
//  ThreenitasDemoIOS
//
//  Created by George Servos  on 4/8/21.
//

import UIKit
import KeychainAccess

class BookCollectionViewController: UIViewController {
    
    private let reuseIdentifier = "bookCell"
    
    @IBOutlet var booksCollectionView: UICollectionView!
    
    private let sectionInsets = UIEdgeInsets(
      top: 0.0,
      left: 30.0,
      bottom: 50.0,
      right: 30.0)

        //@IBOutlet weak var receivedText: UILabel!
    var myText: String?
    var bookList : [Book]?
    var bookDates = [Int]()
    
    var bookListforDates : [[Book]]?
        
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            //receivedText.text = "Hi there friends"
        booksCollectionView.dataSource = self
        booksCollectionView.delegate = self //is this needed??
        
        //network call to fetch books
        NetworkingUtils().fetchBookData(){ [weak self] books in
            guard let self = self else {return}
            DispatchQueue.main.async{
                //make booklist and reload data to collectionView
                self.bookList = books
                
                
                
                //take the different dates and put them in an array
                for book in self.bookList! {
                    self.addToListOfDates(date: book.date_released)
                }
                
                //initialize bookListForDates
                self.bookListforDates = [[Book]](repeating: [Book](), count: self.bookDates.count)
                
                //sort that array
                self.bookDates.sorted(){$0 > $1}
                //print(self.bookDates)
                
                //make array of arrays for books depening on their release_date
                //indexes should be on par with bookDates
                for var book in self.bookList! {
                    self.addToBookListDependingOnDate(book: book)
                }
                //print(self.bookListforDates)
                //reload sections
                self.booksCollectionView.reloadData()
                
            }
        }
        
    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        let keychain = Keychain(service: "threenitas.com")
        //receivedText.text = keychain["access_token"]
        self.booksCollectionView.reloadData()
        
        //title = "Magazines"
        //self.navigationController?.navigationBar.topItem?.title = "Magazines"
        self.tabBarController?.navigationItem.title = "Magazines"
        }
    
    func addToListOfDates(date: String){
        //add date in bookDates array if it does not exist
        let index = date.index(date.startIndex, offsetBy: 4)
        let substring = date.prefix(upTo: index)
        let dateToAdd = Int(substring) ?? 0
        if bookDates.isEmpty || !bookDates.contains(dateToAdd){
            bookDates.append(dateToAdd)
        }else{
            return
        }
    }
    
    func addToBookListDependingOnDate(book: Book){
        let index = book.date_released.index(book.date_released.startIndex, offsetBy: 4)
        let substring = book.date_released.prefix(upTo: index)
        let dateToFind = Int(substring) ?? 0
        let arrayIndex = bookDates.firstIndex(of: dateToFind)
        //print("index of \(dateToFind) is : \(arrayIndex)")
        bookListforDates?[arrayIndex!].append(book)
    }
        
    

}

extension BookCollectionViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //TODO: RETURN DATEARRAY.COUNT OR 1 IF DATEARRAY==NIL
        if !bookDates.isEmpty{
            return bookDates.count
        }else{
            return 1
        }
        
    }
    
    
    //We use the delegate to tell our collection view to use these functions
    //Delegate something that passes along instructions to something else
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return 1
        //how many items we wanna show per section
        if !(bookList == nil) {
            return bookListforDates?[section].count ?? 1
        }else{
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //which cell we wanna show for the index path
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BookCellCollectionViewCell
        cell.backgroundColor = .gray
        //what is dequeueReusableCell? ->
        //Dequeue = to remove from a line or sequence of items
        //dequeues cells out of the screen and reuses the type of cell we specified for the next cells. This is done for memory management
        if !(bookList==nil) {
            if let url = URL(string: self.bookListforDates![indexPath.section][indexPath.item].img_url){
                if let data = try? Data(contentsOf: url){
                    if let image = UIImage(data: data){
                        //TODO: assign image here
                        cell.setup(image: image,
                                   title: bookListforDates![indexPath.section][indexPath.item].title,
                                   pdfUrl: bookListforDates![indexPath.section][indexPath.item].pdf_url,
                                   vc: self)
                    }
                }
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
      }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let columns: CGFloat = 2
        let collectionViewWidth = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (columns-1)//for the space in the middle
        let adjustedWidth = collectionViewWidth - spaceBetweenCells
        
        let height: CGFloat = 170 + 20
        let width: CGFloat = 130
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        //THIS DOES NOT CHANGE ANYTHING - WHY?
        let spacing: CGFloat = 10
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        //if kind == UICollectionView.elementKindSectionHeader{
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionHeader", for: indexPath) as! HeaderCollectionReusableView
        //}
        if(!bookDates.isEmpty){
            header.setup(year: String(bookDates[indexPath.section]))
            return header
        }else{
            return header //but not setup - so no title
        }
        
        
    }
    
    
}
