import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import junit.framework.TestCase;

public class PasswordHash extends TestCase {

	public void testMD5Hash(){
		String password = "secret";
		Md5PasswordEncoder passwordEncoder = new Md5PasswordEncoder();
		String hashedPassword = passwordEncoder.encodePassword(password, null);
		System.out.println(hashedPassword);
	}
	
	public void testBCryptHash(){
		String password = "secret";
		BCryptPasswordEncoder passwordEncode = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncode.encode(password);
		System.out.println(hashedPassword);
	}
	
	public void test() {
		fail("Not yet implemented");
	}

}
