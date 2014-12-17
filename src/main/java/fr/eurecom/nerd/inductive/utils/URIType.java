package fr.eurecom.nerd.inductive.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import edu.stanford.nlp.ling.CoreAnnotations.AnswerAnnotation;
import edu.stanford.nlp.ling.CoreAnnotations.PartOfSpeechAnnotation;
import edu.stanford.nlp.ling.CoreAnnotations.TextAnnotation;
import edu.stanford.nlp.ling.CoreLabel;
import edu.stanford.nlp.sequences.CoNLLDocumentReaderAndWriter;
import edu.stanford.nlp.sequences.SeqClassifierFlags;

public class URIType {
	
	public static final String BOUNDARY = "*BOUNDARY*";

	public static void main(String[] args) 
	{
		String in_conll = args[0];
		String prefix = args[1];
		String out_conll = args[2];

		URIType et = new URIType();
		List<CoreLabel> ll = et.readCoNLL(in_conll);
		List<CoreLabel> ln = et.run(ll, prefix);
		et.serialize(ln, out_conll);
		
	}
	
	private List<CoreLabel> run(List<CoreLabel> ll, String prefix) 
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
						
			Pattern pattern = Pattern.compile("\\b[I|B]-");
			Matcher match = pattern.matcher(ans);
			String iob_prefix = "";
			if(match.find()) iob_prefix = match.group(0);
			
			String answer = ans.replaceAll("^I-", "").replaceAll("^B-", "");
			String[] tokens = answer.split(",");
			String answer_tmp = "";
			int i=0;
			
			prefix = (prefix.equals("null")) ? "" : prefix;
			
			for (String s : tokens) {			
				if(s.startsWith("/")) continue; //we temporary discard freebase classes
				if(s.startsWith("http://schema.org/")) continue; //we temporary discard schema.org classes
				
				if(i>=1) answer_tmp += ",";

				if(s.equals("O")) answer_tmp += s;
				else answer_tmp += prefix.concat(s);
				
				++i;
			}
			
			String ansToResolve = "O";
			if (!answer_tmp.equals("")) 
				ansToResolve = iob_prefix.concat( answer_tmp );
			
			CoreLabel e = new CoreLabel(fl);
			e.set(AnswerAnnotation.class, ansToResolve);
			result.add(e);
		}
		
		return result;
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
