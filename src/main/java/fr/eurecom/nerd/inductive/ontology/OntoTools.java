package fr.eurecom.nerd.inductive.ontology;

import java.util.ArrayList;
import java.util.List;

import com.hp.hpl.jena.ontology.OntClass;
import com.hp.hpl.jena.ontology.OntTools;
import com.hp.hpl.jena.vocabulary.RDFS;

public class OntoTools {
	
	private boolean hasSubClassTransitive( OntClass parent, OntClass child ) 
	{
	    return OntTools.findShortestPath( child.getOntModel(), child, parent,
	    		new OntTools.PredicatesFilter(RDFS.subClassOf) ) != null;
	}

	public List<OntClass> namedRootsOf( OntClass c ) {
	    List<OntClass> cRoots = new ArrayList<OntClass>();
	    for (OntClass root: OntTools.namedHierarchyRoots( c.getOntModel() )) {
	        if (hasSubClassTransitive( root, c )) {
	            cRoots.add( root );
	        }
	    }
	    return cRoots;
	}
}
