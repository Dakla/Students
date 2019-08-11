package studentlist.repos;

import org.springframework.data.jpa.repository.JpaRepository;

import studentlist.domain.Student;


public interface RegStudentRepo extends JpaRepository<Student, Long>{
    
    Student findByUsername(String username);
}