package studentlist.domain;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Email;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

 
@Entity       
public class Student implements UserDetails{
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	@Pattern(regexp = "^[А-Яа-яЁё]+$", message = "Пожалуйста, введите корректное имя")
	@Length(max = 255, message = "Имя слишком длинное")
    private String name;
	@Pattern(regexp = "^[А-Яа-яЁё]+$", message = "Пожалуйста, введите корректную фамилию")
	private String surname;
	@Pattern(regexp = "^[А-Яа-яЁёA-Za-z0-9]{2,5}$", message = "Введите корректный номер группы")
	private String gNumber;
	@Max(value = 300, message = "Число баллов должно быть в диапазоне от 0 до 300")
    private String points;
	@NotBlank(message = "Пожалуйста, выберите пол")
	private String gender;
	@Email(message = "Введите корректную почту")
	@NotBlank(message = "Пожалуйста, введите почту")
	private String username;
	@Past(message = "Пожалуйста, введите корректную дату рождения")
	@NotNull(message = "Пожалуйста, введите дату рождения")
	@DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date birthDay;
	@NotBlank(message = "Пожалуйста, выберите место проживания")
    private String place;
	@NotBlank(message = "Пожалуйста, введите пароль")
    private String password;

    public Student(){

    }

    public Student(String name, String surname, String gNumber, String points, String gender, String username, Date birthDay, String place, String password){
        this.name = name;
        this.surname = surname;
        this.gNumber = gNumber;
        this.points = points;
        this.gender = gender;
        this.username = username;
        this.birthDay = birthDay;
        this.place = place;
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public Date getBirthDay(){
        return birthDay;
    }

    public void setBirthDay(Date birth){
        this.birthDay = birth;
    }

	public void setUsername(String username) {
		this.username = username;
	}

	public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPoints() {
		return points;
	}

	public void setPoints(String points) {
		String a_char = Character.toString(points.charAt(0));
		if(a_char.equals("0")){
			points = points.substring(1);
		}
		this.points = points;
	}

	public String getgNumber() {
        return gNumber;
    }

    public void setgNumber(String gNumber) {
        this.gNumber = gNumber;
    }

    public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public void setName(String name) {
		this.name = name;
    }

    public void setPassword(String password) {
        this.password = password;
    }

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return null;
	}

	@Override
	public String getPassword() {
		return password;
	}

	@Override
	public String getUsername() {
		return username;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
    
    
}