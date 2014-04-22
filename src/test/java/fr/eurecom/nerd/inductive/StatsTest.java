package fr.eurecom.nerd.inductive;
import java.util.List;

import junit.framework.TestCase;
import edu.stanford.nlp.ling.CoreLabel;


public class StatsTest extends TestCase 
{

    public void testCountEntities()
    {
    	Main main = new Main();
		List<CoreLabel> ll = main.readCoNLL("data/test.conll");
		assertEquals(4, main.countEntities(ll));
    }
    
    public void testStats() 
    {
    	Main main = new Main();
		List<CoreLabel> ll = main.readCoNLL("/home/rizzo/Cloud/Dropbox/ISWC2014/msm2013/test/alchemyapi.conll");
		main.computeStatsByAlignment(ll);
		assertTrue(true);
    }
}
