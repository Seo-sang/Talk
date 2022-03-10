package com.backend.controller;

import com.backend.DTO.UserDTO;
import com.backend.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;

@Slf4j // 로깅(logging) 기능 추가! Lombok 플러그인 설치 필요!
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
        System.out.println("registerPOST worked");
        log.info(userDTO.toString());
        String hashedPw = BCrypt.hashpw(userDTO.getPasswd(), BCrypt.gensalt());
        userDTO.setPasswd(hashedPw);
        System.out.println("check1");
        userService.register(userDTO);
        System.out.println("check2");
        redirectAttributes.addFlashAttribute("msg", "REGISTERED");

        return "redirect:/user/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() throws Exception {
        System.out.println("login worked");
        return "/user/login";
    }
}
