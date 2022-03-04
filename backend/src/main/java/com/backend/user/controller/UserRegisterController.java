package com.backend.user.controller;

import com.backend.dto.UserDTO;
import com.backend.user.service.UserService;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;

@Controller
@RequestMapping("/user")
public class UserRegisterController {
    private final UserService userService;

    @Inject
    public UserRegisterController(UserService userService) {
        System.out.println("controller worked");
        this.userService = userService;
    }

    //회원가입 페이지
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerGET() throws Exception {
        return "/user/register";
    }

    //회원가입 처리
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerPOST(UserDTO userDTO, RedirectAttributes redirectAttributes) throws Exception {
        String hashedPw = BCrypt.hashpw(userDTO.getPassword(), BCrypt.gensalt());
        userDTO.setPassword(hashedPw);
        userService.register(userDTO);
        redirectAttributes.addFlashAttribute("msg", "REGISTERED");

        return "redirect:/user/login";
    }
}
