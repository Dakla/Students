package studentlist.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import studentlist.domain.Student;
import studentlist.service.StudentService;

@Controller
public class EditController {

    @Autowired
    private StudentService studentService;



    @GetMapping("edit")
    public String edit(
        Model model,
        @AuthenticationPrincipal Student student,
        RedirectAttributes redir
    ){
        model.addAttribute("name", student.getName());
        model.addAttribute("surname", student.getSurname());
        model.addAttribute("gNumber", student.getgNumber());
        model.addAttribute("gender", student.getGender());
        model.addAttribute("email", student.getUsername());
        model.addAttribute("points", student.getPoints());
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");  
        String strDate = dateFormat.format(student.getBirthDay());
        model.addAttribute("birthDay", strDate);
        model.addAttribute("place", student.getPlace());
        redir.getFlashAttributes();
        return "edit";
    }
    
    @PostMapping("edit")
    public String editUser(
        @AuthenticationPrincipal Student student,
        @RequestParam String name,
        @RequestParam String surname,
        @RequestParam String gNumber,
        @RequestParam String gender,
        @RequestParam String username,
        @RequestParam String points,
        @RequestParam String birthDay,
        @RequestParam String place,
        @RequestParam String password,
        Model model,
        RedirectAttributes redir
    ) throws ParseException{
        studentService.editProfile(student, name, surname, gNumber, gender, username, points, birthDay, place, password);
        redir.addFlashAttribute("message", "Данные успешно обновлены");
        return "redirect:/edit";
    }
    
}