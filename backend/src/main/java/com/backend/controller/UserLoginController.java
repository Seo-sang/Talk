package com.backend.controller;

import com.backend.DTO.LoginDTO;
import com.backend.DTO.UserDTO;
import com.backend.service.UserService;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserLoginController {

    private final UserService userService;

    @Inject
    public UserLoginController(UserService userService) {
        System.out.println("UserLoginController worked");
        this.userService = userService;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginGET(@ModelAttribute("loginDTO") LoginDTO loginDTO) {
        return "/user/login";
    }

    @RequestMapping(value="/loginPost", method = RequestMethod.POST)
    public void loginPOST(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception {
        System.out.println("loginPOST worked");
        UserDTO userDTO = userService.login(loginDTO);
        if(userDTO == null || !BCrypt.checkpw(loginDTO.getPasswd(), userDTO.getPasswd())) {
            return;
        }
        System.out.println("login success");
        model.addAttribute("user", userDTO);
    }
}
