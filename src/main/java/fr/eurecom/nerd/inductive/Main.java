package fr.eurecom.nerd.inductive;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeSet;
import java.util.Vector;

import org.apache.commons.io.FileUtils;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import edu.stanford.nlp.ling.CoreAnnotations.AnswerAnnotation;
import edu.stanford.nlp.ling.CoreAnnotations.PartOfSpeechAnnotation;
import edu.stanford.nlp.ling.CoreAnnotations.TextAnnotation;
import edu.stanford.nlp.ling.CoreLabel;
import edu.stanford.nlp.sequences.CoNLLDocumentReaderAndWriter;
import edu.stanford.nlp.sequences.SeqClassifierFlags;

public class Main {

	public static final String BOUNDARY = "*BOUNDARY*";

	@SuppressWarnings("unchecked")
	public static void main(String[] args) 
	{
		Main main = new Main();
		
		List<CoreLabel> ll =  main.readCoNLL(args[0]);
		
		Pair pair = main.computeStatsByAlignment(ll);
		
		Vector<String> types = new Vector<String>( (TreeSet<String>)pair.getA() );
		Map<String, HashMap<String, Integer>> alignments = 
					(HashMap<String, HashMap<String, Integer>>) pair.getB();
		
		main.serialize(types, alignments, args[1]);
		
		
	}
	
	public void serialize (	Vector<String> types, 
							Map<String,HashMap<String,Integer>> alignments,
							String filename) 
	{
		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter(filename));
			
			StringBuilder sbTypes = new StringBuilder();
			for(String gstype : types)
				sbTypes.append(gstype).append(";");
			bw.write( ";".concat( sbTypes
									.toString()
									.trim()
									.substring(0,sbTypes.toString().trim().length()-1)
									.concat("\n") ) );
			
			for (Entry<String,HashMap<String,Integer>> entry : alignments.entrySet()) 
			{
				Map<String, Integer> map = entry.getValue();
	
				StringBuilder sb = new StringBuilder();
				sb
					.append(entry.getKey())
					.append(";");
				
				for(String gstype : types) 
				{
					if(map.containsKey(gstype))
						sb.append(map.get(gstype));
					else
						sb.append("0");
					sb.append(";");
				}
				
				String result = sb.toString()
									.trim()
									.substring(0, sb.toString().length()-1)
									.concat("\n");
	
				bw.write(result);
			}
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Pair computeStatsByAlignment (List<CoreLabel> ll) 
	{
		Map<String, HashMap<String, Integer>> alignments = 
					new HashMap<String, HashMap<String,Integer>>();
		
		Set<String> types = new TreeSet<String>();
		
		for (CoreLabel fl : ll) 
		{
			
			if (fl.word().equals(BOUNDARY)) continue;

			String text = fl.get(TextAnnotation.class);
			//FIXME it considers the POS as GS token
			String ansGold = fl.get(PartOfSpeechAnnotation.class);
			String ans = fl.get(AnswerAnnotation.class);
					
			if (ansGold == null) continue;
			
			String gold = ansGold
							.replaceAll("^I-", "")
							.replaceAll("^B-", "");	
			
			ans = ans.replaceAll("(^I-)", "").replaceAll("(^B-)", "");
		
			String[] annotations = ans.split(",");
			for(String annotation : annotations) 
			{			
				HashMap<String, Integer> mapper = alignments.remove(annotation);
				mapper = (mapper == null) ? new HashMap<String, Integer>(): mapper;
					
				Integer occ = mapper.remove(gold);
				occ = (occ == null) ? new Integer(1) : new Integer(occ+1);
	
				//restore the updates
				mapper.put(gold, occ);
				alignments.put(annotation, mapper);
				
				//update types
				types.add(gold);
			}
		}
		
		return new Pair(types, alignments);
	}
	
	public HashMap<String, HashMap<String, Integer>> computeStatsByGS (List<CoreLabel> ll) 
	{
		HashMap<String, HashMap<String, Integer>> result = 
					new HashMap<String, HashMap<String,Integer>>();
		
		for (CoreLabel fl : ll) 
		{
			
			if (fl.word().equals(BOUNDARY)) continue;

			String text = fl.get(TextAnnotation.class);
			//FIXME it considers the POS as GS token
			String ansGold = fl.get(PartOfSpeechAnnotation.class);
			String ans = fl.get(AnswerAnnotation.class);
					
			if (ansGold == null) continue;
			
			String gold = ansGold
							.replaceAll("^I-", "")
							.replaceAll("^B-", "");
			ans = ans.replaceAll("^I-", "").replaceAll("^B-", "");
		
			
			HashMap<String, Integer> mapping = result.remove(gold);
			mapping = (mapping == null) ? new HashMap<String, Integer>(): mapping;
				
			Integer occ = mapping.remove(ans);
			occ = (occ == null) ? new Integer(1) : new Integer(occ+1);

			//restore the updates
			mapping.put(ans, occ);
			result.put(gold, mapping);

		}
		
		return result;
	}
	
	public int countEntities (List<CoreLabel> ll) 
	{	
		int numTokens = 0;
		int numEntities = 0;
		String lastAnsBase = "";
		
		for (CoreLabel fl : ll) {
			// System.out.println("FL " + (++i) + " was " + fl);
			if (fl.word().equals(BOUNDARY)) {
				continue;
			}
			String ans = fl.get(AnswerAnnotation.class);
			String text = fl.get(TextAnnotation.class);
			
			//it considers the POS as GS token
			String ansGold = fl.get(PartOfSpeechAnnotation.class);
			String ansBase;
			String ansPrefix;
			String[] bits = ans.split("-");
			if (bits.length == 1) 
			{
				ansBase = bits[0];
				ansPrefix = "";
			} else {
				ansBase = bits[1];
				ansPrefix = bits[0];
			}
			numTokens++;
			
			if (ansBase.equals("O")) { } 
			else if (ansBase.equals(lastAnsBase)) {
				if (ansPrefix.equals("B")) 
					numEntities++;
			}
			else 
				numEntities++;		
		}
		
		return numEntities;
	}
		
	public List<CoreLabel> readCoNLL(String filename) 
	{
		CoNLLDocumentReaderAndWriter f = new CoNLLDocumentReaderAndWriter();
		f.init(new SeqClassifierFlags());
		List<CoreLabel> ll = null; 
		
		try {
			Iterator<List<CoreLabel>> itr = f.getIterator(new FileReader(filename));
			if(itr.hasNext()) ll = itr.next();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
		return ll;
	}

	public List<Entity> readJSON (String filename) 
	{	
		List<Entity> result = null;		
		String json = null;
		Gson gson = new Gson();
		
		try {
			json = FileUtils.readFileToString(new File(filename));
						
			Type entityListType = new TypeToken<ArrayList<Entity>>() {}.getType();
			List<Entity> entities = gson.fromJson(json, entityListType);
			
			for (Entity e : entities) {
				System.out.println(e.getLabel());
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		return result;
	}

}
