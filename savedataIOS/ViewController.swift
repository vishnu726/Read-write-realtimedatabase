//
//  ViewController.swift
//  savedataIOS
//
//  Created by MacOS on 2018/10/23.
//  Copyright © 2018年 MacOS. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var job: UILabel!
   
    var users = [UserDTO]()
    
    
    @IBAction func save(_ sender: Any) {
        
        savedata()
        
        
    }
    
    @IBAction func read(_ sender: Any) {
        
        
        getdata()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func savedata(){
        
    //save single data
//        let a="hello world"
//        let b="123"
//        let c="aaa"
//
//        Database.database().reference().child("data").childByAutoId().setValue(a)
//        Database.database().reference().child("data").childByAutoId().setValue(b)
//        Database.database().reference().child("data").childByAutoId().setValue(c)
        
        
      //save multiple data
        let dic=["name":"a1","age":"18","job":"student"]
        let dic2=["name":"a2","age":"28","job":"manager"]
         let dic3=["name":"a3","age":"60","job":"none"]
        
          Database.database().reference().child("data").child("a1").setValue(dic)
          Database.database().reference().child("data").child("a2").setValue(dic2)
          Database.database().reference().child("data").child("a3").setValue(dic3)
        
    }
    
    
    
    func getdata(){
        
        //read single user's data
//           Database.database().reference().child("data").child("a1").observeSingleEvent(of: .value, with: {(snapshot)in
//
//                let user=UserDTO()
//
//            user.setValuesForKeys(snapshot.value as! [String:Any])
//
//            self.name.text="name is : "+user.name!
//            self.age.text="age is : "+user.age!
//            self.job.text="job is : "+user.job!
//
//
//
//           })
        
        
       
        //read various users' data
       Database.database().reference().child("data").observeSingleEvent(of: .value, with: {(snapshot)in
            
            self.users.removeAll()
            
            for item in snapshot.children{
                
                let child = item as! DataSnapshot
                
                let user=UserDTO()
                user.setValuesForKeys(child.value as! [String:Any])
                
                self.users.append(user)
                
                
            }
            
           
               var userInfo=UserDTO()
            
                        userInfo=self.users[2]
                        self.name.text="name is : "+userInfo.name!
                        self.age.text="age is : "+userInfo.age!
                        self.job.text="job is : "+userInfo.job!
            
            
            
        })
    
        
        
        
        
        
        
    
        
    }
    
    
    
    
    
    
    
    
}

