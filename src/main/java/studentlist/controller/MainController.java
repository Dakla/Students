package studentlist.controller;

import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import studentlist.domain.Student;
import studentlist.repos.StudentRepo;
import studentlist.service.StudentService;

@Controller
public class MainController {
    @Autowired
    private StudentRepo studentRepo;
    @Autowired
    private StudentService studentService;

    @GetMapping("/")
    public String main(
            @RequestParam(required = false, defaultValue = "") String filter,
            @RequestParam(required = false, defaultValue = "points,asc") String sort,
            Model model,
            @PageableDefault(sort = { "points" }, direction = Sort.Direction.ASC) Pageable pageable
    ){
        Page<Student> students = studentRepo.findAllByOrderByPointsDesc(pageable);

        if(!sort.equals("") && !sort.isEmpty()) {
            students = studentRepo.findAll(pageable);
        }
            String[] type = sort.toString().split(",");

        if(!filter.equals("")|| !filter.isEmpty()){
            students = studentRepo.findByNameContainingOrSurnameContainingOrGNumberContainingOrPointsContaining(filter, filter, filter, filter, pageable);
        }
        model.addAttribute("page", students);
        model.addAttribute("url", "/");
        model.addAttribute("students", students);
        model.addAttribute("filter", filter);
        model.addAttribute("sort", type[0]);
        model.addAttribute("type", type[1]);
        return "index";
    }
    
    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }

    @PostMapping("/registration")
    public String addStudent(@Valid Student student, BindingResult bindingResult, Model model){
        
        if(bindingResult.hasErrors()){
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            
            model.mergeAttributes(errors);
            
            return "registration";
        }

        int i = Integer.parseInt(student.getPoints());
        
        if(!studentService.addUser(student)){
            model.addAttribute("usernameError", "Почта занята!");
            return "registration";
        }
        
        if(i < 0){
            model.addAttribute("pointsError", "Количество баллов не может быть отрицательным");
            return "registration";
        }
        
        
        return "redirect:/";
    }
    
}
