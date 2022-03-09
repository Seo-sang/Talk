package com.backend.controller;

import com.backend.DTO.UserDTO;
import com.backend.service.UserService;
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
        System.out.println("controller worked!");
        this.userService = userService;
    }

    @RequestMapping(value="/register", method = RequestMethod.GET)
    public String registerGET() throws Exception {
        return "/user/register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerPOST(UserDTO userDTO, RedirectAttributes redirectAttributes) throws Exception {
        String hashedPw = BCrypt.hashpw(userDTO.getPasswd(), BCrypt.gensalt());
        userDTO.setPasswd(hashedPw);
        userService.register(userDTO);
        redirectAttributes.addFlashAttribute("msg", "REGISTERED");

        return "redirect:/user/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() throws Exception {
        return "/user/login";
    }
}
