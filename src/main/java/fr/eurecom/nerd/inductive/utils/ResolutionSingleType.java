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

public class ResolutionSingleType {

	public static final String BOUNDARY = "*BOUNDARY*";

	public static void main(String[] args) 
	{
		String in_conll = args[0];
		String out_conll = args[1];

		ResolutionSingleType res = new ResolutionSingleType();
		
		List<CoreLabel> ll =  res.readCoNLL(in_conll);
		//Map<String, String> maps = res.readAlignment(in_resolution);
		List<CoreLabel> lr = res.resolve(ll);
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

	public List<CoreLabel> resolve ( List<CoreLabel> ll ) 
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
			Matcher match = pattern.matcher(ansGold);
			String iob_prefix = "";
			if(match.find()) iob_prefix = match.group(0);
			
			String answer = ans.replaceAll("^I-", "").replaceAll("^B-", "");
			String answerGold = ansGold.replaceAll("^I-", "").replaceAll("^B-", "");
			
			String ansToResolve = "";
						
			if( answer.contains(answerGold) ) {
				if (answerGold.equals("O") && answer.contains("O")) ansToResolve = "O";
				else if (answerGold.equals("O") && !answer.contains("O")) ansToResolve = "I-FAKE";
				else if (!answerGold.equals("O") && answer.contains("O")) ansToResolve = "O";
				else if (!answerGold.equals("O") && !answer.contains("O")) ansToResolve = iob_prefix.concat( answerGold );
			}
				
			else {
				if (answerGold.equals("O") && answer.contains("O")) ansToResolve = "O";
				else if (answerGold.equals("O") && !answer.contains("O")) ansToResolve = "I-FAKE";
				else if (!answerGold.equals("O") && answer.contains("O")) ansToResolve = "O";
				else if (!answerGold.equals("O") && !answer.contains("O")) ansToResolve = "I-FAKE";
			}
			
//			else if (answer.indexOf(answerGold)!= -1 && answer.indexOf("O")!= -1)
//				ansToResolve = "O";	
//			else if (answer.indexOf(answerGold)== -1 && answerGold.equals("O"))
//				ansToResolve =  "O";
//			else 
//				ansToResolve = iob_prefix.concat( "FAKE" );
//				
//			String[] tokens = answer.split(",");
//			Set<String> answer_set = new TreeSet<String>();
//			for (String s : tokens) 
//				answer_set.add((maps.get(s) == null) ? s : maps.get(s));
//			
//			String ansToResolve = "";
//			for (String s : answer_set) {
////				if(i>=1) answer_tmp += ",";
////				
////				answer_tmp += s;
////				++i;
//				System.out.println(s + "==" + ansGold.replaceAll("^I-", "").replaceAll("^B-", ""));
//				if ( s.equals(ansGold.replaceAll("^I-", "").replaceAll("^B-", "")) ) {
//					System.out.println("\t YES");
//					ansToResolve = iob_prefix.concat( s );
//					break;
//				}
//			}
//			
//			if(ansToResolve.equals("") && answer_set.size() > 1) ansToResolve = iob_prefix.concat("FAKE");
//			
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
