package fr.eurecom.nerd.inductive.utils;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import edu.stanford.nlp.ling.CoreAnnotations.AnswerAnnotation;
import edu.stanford.nlp.ling.CoreAnnotations.PartOfSpeechAnnotation;
import edu.stanford.nlp.ling.CoreAnnotations.TextAnnotation;
import edu.stanford.nlp.ling.CoreLabel;
import edu.stanford.nlp.sequences.CoNLLDocumentReaderAndWriter;
import edu.stanford.nlp.sequences.SeqClassifierFlags;

public class Resolution {

	public static final String BOUNDARY = "*BOUNDARY*";

	public static void main(String[] args) 
	{
		String in_conll = args[0];
		String in_resolution = args[1];
		String out_conll = args[2];

		Resolution res = new Resolution();
		
		List<CoreLabel> ll =  res.readCoNLL(in_conll);
		Map<String, String> maps = res.readAlignment(in_resolution);
		List<CoreLabel> lr = res.resolve(ll, maps);
		res.serialize(lr, out_conll);
		
	}
	
	public void serialize(List<CoreLabel> lr, String filename) 
	{
		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter(new File(filename)));
			for(CoreLabel label : lr) {
				String text = label.get(TextAnnotation.class);
				//FIXME it considers the POS as GS token
				String ansGold = label.get(PartOfSpeechAnnotation.class);
				String ans = label.get(AnswerAnnotation.class);
				bw.write(text + "\t" + ansGold + "\t" + ans + "\n");
			}
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Map<String, String> readAlignment(String filename) 
	{
		Map<String, String> result = new HashMap<String, String>();
		
		try {
			BufferedReader br = new BufferedReader(new FileReader(new File(filename)));
			String line;
			while( (line = br.readLine()) != null ) {
				String[] tokens = line.split("\t");
				result.put(tokens[0], tokens[1]);
			}
			br.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public List<CoreLabel> resolve (	List<CoreLabel> ll, 
										Map<String,String> maps
									) 
	{
		List<CoreLabel> result = new ArrayList<CoreLabel>();
		
		for (CoreLabel fl : ll) 
		{
			if (fl.word().equals(BOUNDARY)) continue;

			//String text = fl.get(TextAnnotation.class);
			//FIXME it considers the POS as GS token
			String ansGold = fl.get(PartOfSpeechAnnotation.class);
			String ans = fl.get(AnswerAnnotation.class);
					
			if (ansGold == null) continue;
			
//			String gold = ansGold
//							.replaceAll("^I-", "")
//							.replaceAll("^B-", "");
			
			Pattern pattern = Pattern.compile("\\b[I|B]-");
			Matcher match = pattern.matcher(ans);
			String iob_prefix = "";
			if(match.find()) iob_prefix = match.group(0);
			
			String answer = ans.replaceAll("^I-", "").replaceAll("^B-", "");
			
			String[] tokens = answer.split(",");
			
			String answer_tmp = "";
			Set<String> answer_set = new TreeSet<String>();
			int i=0;
			for (String s : tokens) 
				answer_set.add((maps.get(s) == null) ? s : maps.get(s));
			
			for (String s : answer_set) {
				if(i>=1) answer_tmp += ",";
				
				answer_tmp += s;
				++i;
			}
		
			String ansToResolve = answer_tmp.equals("O") ? 
						"O" : iob_prefix.concat( answer_tmp );
			
			CoreLabel e = new CoreLabel(fl);
			e.set(AnswerAnnotation.class, ansToResolve);
			result.add(e);
		}
		
		return result;
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
}
