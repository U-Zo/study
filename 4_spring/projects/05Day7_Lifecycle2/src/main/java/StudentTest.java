
import org.springframework.context.support.GenericXmlApplicationContext;

import com.dto.Student;

public class StudentTest {

	public static void main(String[] args) {

		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext("stu.xml");

		ctx.close();
	}

}
