
import org.springframework.context.support.GenericXmlApplicationContext;

import com.dto.Student;

public class StudentTest {

	public static void main(String[] args) {

		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("stu.xml");

		Student s = ctx.getBean("stu", Student.class);
		System.out.println(s.getName());
		ctx.close();
	}

}
