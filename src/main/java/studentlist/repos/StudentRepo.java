package studentlist.repos;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;

import studentlist.domain.Student;

public interface StudentRepo extends CrudRepository<Student, Long> {

    Page<Student> findAllByOrderByPointsDesc(Pageable pageable);
    Page<Student> findByNameContainingOrSurnameContainingOrGNumberContainingOrPointsContaining(String name, String surname, String gNumber, String points, Pageable pageable);
    Page<Student> findAll(Pageable pageable);
}