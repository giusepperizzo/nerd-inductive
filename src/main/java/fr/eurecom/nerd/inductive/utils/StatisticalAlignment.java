package fr.eurecom.nerd.inductive.utils;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Vector;

public class StatisticalAlignment {

	public static void main(String[] args) {
		
		String in_al = args[0];
		String out = args[1];
		
		StatisticalAlignment align = new StatisticalAlignment();
		StringBuilder sb = align.parse(in_al);
		align.serialize(out, sb.toString());
	}

	public void serialize(String out, String alignments) 
	{
		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter(new File(out)));
			bw.write(alignments);
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
			
	}

	public StringBuilder parse(String in_al) 
	{
		Vector<String> types = new Vector<String>();
		StringBuilder result = new StringBuilder();
		try {
			BufferedReader br = new BufferedReader(new FileReader(new File(in_al)));
			
			String line = null;
			int index = 0;
			while( (line = br.readLine()) != null ) {
				if(index==0) {
					String[] ts = line.split(";");
					for (int i=1; i< ts.length; i++) 
						types.add(ts[i]);
				}
				else {
					String[] chunks = line.split(";");
					String type_src = chunks[0];

					
					Vector<Integer> occurrences = new Vector<Integer>();
					for (int i=1; i< chunks.length; i++)
						occurrences.add(Integer.parseInt(chunks[i]));

					String type_target = types.get( findIndexMax(occurrences) );
					result.append(type_src.concat("\t").concat(type_target));				
					result.append("\n");
				}
					
				index++;
			}
			br.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	private int findIndexMax(Vector<Integer> occurrences) 
	{
		int maxIndex = -1; 
		int max = -1;
		
		for(int i=0; i< occurrences.size(); i++){
		  if(occurrences.get(i) > max){
		    max = occurrences.get(i);
		    maxIndex = i;
		  }
		}
		return maxIndex;
	}

}
