package fr.eurecom.nerd.inductive.ontology;

import java.util.Map;

import com.hp.hpl.jena.ontology.OntModel;
import com.hp.hpl.jena.ontology.OntModelSpec;
import com.hp.hpl.jena.rdf.model.ModelFactory;

import junit.framework.TestCase;

public class TraverseTest extends TestCase {

	public void test1()
    {
    	OntModel m = ModelFactory.createOntologyModel( OntModelSpec.OWL_MEM, null );
		m.read("data/test.owl", "RDF/XML");
		int maxDepth = 1;
		
		TraverseHierarchy traverse = new TraverseHierarchy();
		traverse.resolve(m, maxDepth);
		Map<String,String> subOf = traverse.getSubOf();
		
		assertEquals(6, subOf.size());
		
    }
	
	public void test2()
    {
    	OntModel m = ModelFactory.createOntologyModel( OntModelSpec.OWL_MEM, null );
		m.read("data/dbpedia_3.8.owl", "RDF/XML");
		int maxDepth = 1;
		
		TraverseHierarchy traverse = new TraverseHierarchy();
		traverse.resolve(m, maxDepth);
		Map<String,String> subOf = traverse.getSubOf();
		
		assertEquals(319, subOf.size());
		
    }
	
}
