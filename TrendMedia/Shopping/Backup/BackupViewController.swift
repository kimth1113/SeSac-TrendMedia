//
//  BackupViewController.swift
//  TrendMedia
//
//  Created by 김태현 on 2022/08/26.
//

import UIKit
import Zip

class BackupViewController: UIViewController {

    let mainView = BackupView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        mainView.backupButton.addTarget(self, action: #selector(backupButtonClicked), for: .touchUpInside)
        
        mainView.restoreButton.addTarget(self, action: #selector(restoreButtonClicked), for: .touchUpInside)
    }
    
    @objc
    func backupButtonClicked() {
        
        var urlPaths = [URL]()
        
        guard let path = documentDirectoryPath() else {
            
            let alert = UIAlertController(title: nil, message: "도큐먼트 위치 오류", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true)
            
            return
        }
        
        let realmFile = path.appendingPathComponent("default.realm")
        
        guard FileManager.default.fileExists(atPath: realmFile.path) else {
            
            let alert = UIAlertController(title: nil, message: "백업 파일 없음", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true)
            
            return
        }
        
        urlPaths.append(URL(string: realmFile.path)!)
        
        do {
            let zipFilePath = try Zip.quickZipFiles(urlPaths, fileName: "ShoppingList_1")
            
            showActivityVC()
        } catch {
            print()
        }
        
        
    }
    
    @objc
    func restoreButtonClicked() {
        
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.archive], asCopy: true)
        documentPicker.delegate = self
        
        documentPicker.allowsMultipleSelection = false
        
        self.present(documentPicker, animated: true)
    }

    func showActivityVC() {
        
        guard let path = documentDirectoryPath() else {
            
            let alert = UIAlertController(title: nil, message: "도큐먼트 위치 오류", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true)
            
            return
        }
        
        let backupFileURL = path.appendingPathComponent("ShoppingList_1.zip")
        
        let vc = UIActivityViewController(activityItems: [backupFileURL], applicationActivities: [])
        
        self.present(vc, animated: true)
    }
    
}

extension BackupViewController: UIDocumentPickerDelegate {
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print(#function)
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        
        guard let path = documentDirectoryPath() else {
            
            let alert = UIAlertController(title: nil, message: "도큐먼트 위치 오류", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true)
            return
        }
        
        guard let selectedPath = urls.first else {
            
            let alert = UIAlertController(title: nil, message: "백업 파일 없음", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true)
            return
        }
        
        let sandboxFileURL = path.appendingPathComponent(selectedPath.lastPathComponent)
        
        if FileManager.default.fileExists(atPath: sandboxFileURL.path) {
            
            let fileURL = path.appendingPathComponent("ShoppingList_1.zip")
            
            do {
                try Zip.unzipFile(fileURL, destination: path, overwrite: true, password: nil, progress: { (progress) -> () in
                        print(progress)
                }, fileOutputHandler: { unzippedFile in
                    
                    let alert = UIAlertController(title: nil, message: "복구 완료", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                    alert.addAction(ok)
                    self.present(alert, animated: true)
                }) // Unzip
            } catch {
                let alert = UIAlertController(title: nil, message: "복구 실패1", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true)
            }
        } else {
            do {
                
                try FileManager.default.copyItem(at: selectedPath, to: sandboxFileURL)
                
                let fileURL = path.appendingPathComponent("ShoppingList_1.zip")
                
                try Zip.unzipFile(fileURL, destination: path, overwrite: true, password: nil, progress: { (progress) -> () in
                        print(progress)
                }, fileOutputHandler: { unzippedFile in
                    
                    let alert = UIAlertController(title: nil, message: "복구 완료", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                    alert.addAction(ok)
                    self.present(alert, animated: true)
                }) // Unzip
            } catch {
                let alert = UIAlertController(title: nil, message: "복구 실패2", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true)
            }
            
        }
    }
}
