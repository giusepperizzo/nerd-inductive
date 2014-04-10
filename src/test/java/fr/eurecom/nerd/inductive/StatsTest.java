package fr.eurecom.nerd.inductive;
import java.util.List;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;
import edu.stanford.nlp.ling.CoreLabel;


public class StatsTest extends TestCase 
{
	/**
     * @return the suite of tests being tested
     */
    public static Test suite()
    {
        return new TestSuite( StatsTest.class );
    }

    public StatsTest(String name) { super(name); }

    public void testCountEntities()
    {
    	Main main = new Main();
		List<CoreLabel> ll = main.readCoNLL("data/test.conll");
		assertEquals(4, main.countEntities(ll));
    }
    
    public void testStats1()
    {
    }
    
    public void testStats() 
    {
    	Main main = new Main();
		List<CoreLabel> ll = main.readCoNLL("/home/rizzo/Cloud/Dropbox/ISWC2014/msm2013/train/alchemyapi.conll");
		assertTrue(true);
    }
}
