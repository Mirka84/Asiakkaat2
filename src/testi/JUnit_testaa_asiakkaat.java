package testi;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Order;

import model.Asiakas2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import model.dao.AsiakasDao;
import static org.junit.Assert.assertEquals; 
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;

@TestMethodOrder(OrderAnnotation.class); 
class JUnit_testaa_asiakkaat {

	@Test
	@Order(1)
	public void testlisaaAsiakas() {
		AsiakasDao dao=new AsiakasDao(); 
		Asiakas2 asiakas=new Asiakas2(2, "Kaisa", "Kokko", "040-123", "kaiko@gmail.com"); 
		Asiakas2 asiakas2=new Asiakas2(10, "Jesse", "Joki", "09-123", "JJ@hotmail.com"); 
		assertEquals(true, dao.lisaaAsiakas(asiakas)); 
		assertEquals(true, dao.lisaaAsiakas(asiakas2));
		
	}
	@Test
	@Order(2)
	public void testMuutaAsiakas() {
		AsiakasDao dao=new AsiakasDao(); 
		Asiakas2 muutettava=dao.etsiAsiakas(1); 
		muutettava.setAsiakas_id(1);
		muutettava.setEtunimi("Matias");
		muutettava.setSukunimi("Virtanen");
		muutettava.setPuhelin("09-123");
		muutettava.setSposti("masa@gmail.com");
		assertEquals(1, dao.etsiAsiakas(1).getAsiakas_id()); 
		assertEquals("Matias", dao.etsiAsiakas(1).getEtunimi()); 
	}

}
