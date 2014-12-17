package fr.eurecom.nerd.inductive.ontology;

import java.util.List;

import com.hp.hpl.jena.ontology.OntClass;
import com.hp.hpl.jena.ontology.OntModel;
import com.hp.hpl.jena.ontology.OntModelSpec;
import com.hp.hpl.jena.rdf.model.ModelFactory;

import junit.framework.TestCase;

public class OntoToolsTest extends TestCase {
	
	public void testParent() 
	{
        OntModel m = ModelFactory.createOntologyModel( OntModelSpec.OWL_MEM, null );
		m.read("data/dbpedia_3.8.owl", "RDF/XML");
		
        OntoTools tool = new OntoTools();
        List<OntClass> list = tool.namedRootsOf(m.getOntClass("http://dbpedia.org/ontology/Ambassador"));
        for (OntClass clazz : list) {
        	System.out.println(clazz.getURI());
        }
        
        assertEquals(1, list.size());
	}
}
