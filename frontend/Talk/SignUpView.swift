//
//  SignUpView.swift
//  Talk
//
//  Created by 서상현 on 2022/02/28.
//

import UIKit

class SignUpView : UIViewController {
    
    @IBOutlet weak var IdTextField: UITextField!
    @IBOutlet weak var PwTextField: UITextField!
    @IBOutlet weak var NicknameTextField: UITextField!
    @IBOutlet weak var StatusmsgTextField: UITextField!
    @IBOutlet weak var SignUpButton: UIButton!
    
    var userModel = UserModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    func idDuplicationCheck(id : String) -> Bool {
        for user in userModel.users {
            if user.email == id {
                return true
            }
        }
        return false
    }
    
    func nickDuplicationCheck(nickname : String) -> Bool {
        for user in userModel.users {
            if user.nickname == nickname {
                return true
            }
        }
        return false
    }

    @IBAction func didTapSignUpButton(_ sender: Any) {
        guard let id = IdTextField.text, !id.isEmpty else { return }
        guard let pw = PwTextField.text, !pw.isEmpty else { return }
        guard let nickname = NicknameTextField.text, !nickname.isEmpty else { return }
        guard let statusmsg = StatusmsgTextField.text, !statusmsg.isEmpty else { return }
        
        
    }
}
