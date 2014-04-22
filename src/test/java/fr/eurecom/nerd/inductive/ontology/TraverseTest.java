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
		int maxDepth = 2;
		
		TraverseHierarchy traverse = new TraverseHierarchy();
		traverse.resolve(m, maxDepth);
		Map<String,String> subOf = traverse.getSubOf();
		
		assertEquals(4, subOf.size());
		
    }
}
