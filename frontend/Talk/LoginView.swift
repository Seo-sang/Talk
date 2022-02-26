//
//  LoginView.swift
//  Talk
//
//  Created by 서상현 on 2022/02/26.
//

import UIKit

class LoginView : UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var userModel = UserModel()
    
    func designTextField(_ textField: UITextField) {
        textField.layer.cornerRadius = 3
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1/UIScreen.main.scale
    }
    
    /*viewDidLoad*/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designTextField(emailTextField)
        designTextField(passwordTextField)
        
        //키보드 내리기
        emailTextField.addTarget(self, action:  #selector(didEndonExit), for: UIControl.Event.editingDidEndOnExit)
        passwordTextField.addTarget(self, action:  #selector(didEndonExit), for: UIControl.Event.editingDidEndOnExit)
        //loginButton.addTarget(self, action:  #selector(didEndonExit), for: UIControl.Event.editingDidEndOnExit)
    }
    
    //사용자 목록에 있는지 확인
    func loginCheck(id : String, pwd : String) -> Bool {
        for user in userModel.users {
            if user.email == id && user.password == pwd {
                return true
            }
        }
        return false
    }
    
    //빈 정보 흔드는 애니메이션
    func shakeTextField(textField: UITextField) -> Void {
        UIView.animate(withDuration: 0.2, animations: {
            textField.frame.origin.x -= 10
        }, completion: { _ in
            UIView.animate(withDuration: 0.2,  animations: {
                textField.frame.origin.x += 20
            }, completion: { _ in
                UIView.animate(withDuration: 0.2, animations: {
                    textField.frame.origin.x -= 10
                })
            })
        })
    }
    
    //로그인 버튼 눌렀을 때
    @IBAction func didTapLoginButton(_ sender: Any) {
        print("버튼 누름")
        guard let email = emailTextField.text, !email.isEmpty else { return }
        guard let password = passwordTextField.text, !password.isEmpty else { return }
        
        if userModel.isValidEmail(id: email) {
            if let removable = self.view.viewWithTag(100) {
                removable.removeFromSuperview()
            }
        }
        else {
            shakeTextField(textField: emailTextField)
            let emailLabel = UILabel(frame: CGRect(x: 60, y: 322.5, width: 294, height: 34))
            emailLabel.text = " 이메일 형식을 확인하세요."
            emailLabel.textColor = UIColor.red
            emailLabel.tag = 100
            
            self.view.addSubview(emailLabel)
        }
        
        if userModel.isValidPassword(pwd: password) {
            if let removable = self.view.viewWithTag(101) {
                removable.removeFromSuperview()
            }
        }
        else {
            shakeTextField(textField: passwordTextField)
            let passwordLable = UILabel(frame: CGRect(x: 60, y: 386.5, width: 294, height: 34))
            passwordLable.text = " 비밀번호 형식을 확인하세요."
            passwordLable.textColor = UIColor.red
            passwordLable.tag = 101
            
            self.view.addSubview(passwordLable)
        }
        
        if userModel.isValidEmail(id: email) && userModel.isValidPassword(pwd: password) {
            let loginSuccess: Bool = loginCheck(id: email, pwd: password)
            if let removable = self.view.viewWithTag(102) {
                removable.removeFromSuperview()
            }
            //self.performSegue(withIdentifier: "ViewController", sender: self)
            let vcName = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")
            vcName?.modalPresentationStyle = .fullScreen
            vcName?.modalTransitionStyle = .crossDissolve
            self.present(vcName!, animated: true, completion: nil)
        }
        else {
            print(" 로그인 실패")
            shakeTextField(textField: emailTextField)
            shakeTextField(textField: passwordTextField)
            let loginFailLabel = UILabel(frame: CGRect(x: 60, y: 421, width: 294, height: 30))
            loginFailLabel.text = " 아이디나 비밀번호가 다릅니다."
            loginFailLabel.textColor = UIColor.red
            loginFailLabel.tag = 102
            
            self.view.addSubview(loginFailLabel)
        }
        
    }
    //다음 누르면 입력창 넘어감, 완료 누르면 키보드 내려는 기능
    @objc func didEndonExit(_ sender: UITextField) {
        if emailTextField.isFirstResponder {
            passwordTextField.becomeFirstResponder()
        }
        else if passwordTextField.isFirstResponder {
            loginButton.becomeFirstResponder()
        }
    }
}
