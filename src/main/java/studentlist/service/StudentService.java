package studentlist.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import studentlist.domain.Student;
import studentlist.repos.RegStudentRepo;

@Service
public class StudentService implements UserDetailsService {
    @Autowired
    private RegStudentRepo regStudentRepo;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Student student = regStudentRepo.findByUsername(username);

        if(student == null){
            throw new UsernameNotFoundException("Учетная запись не найдена");
        }
        return student;
    }

    public boolean addUser(Student student){
        Student studentFromDb = regStudentRepo.findByUsername(student.getUsername());

        if(studentFromDb != null ){
            return false;
        }

        student.setPassword(passwordEncoder.encode(student.getPassword()));
        
        regStudentRepo.save(student);
        
        return true;
    }
    
    public List<Student> findAll() {
        return regStudentRepo.findAll();
    }

	public void editProfile(Student student, String name, String surname, String gNumber, String gender,
			String email, String points, String birthDay, String place, String password) throws ParseException {
                String userName = student.getName();
                String userSurname = student.getSurname();
                String userGNumber = student.getgNumber();
                String userGender = student.getGender();
                String userEmail = student.getUsername();
                String userPoints = student.getPoints();
                Date userBbirthDay = student.getBirthDay();
                String userPlace = student.getPlace();

                // //password = getPasswordEncoder.encode(password);
                if(!birthDay.equals("")) {
                    DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                    String strDate = dateFormat.format(userBbirthDay);
                    boolean isBirthDayChanged = ((birthDay.equals("")) && !birthDay.equals(strDate));
                    if(isBirthDayChanged){
                        Date birthDayD = new SimpleDateFormat("dd/MM/yyyy").parse(birthDay);
                        student.setBirthDay(birthDayD);
                    }
                }
                else {
                    boolean isBirthDayChanged = false;
                }

                boolean isNameChanged = isChanged(name, userName);
                boolean isSurnameChanged = isChanged(surname, userSurname);
                boolean isGNumverChanged = isChanged(gNumber, userGNumber);
                boolean isGenderChanged = isChanged(gender, userGender);
                boolean isEmailChanged = isChanged(email, userEmail);
                boolean isPointsChanged = isChanged(points, userPoints);
                boolean isPlaceChanged = isChanged(place, userPlace);
                boolean isPasswordChanged = (password != null && !password.equals(""));

                if(isNameChanged){
                    student.setName(name);
                }
                if(isSurnameChanged){
                    student.setSurname(surname);
                }
                if(isGNumverChanged){
                    student.setgNumber(gNumber);
                }
                if(isGenderChanged){
                    student.setGender(gender);
                }
                if(isEmailChanged){
                    student.setUsername(email);
                }
                if(isPointsChanged){
                    student.setPoints(points);
                }
                if(isPlaceChanged){
                    student.setPlace(place);
                }
                if(isPasswordChanged){
                    student.setPassword(passwordEncoder.encode(password));
                }

                regStudentRepo.save(student);
    }
    
    public boolean isChanged(String editParam, String oldParam){
        return ((!editParam.equals("")) && (!editParam.equals(oldParam)));
    }
    
    // public void editPrifile(Student student, String password, String email) {
    //     String userEmail = student.getUsername();

    //     boolean isEmailChanged = ((email != null && !email.equals(userEmail)) || 
    //     (userEmail != null && !userEmail.equals(email)));

    //     if(isEmailChanged){
    //         user.setEmail(email);

    //         if(!StringUtils.isEmpty(email)){
    //             user.setActivationCode(UUID.randomUUID().toString());
    //         }

    //     }

    //     if(!StringUtils.isEmpty(password)){
    //         user.setPassword(passwordEncoder.encode(user.getPassword()));
    //     }

    //     userRepo.save(user);

    //     if(isEmailChanged){
    //         sendMessage(user);
    //     }
    // }
}
