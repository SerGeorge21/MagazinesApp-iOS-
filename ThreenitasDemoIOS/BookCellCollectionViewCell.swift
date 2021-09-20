//
//  BookCellCollectionViewCell.swift
//  ThreenitasDemoIOS
//
//  Created by George Servos  on 27/8/21.
//

import UIKit

class BookCellCollectionViewCell: UICollectionViewCell {
    
    var urlForDownload : String?
    var isDownloaded = false
    var pdfUrl : URL?
    
    var initialVC: BookCollectionViewController?
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var triangleView: TriangleView!
    @IBOutlet weak var checkView: UIImageView!
    
    
    @IBAction func downloadFile(_ sender: Any) {
        //print url
        if(isDownloaded){
            let pdfViewController = PDFViewController()
            pdfViewController.pdfURL = self.pdfUrl
            initialVC!.present(pdfViewController, animated: true, completion: nil)
        }else{
            isDownloaded = true
            print(urlForDownload)
            // Create destination URL
            guard let url = URL(string: urlForDownload!) else {return}
            let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
            let downloadTask = urlSession.downloadTask(with: url)
            downloadTask.resume()
            //this downloads the pdf and its gonna be somewhere in a folder in pc
            //but maybe actual contents are missing?
        }
        
        
    }
    
    func setup(image: UIImage, title: String, pdfUrl: String, vc: BookCollectionViewController){
        bookImage.image = image
        bookTitle.text = title
        urlForDownload = pdfUrl
        initialVC = vc
        setupProgressbar()
        //the downloaded view should be hiden in the beginning
        triangleView.isHidden = true
        checkView.isHidden = true
    }
    
    func setupProgressbar(){
        progressBar.isHidden = false // in the beginning before the download starts
        progressBar.progress = 0.0
    }
}

extension BookCellCollectionViewCell : URLSessionDownloadDelegate{
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        print("File Downloaded Location --- ", location)
        
        guard let url = downloadTask.originalRequest?.url else {return}
        let docPath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let destinationPath = docPath.appendingPathComponent(url.lastPathComponent)
        
        try? FileManager.default.removeItem(at: destinationPath)
        
        do{
            try FileManager.default.copyItem(at: location, to: destinationPath)
            self.pdfUrl = destinationPath
        }catch let error{
            print("Copy Error: \(error.localizedDescription)")
        }
        
        //After finishing downloading and writing to directory , change from progressbar to "downloaded" (with check imageview)
        DispatchQueue.main.async{ [weak self] in
            self?.progressBar.isHidden = true
            
            self?.triangleView.isHidden = false
            self?.checkView.isHidden = false
        }
        
        
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        //changing UI so we should do this on MAIN THREAD
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        
        DispatchQueue.main.async{ [weak self] in
            self?.progressBar.isHidden = false
            self?.progressBar.progress = progress
        }
        
        
    }
    
    
}
