package fr.eurecom.nerd.inductive.ontology;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.hp.hpl.jena.ontology.OntClass;
import com.hp.hpl.jena.ontology.OntModel;
import com.hp.hpl.jena.ontology.Restriction;
import com.hp.hpl.jena.rdf.model.AnonId;
import com.hp.hpl.jena.rdf.model.Resource;
import com.hp.hpl.jena.shared.PrefixMapping;
import com.hp.hpl.jena.util.iterator.Filter;

public class TraverseHierarchy {

    protected OntModel m_model;
    private Map<AnonId,String> m_anonIDs = new HashMap<AnonId, String>();
    private int m_anonCount = 0;
    public Map<String, String> getSubOf() {
		return subOf;
	}

	public void setSubOf(Map<String, String> subOf) {
		this.subOf = subOf;
	}

	private Map<String, String> subOf = new HashMap<String, String>();
    
    
    public void resolve( OntModel m, int maxDepth ) {
        // create an iterator over the root classes that are not anonymous class expressions
        Iterator<OntClass> i = m.listHierarchyRootClasses()
                      .filterDrop( 
                    		  new Filter<OntClass>() {
                                    public boolean accept( OntClass r ) {
                                        return r.isAnon();
                                    }} 
                    		      );

        while (i.hasNext()) {
            focusClass( i.next(), new ArrayList<OntClass>(), 0 , maxDepth);
        }
    }

    protected void focusClass( 	OntClass cls, 
    							List<OntClass> occurs, 
    							int depth, 
    							int maxDepth ) 
    {
        renderClassDescription( cls, depth, maxDepth );

        // recurse to the next level down
        if (cls.canAs( OntClass.class )  &&  !occurs.contains( cls )) {
            for (Iterator<OntClass> i = cls.listSubClasses( true );  i.hasNext(); ) {
                OntClass sub = i.next();

                // we push this expression on the occurs list before we recurse
                occurs.add( cls );
                focusClass( sub, occurs, depth + 1, maxDepth );
                occurs.remove( cls );
            }
        }
    }

    public void renderClassDescription( OntClass c, int depth, int maxDepth ) {

        if (c.isRestriction()) {
            renderRestriction( c.as( Restriction.class ) );
        }
        else {
            if (!c.isAnon()) {
                renderURI( c.getModel(), c.getURI() );
                
                if(depth > maxDepth-1) {
                    int back = depth-maxDepth-1;
                    OntClass ancestor = c.getSuperClass();
                	for (int i=0; i<=back; i++) {
                		ancestor = ancestor.getSuperClass();
                	}
                	
                	subOf.put( c.getLocalName(), ancestor.getLocalName() );
                }
            }
            else {
            	renderAnonymous( c, "class" );
            }
        }
    }

    protected void renderRestriction( Restriction r ) {
        if (!r.isAnon()) {
            renderURI( r.getModel(), r.getURI() );
        }
        else {
        }
        renderURI( r.getModel(), r.getOnProperty().getURI() );
    }
    
    protected String renderURI(PrefixMapping prefixes, String uri ) {
    	return prefixes.shortForm( uri );
    }
    
    protected void renderAnonymous(Resource anon, String name ) {
        String anonID = m_anonIDs.get( anon.getId() );
        if (anonID == null) {
            anonID = "a-" + m_anonCount++;
            m_anonIDs.put( anon.getId(), anonID );
        }
    }

}
