package fr.eurecom.nerd.inductive.ontology;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import com.hp.hpl.jena.ontology.OntClass;
import com.hp.hpl.jena.ontology.OntModel;
import com.hp.hpl.jena.ontology.OntModelSpec;
import com.hp.hpl.jena.ontology.Restriction;
import com.hp.hpl.jena.rdf.model.AnonId;
import com.hp.hpl.jena.rdf.model.ModelFactory;
import com.hp.hpl.jena.rdf.model.Resource;
import com.hp.hpl.jena.shared.PrefixMapping;
import com.hp.hpl.jena.util.iterator.Filter;


public class ClassHierarchy {	

    protected OntModel m_model;
    private Map<AnonId,String> m_anonIDs = new HashMap<AnonId, String>();
    private int m_anonCount = 0;
    
	public Map<Integer, TreeSet<String>> getLayers() {
		return layers;
	}
	public void setLayers(Map<Integer, TreeSet<String>> layers) {
		this.layers = layers;
	}
	private Map<Integer, TreeSet<String>> layers = new HashMap<Integer,TreeSet<String>>();


    /** Show the sub-class hierarchy encoded by the given model */
    public void showHierarchy( PrintStream out, OntModel m ) {
        // create an iterator over the root classes that are not anonymous class expressions
        Iterator<OntClass> i = m.listHierarchyRootClasses()
                      .filterDrop( new Filter<OntClass>() {
                                    @Override
                                    public boolean accept( OntClass r ) {
                                        return r.isAnon();
                                    }} );
        while (i.hasNext()) {
        	showClass( out, i.next(), new ArrayList<OntClass>(), 0 );
        }
    }

    public Integer getLayer (String clazz) 
    {       
        Set<Integer> keys = new TreeSet<Integer>(layers.keySet());
    	for (Integer key : keys) {
        	TreeSet<String> classes = layers.get(key);
        	for (String c : classes)
        		if(c.equals(clazz))
        			return key;
    	} 	
    	    	
    	return -1;
    }

    /** Present a class, then recurse down to the sub-classes.
     *  Use occurs check to prevent getting stuck in a loop
     */
    protected void showClass( PrintStream out, OntClass cls, List<OntClass> occurs, int depth ) {
        renderClassDescription( out, cls, depth );
        out.println();

        // recurse to the next level down
        if (cls.canAs( OntClass.class )  &&  !occurs.contains( cls )) {
            for (Iterator<OntClass> i = cls.listSubClasses( true );  i.hasNext(); ) {
                OntClass sub = i.next();

                // we push this expression on the occurs list before we recurse
                occurs.add( cls );
                showClass( out, sub, occurs, depth + 1 );
                occurs.remove( cls );
            }
        }
    }

    /**
     * <p>Render a description of the given class to the given output stream.</p>
     * @param out A print stream to write to
     * @param c The class to render
     */
    public void renderClassDescription( PrintStream out, OntClass c, int depth ) {
        indent( out, depth );

        if (c.isRestriction()) {
            renderRestriction( out, c.as( Restriction.class ) );
        }
        else {
            if (!c.isAnon()) {
                out.print( "Class " );
                renderURI( out, c.getModel(), c.getURI() );
                out.print( " " );
                TreeSet<String> classes = layers.remove(new Integer(depth));
                if(classes==null) classes = new TreeSet<String>();
                classes.add(renderURI(c.getModel(), c.getURI()));
                layers.put(new Integer(depth), classes);
            }
            else {
                renderAnonymous( out, c, "class" );
            }
        }
    }

    /**
     * <p>Handle the case of rendering a restriction.</p>
     * @param out The print stream to write to
     * @param r The restriction to render
     */
    protected void renderRestriction( PrintStream out, Restriction r ) {
        if (!r.isAnon()) {
            out.print( "Restriction " );
            renderURI( out, r.getModel(), r.getURI() );
        }
        else {
            renderAnonymous( out, r, "restriction" );
        }

        out.print( " on property " );
        renderURI( out, r.getModel(), r.getOnProperty().getURI() );
    }

    /** Render a URI */
    protected void renderURI( PrintStream out, PrefixMapping prefixes, String uri ) {
        out.print( prefixes.shortForm( uri ) );
    }
    
    protected String renderURI(PrefixMapping prefixes, String uri ) {
    	return prefixes.shortForm( uri );
    }

    /** Render an anonymous class or restriction */
    protected void renderAnonymous( PrintStream out, Resource anon, String name ) {
        String anonID = m_anonIDs.get( anon.getId() );
        if (anonID == null) {
            anonID = "a-" + m_anonCount++;
            m_anonIDs.put( anon.getId(), anonID );
        }

        out.print( "Anonymous ");
        out.print( name );
        out.print( " with ID " );
        out.print( anonID );
    }

    /** Generate the indentation */
    protected void indent( PrintStream out, int depth ) {
        for (int i = 0;  i < depth; i++) {
            out.print( "  " );
        }
    }

    public static void main( String[] args ) 
    {
        OntModel m = ModelFactory.createOntologyModel( OntModelSpec.OWL_MEM, null );
		m.read("data/dbpedia_3.8.owl", "RDF/XML");
				
		ClassHierarchy hier = new ClassHierarchy();
        //hier.showHierarchy( System.out, m);
		
		try {
			hier.showHierarchy( new PrintStream(new File("NUL")), m);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//        Map<Integer, TreeSet<String>> layers = hier.getLayers();
//        Set<Integer> keys = new TreeSet<Integer>(layers.keySet());
//        
//        for (Integer key : keys) {
//        	System.out.println(key);
//        	TreeSet<String> classes = layers.get(key);
//        	for (String clazz : classes)
//        		System.out.println("\t"+ clazz);
//        }
        
        System.out.println(hier.getLayer(":AdministrativeRegion"));
        //System.out.println(hier.getLayer(":Schools"));
//        System.out.println("-----------------------");
//        TraverseHierarchy traverse = new TraverseHierarchy();
//        traverse.resolve(m, maxDepth);
//        Map<String,String> mappings = traverse.getSubOf();
//        for (String s : new TreeSet<String>(mappings.keySet())) {
//        	System.out.println(s + "," + mappings.get(s));
//        }        
    }

}
