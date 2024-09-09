//
//  MemoViewController.swift
//  MemoPad
//
//  Created by 久田　悠平 on 2024/08/29.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var titles: [String] = []
    var contents: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        saveData.register(defaults: ["titles":[],"contents":[]])
        titles = saveData.object(forKey: "titles")as![String]
        contents = saveData.object(forKey: "contents")as![String]
//        titleTextField.text = saveData.object(forKey: "title") as? String
//        contentTextView.text = saveData.object(forKey: "content") as? String
        titleTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func saveMemo(_ sender: Any){
        let title = titleTextField.text!
        let content = contentTextView.text!
        
        titles.append(title)
        contents.append(content)
        
        saveData.set(title, forKey: "titles")
        saveData.set(content, forKey: "content")
        
        print(titles)
        print(contents)
        
        saveData.set(titleTextField.text, forKey: "title")
        saveData.set(contentTextView.text, forKey: "content")
        
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました．", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(title: "OK",
                          style: .default,
                          handler: {action  in
                              self.navigationController?.popViewController(animated: true)
                                  //print("OKボタンが押されました．")
            })
        )
        present(alert, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
