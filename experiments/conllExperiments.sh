
export CLASSPATH=/home/vanerp/weka-3-6-11/weka.jar


###########
# AlchemyAPI
###########

echo " alchemyapi.NaiveBayes" > ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t alchemyapi.train.arff -T alchemyapi.test.arff -p 1,2 > alchemyapi.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl alchemyapi.NaiveBayes.predictions.txt > alchemyapi.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r < alchemyapi.NaiveBayes.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " alchemyapi.NaiveBayes.nerdtype" >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t alchemyapi_nerdtype.train.arff -T alchemyapi_nerdtype.test.arff -p 1,2 > alchemyapi_nerdtype.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl alchemyapi_nerdtype.NaiveBayes.predictions.txt > alchemyapi_nerdtype.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r < alchemyapi_nerdtype.NaiveBayes.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " alchemyapi.NaiveBayes_uritype" >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t alchemyapi_uritype.train.arff -T alchemyapi_uritype.test.arff -p 1,2 > alchemyapi_uritype.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  alchemyapi_uritype.NaiveBayes.predictions.txt >  alchemyapi_uritype.NaiveBayes.predictions.conll.txt 
perl ../conlleval.pl -r <  alchemyapi_uritype.NaiveBayes.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " alchemyapi.NaiveBayes.uritype.first" >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t alchemyapi_uritype_first.train.arff -T alchemyapi_uritype_first.test.arff -p 1,2 > alchemyapi_uritype_first.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  alchemyapi_uritype_first.NaiveBayes.predictions.txt >  alchemyapi_uritype_first.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r <  alchemyapi_uritype_first.NaiveBayes.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " alchemyapi.IB1" >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t alchemyapi.train.arff -T alchemyapi.test.arff -p 1,2 > alchemyapi.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl alchemyapi.IB1.predictions.txt > alchemyapi.IB1.predictions.conll.txt
perl ../conlleval.pl -r < alchemyapi.IB1.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " alchemyapi.IB1_nerdtype" >> ../CoNLLExperiments.txt           
java -Xmx4g weka.classifiers.lazy.IB1 -t alchemyapi_nerdtype.train.arff -T alchemyapi_nerdtype.test.arff -p 1,2 > alchemyapi_nerdtype.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl alchemyapi_nerdtype.IB1.predictions.txt > alchemyapi_nerdtype.IB1.predictions.conll.txt
perl ../conlleval.pl -r < alchemyapi_nerdtype.IB1.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " alchemyapi.IB1_uritype"  >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t alchemyapi_uritype.train.arff -T alchemyapi_uritype.test.arff -p 1,2 > alchemyapi_uritype.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  alchemyapi_uritype.IB1.predictions.txt >  alchemyapi_uritype.IB1.predictions.conll.txt
perl ../conlleval.pl -r <  alchemyapi_uritype.IB1.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " alchemyapi.IB1_uritype_first"  >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t alchemyapi_uritype_first.train.arff -T alchemyapi_uritype_first.test.arff -p 1,2 > alchemyapi_uritype_first.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  alchemyapi_uritype_first.IB1.predictions.txt >  alchemyapi_uritype_first.IB1.predictions.conll.txt
perl ../conlleval.pl -r <  alchemyapi_uritype_first.IB1.predictions.conll.txt >> ../CoNLLExperiments.txt

###########
# Datatxt
###########

echo " datatxt.NaiveBayes" >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t datatxt.train.arff -T datatxt.test.arff -p 1,2 > datatxt.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl datatxt.NaiveBayes.predictions.txt > datatxt.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r < datatxt.NaiveBayes.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " datatxt.NaiveBayes_nerdtype" >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t datatxt_nerdtype.train.arff -T datatxt_nerdtype.test.arff -p 1,2 > datatxt_nerdtype.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl datatxt_nerdtype.NaiveBayes.predictions.txt > datatxt_nerdtype.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r < datatxt_nerdtype.NaiveBayes.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " datatxt.NaiveBayes_uritype" >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t datatxt_uritype.train.arff -T datatxt_uritype.test.arff -p 1,2 > datatxt_uritype.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  datatxt_uritype.NaiveBayes.predictions.txt >  datatxt_uritype.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r <  datatxt_uritype.NaiveBayes.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " datatxt.NaiveBayes_uritype_first" >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t datatxt_uritype_first.train.arff -T datatxt_uritype_first.test.arff -p 1,2 > datatxt_uritype_first.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  datatxt_uritype_first.NaiveBayes.predictions.txt >  datatxt_uritype_first.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r <  datatxt_uritype_first.NaiveBayes.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " datatxt.NaiveBayes_uritype_second" >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t datatxt_uritype_second.train.arff -T datatxt_uritype_second.test.arff -p 1,2 > datatxt_uritype_second.NaiveBayes.predictions.txt 
perl ../convertWekaPredictionsToCoNLL.pl datatxt_uritype_second.NaiveBayes.predictions.txt > datatxt_uritype_second.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r < datatxt_uritype_second.NaiveBayes.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " datatxt.NaiveBayes_uritype_third" >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t datatxt_uritype_third.train.arff -T datatxt_uritype_third.test.arff -p 1,2 > datatxt_uritype_third.NaiveBayes.predictions.txt          
perl ../convertWekaPredictionsToCoNLL.pl datatxt_uritype_third.NaiveBayes.predictions.txt > datatxt_uritype_third.NaiveBayes.predictions.conll.txt           
perl ../conlleval.pl -r < datatxt_uritype_third.NaiveBayes.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " datatxt.IB1" >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t datatxt.train.arff -T datatxt.test.arff -p 1,2 > datatxt.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl datatxt.IB1.predictions.txt > datatxt.IB1.predictions.conll.txt
perl ../conlleval.pl -r < datatxt.IB1.predictions.conll.txt >> ../CoNLLExperiments.txt

 echo " datatxt.IB1_nerdtype"  >> ../CoNLLExperiments.txt           
java -Xmx4g weka.classifiers.lazy.IB1 -t datatxt_nerdtype.train.arff -T datatxt_nerdtype.test.arff -p 1,2 > datatxt_nerdtype.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl datatxt_nerdtype.IB1.predictions.txt > datatxt_nerdtype.IB1.predictions.conll.txt
perl ../conlleval.pl -r < datatxt_nerdtype.IB1.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " datatxt.IB1_uritype" >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t datatxt_uritype.train.arff -T datatxt_uritype.test.arff -p 1,2 > datatxt_uritype.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  datatxt_uritype.IB1.predictions.txt >  datatxt_uritype.IB1.predictions.conll.txt
perl ../conlleval.pl -r <  datatxt_uritype.IB1.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " datatxt.IB1_uritype_first"  >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t datatxt_uritype_first.train.arff -T datatxt_uritype_first.test.arff -p 1,2 > datatxt_uritype_first.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  datatxt_uritype_first.IB1.predictions.txt >  datatxt_uritype_first.IB1.predictions.conll.txt
perl ../conlleval.pl -r <  datatxt_uritype_first.IB1.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " datatxt.IB1_uritype_second"  >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t datatxt_uritype_second.train.arff -T datatxt_uritype_second.test.arff -p 1,2 > datatxt_uritype_second.IB1.predictions.txt 
perl ../convertWekaPredictionsToCoNLL.pl datatxt_uritype_second.IB1.predictions.txt > datatxt_uritype_second.IB1.predictions.conll.txt
perl ../conlleval.pl -r < datatxt_uritype_second.IB1.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " datatxt.IB1_uritype_third"  >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t datatxt_uritype_third.train.arff -T datatxt_uritype_third.test.arff -p 1,2 > datatxt_uritype_third.IB1.predictions.txt          
perl ../convertWekaPredictionsToCoNLL.pl datatxt_uritype_third.IB1.predictions.txt > datatxt_uritype_third.IB1.predictions.conll.txt           
perl ../conlleval.pl -r < datatxt_uritype_third.IB1.predictions.conll.txt >> ../CoNLLExperiments.txt

###########
# dbspotlight 
###########

echo " dbspotlight.NaiveBayes" >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t dbspotlight.train.arff -T dbspotlight.test.arff -p 1,2 > dbspotlight.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl dbspotlight.NaiveBayes.predictions.txt > dbspotlight.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r < dbspotlight.NaiveBayes.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " dbspotlight.NaiveBayes_nerdtype"  >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t dbspotlight_nerdtype.train.arff -T dbspotlight_nerdtype.test.arff -p 1,2 > dbspotlight_nerdtype.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl dbspotlight_nerdtype.NaiveBayes.predictions.txt > dbspotlight_nerdtype.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r < dbspotlight_nerdtype.NaiveBayes.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " dbspotlight.NaiveBayes_uritype"  >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t dbspotlight_uritype.train.arff -T dbspotlight_uritype.test.arff -p 1,2 > dbspotlight_uritype.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  dbspotlight_uritype.NaiveBayes.predictions.txt >  dbspotlight_uritype.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r <  dbspotlight_uritype.NaiveBayes.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " dbspotlight.NaiveBayes_uritype_first"  >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t dbspotlight_uritype_first.train.arff -T dbspotlight_uritype_first.test.arff -p 1,2 > dbspotlight_uritype_first.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  dbspotlight_uritype_first.NaiveBayes.predictions.txt >  dbspotlight_uritype_first.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r <  dbspotlight_uritype_first.NaiveBayes.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " dbspotlight.NaiveBayes_uritype_second"  >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t dbspotlight_uritype_second.train.arff -T dbspotlight_uritype_second.test.arff -p 1,2 > dbspotlight_uritype_second.NaiveBayes.predictions.txt 
perl ../convertWekaPredictionsToCoNLL.pl dbspotlight_uritype_second.NaiveBayes.predictions.txt > dbspotlight_uritype_second.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r < dbspotlight_uritype_second.NaiveBayes.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " dbspotlight.NaiveBayes_uritype_third"  >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t dbspotlight_uritype_third.train.arff -T dbspotlight_uritype_third.test.arff -p 1,2 > dbspotlight_uritype_third.NaiveBayes.predictions.txt          
perl ../convertWekaPredictionsToCoNLL.pl dbspotlight_uritype_third.NaiveBayes.predictions.txt > dbspotlight_uritype_third.NaiveBayes.predictions.conll.txt           
perl ../conlleval.pl -r < dbspotlight_uritype_third.NaiveBayes.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " dbspotlight.IB1" >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t dbspotlight.train.arff -T dbspotlight.test.arff -p 1,2 > dbspotlight.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl dbspotlight.IB1.predictions.txt > dbspotlight.IB1.predictions.conll.txt
perl ../conlleval.pl -r < dbspotlight.IB1.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " dbspotlight.IB1_nerdtype" >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t dbspotlight_nerdtype.train.arff -T dbspotlight_nerdtype.test.arff -p 1,2 > dbspotlight_nerdtype.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl dbspotlight_nerdtype.IB1.predictions.txt > dbspotlight_nerdtype.IB1.predictions.conll.txt
perl ../conlleval.pl -r < dbspotlight_nerdtype.IB1.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " dbspotlight.IB1_uritype" >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t dbspotlight_uritype.train.arff -T dbspotlight_uritype.test.arff -p 1,2 > dbspotlight_uritype.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  dbspotlight_uritype.IB1.predictions.txt >  dbspotlight_uritype.IB1.predictions.conll.txt
perl ../conlleval.pl -r <  dbspotlight_uritype.IB1.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " dbspotlight.IB1_uritype_first" >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t dbspotlight_uritype_first.train.arff -T dbspotlight_uritype_first.test.arff -p 1,2 > dbspotlight_uritype_first.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  dbspotlight_uritype_first.IB1.predictions.txt >  dbspotlight_uritype_first.IB1.predictions.conll.txt
perl ../conlleval.pl -r <  dbspotlight_uritype_first.IB1.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " dbspotlight.IB1_uritype_second" >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t dbspotlight_uritype_second.train.arff -T dbspotlight_uritype_second.test.arff -p 1,2 > dbspotlight_uritype_second.IB1.predictions.txt 
perl ../convertWekaPredictionsToCoNLL.pl dbspotlight_uritype_second.IB1.predictions.txt > dbspotlight_uritype_second.IB1.predictions.conll.txt
perl ../conlleval.pl -r < dbspotlight_uritype_second.IB1.predictions.conll.txt >> ../CoNLLExperiments.txt

echo " dbspotlight.IB1_uritype_third" >> ../CoNLLExperiments.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t dbspotlight_uritype_third.train.arff -T dbspotlight_uritype_third.test.arff -p 1,2 > dbspotlight_uritype_third.IB1.predictions.txt          
perl ../convertWekaPredictionsToCoNLL.pl dbspotlight_uritype_third.IB1.predictions.txt > dbspotlight_uritype_third.IB1.predictions.conll.txt           
perl ../conlleval.pl -r < dbspotlight_uritype_third.IB1.predictions.conll.txt >> ../CoNLLExperiments.txt

###########
# Lupedia 
###########

echo " lupedia.NaiveBayes" >> ../MSMExperiments_30April_pt1.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t lupedia.train.arff -T lupedia.test.arff -p 1,2 > lupedia.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl lupedia.NaiveBayes.predictions.txt > lupedia.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r < lupedia.NaiveBayes.predictions.conll.txt >> ../MSMExperiments_30April_pt1.txt

echo " lupedia.NaiveBayes_nerdtype" >> ../MSMExperiments_30April_pt1.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t lupedia_nerdtype.train.arff -T lupedia_nerdtype.test.arff -p 1,2 > lupedia_nerdtype.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl lupedia_nerdtype.NaiveBayes.predictions.txt > lupedia_nerdtype.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r < lupedia_nerdtype.NaiveBayes.predictions.conll.txt >> ../MSMExperiments_30April_pt1.txt

echo " lupedia.NaiveBayes_uritype" >> ../MSMExperiments_30April_pt1.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t lupedia_uritype.train.arff -T lupedia_uritype.test.arff -p 1,2 > lupedia_uritype.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  lupedia_uritype.NaiveBayes.predictions.txt >  lupedia_uritype.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r <  lupedia_uritype.NaiveBayes.predictions.conll.txt >> ../MSMExperiments_30April_pt1.txt

echo " lupedia.NaiveBayes_uritype_first" >> ../MSMExperiments_30April_pt1.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t lupedia_uritype_first.train.arff -T lupedia_uritype_first.test.arff -p 1,2 > lupedia_uritype_first.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  lupedia_uritype_first.NaiveBayes.predictions.txt >  lupedia_uritype_first.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r <  lupedia_uritype_first.NaiveBayes.predictions.conll.txt >> ../MSMExperiments_30April_pt1.txt

echo " lupedia.NaiveBayes_uritype_second" >> ../MSMExperiments_30April_pt1.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t lupedia_uritype_second.train.arff -T lupedia_uritype_second.test.arff -p 1,2 > lupedia_uritype_second.NaiveBayes.predictions.txt 
perl ../convertWekaPredictionsToCoNLL.pl lupedia_uritype_second.NaiveBayes.predictions.txt > lupedia_uritype_second.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r < lupedia_uritype_second.NaiveBayes.predictions.conll.txt >> ../MSMExperiments_30April_pt1.txt

echo " lupedia.NaiveBayes_uritype_third" >> ../MSMExperiments_30April_pt1.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t lupedia_uritype_third.train.arff -T lupedia_uritype_third.test.arff -p 1,2 > lupedia_uritype_third.NaiveBayes.predictions.txt          
perl ../convertWekaPredictionsToCoNLL.pl lupedia_uritype_third.NaiveBayes.predictions.txt > lupedia_uritype_third.NaiveBayes.predictions.conll.txt           
perl ../conlleval.pl -r < lupedia_uritype_third.NaiveBayes.predictions.conll.txt >> ../MSMExperiments_30April_pt1.txt

echo " lupedia.IB1" >> ../MSMExperiments_30April_pt1.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t lupedia.train.arff -T lupedia.test.arff -p 1,2 > lupedia.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl lupedia.IB1.predictions.txt > lupedia.IB1.predictions.conll.txt
perl ../conlleval.pl -r < lupedia.IB1.predictions.conll.txt >> ../MSMExperiments_30April_pt1.txt

echo " lupedia.IB1_nerdtype" >> ../MSMExperiments_30April_pt1.txt            
java -Xmx4g weka.classifiers.lazy.IB1 -t lupedia_nerdtype.train.arff -T lupedia_nerdtype.test.arff -p 1,2 > lupedia_nerdtype.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl lupedia_nerdtype.IB1.predictions.txt > lupedia_nerdtype.IB1.predictions.conll.txt
perl ../conlleval.pl -r < lupedia_nerdtype.IB1.predictions.conll.txt >> ../MSMExperiments_30April_pt1.txt

echo " lupedia.IB1_uritype" >> ../MSMExperiments_30April_pt1.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t lupedia_uritype.train.arff -T lupedia_uritype.test.arff -p 1,2 > lupedia_uritype.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  lupedia_uritype.IB1.predictions.txt >  lupedia_uritype.IB1.predictions.conll.txt
perl ../conlleval.pl -r <  lupedia_uritype.IB1.predictions.conll.txt >> ../MSMExperiments_30April_pt1.txt

echo " lupedia.IB1_uritype_first" >> ../MSMExperiments_30April_pt1.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t lupedia_uritype_first.train.arff -T lupedia_uritype_first.test.arff -p 1,2 > lupedia_uritype_first.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  lupedia_uritype_first.IB1.predictions.txt >  lupedia_uritype_first.IB1.predictions.conll.txt
perl ../conlleval.pl -r <  lupedia_uritype_first.IB1.predictions.conll.txt >> ../MSMExperiments_30April_pt1.txt

echo " lupedia.IB1_uritype_second" >> ../MSMExperiments_30April_pt1.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t lupedia_uritype_second.train.arff -T lupedia_uritype_second.test.arff -p 1,2 > lupedia_uritype_second.IB1.predictions.txt 
perl ../convertWekaPredictionsToCoNLL.pl lupedia_uritype_second.IB1.predictions.txt > lupedia_uritype_second.IB1.predictions.conll.txt
perl ../conlleval.pl -r < lupedia_uritype_second.IB1.predictions.conll.txt >> ../MSMExperiments_30April_pt1.txt

echo " lupedia.IB1_uritype_third" >> ../MSMExperiments_30April_pt1.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t lupedia_uritype_third.train.arff -T lupedia_uritype_third.test.arff -p 1,2 > lupedia_uritype_third.IB1.predictions.txt          
perl ../convertWekaPredictionsToCoNLL.pl lupedia_uritype_third.IB1.predictions.txt > lupedia_uritype_third.IB1.predictions.conll.txt           
perl ../conlleval.pl -r < lupedia_uritype_third.IB1.predictions.conll.txt >> ../MSMExperiments_30April_pt1.txt

###########
# Opencalais
###########

echo " opencalais.NaiveBayes" >> ../MSMExperiments_30April_pt1.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t opencalais.train.arff -T opencalais.test.arff -p 1,2 > opencalais.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl opencalais.NaiveBayes.predictions.txt > opencalais.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r < opencalais.NaiveBayes.predictions.conll.txt >> ../MSMExperiments_30April_pt1.txt

echo " opencalais.NaiveBayes_nerdtype" >> ../MSMExperiments_30April_pt1.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t opencalais_nerdtype.train.arff -T opencalais_nerdtype.test.arff -p 1,2 > opencalais_nerdtype.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl opencalais_nerdtype.NaiveBayes.predictions.txt > opencalais_nerdtype.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r < opencalais_nerdtype.NaiveBayes.predictions.conll.txt >> ../MSMExperiments_30April_pt1.txt

echo " opencalais.NaiveBayes_uritype" >> ../MSMExperiments_30April_pt1.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t opencalais_uritype.train.arff -T opencalais_uritype.test.arff -p 1,2 > opencalais_uritype.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  opencalais_uritype.NaiveBayes.predictions.txt >  opencalais_uritype.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r <  opencalais_uritype.NaiveBayes.predictions.conll.txt >> ../MSMExperiments_30April_pt1.txt

echo " opencalais.NaiveBayes_uritype_first" >> ../MSMExperiments_30April_pt1.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t opencalais_uritype_first.train.arff -T opencalais_uritype_first.test.arff -p 1,2 > opencalais_uritype_first.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  opencalais_uritype_first.NaiveBayes.predictions.txt >  opencalais_uritype_first.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r <  opencalais_uritype_first.NaiveBayes.predictions.conll.txt >> ../MSMExperiments_30April_pt1.txt

echo " opencalais.IB1" >> ../MSMExperiments_30April_pt1.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t opencalais.train.arff -T opencalais.test.arff -p 1,2 > opencalais.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl opencalais.IB1.predictions.txt > opencalais.IB1.predictions.conll.txt
perl ../conlleval.pl -r < opencalais.IB1.predictions.conll.txt >> ../MSMExperiments_30April_pt1.txt

echo " opencalais.IB1_nerdtype" >> ../MSMExperiments_30April_pt1.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t opencalais_nerdtype.train.arff -T opencalais_nerdtype.test.arff -p 1,2 > opencalais_nerdtype.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl opencalais_nerdtype.IB1.predictions.txt > opencalais_nerdtype.IB1.predictions.conll.txt
perl ../conlleval.pl -r < opencalais_nerdtype.IB1.predictions.conll.txt >> ../MSMExperiments_30April_pt1.txt

echo " opencalais.IB1_uritype" >> ../MSMExperiments_30April_pt1.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t opencalais_uritype.train.arff -T opencalais_uritype.test.arff -p 1,2 > opencalais_uritype.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  opencalais_uritype.IB1.predictions.txt >  opencalais_uritype.IB1.predictions.conll.txt
perl ../conlleval.pl -r <  opencalais_uritype.IB1.predictions.conll.txt >> ../MSMExperiments_30April_pt1.txt

echo " opencalais.IB1_uritype_first" >> ../MSMExperiments_30April_pt1.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t opencalais_uritype_first.train.arff -T opencalais_uritype_first.test.arff -p 1,2 > opencalais_uritype_first.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  opencalais_uritype_first.IB1.predictions.txt >  opencalais_uritype_first.IB1.predictions.conll.txt
perl ../conlleval.pl -r <  opencalais_uritype_first.IB1.predictions.conll.txt >> ../MSMExperiments_30April_pt1.txt

###########
# textrazor 
###########
echo " textrazor.NaiveBayes" >> ../MSMExperiments_30April_pt2.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t textrazor.train.arff -T textrazor.test.arff -p 1,2 > textrazor.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl textrazor.NaiveBayes.predictions.txt > textrazor.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r < textrazor.NaiveBayes.predictions.conll.txt >> ../MSMExperiments_30April_pt2.txt

echo " textrazor.NaiveBayes_nerdtype" >> ../MSMExperiments_30April_pt2.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t textrazor_nerdtype.train.arff -T textrazor_nerdtype.test.arff -p 1,2 > textrazor_nerdtype.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl textrazor_nerdtype.NaiveBayes.predictions.txt > textrazor_nerdtype.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r < textrazor_nerdtype.NaiveBayes.predictions.conll.txt >> ../MSMExperiments_30April_pt2.txt

echo " textrazor.NaiveBayes_uritype" >> ../MSMExperiments_30April_pt2.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t textrazor_uritype.train.arff -T textrazor_uritype.test.arff -p 1,2 > textrazor_uritype.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  textrazor_uritype.NaiveBayes.predictions.txt >  textrazor_uritype.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r <  textrazor_uritype.NaiveBayes.predictions.conll.txt >> ../MSMExperiments_30April_pt2.txt

echo " textrazor.NaiveBayes_uritype_first" >> ../MSMExperiments_30April_pt2.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t textrazor_uritype_first.train.arff -T textrazor_uritype_first.test.arff -p 1,2 > textrazor_uritype_first.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  textrazor_uritype_first.NaiveBayes.predictions.txt >  textrazor_uritype_first.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r <  textrazor_uritype_first.NaiveBayes.predictions.conll.txt >> ../MSMExperiments_30April_pt2.txt

echo " textrazor.NaiveBayes_uritype_second" >> ../MSMExperiments_30April_pt2.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t textrazor_uritype_second.train.arff -T textrazor_uritype_second.test.arff -p 1,2 > textrazor_uritype_second.NaiveBayes.predictions.txt 
perl ../convertWekaPredictionsToCoNLL.pl textrazor_uritype_second.NaiveBayes.predictions.txt > textrazor_uritype_second.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r < textrazor_uritype_second.NaiveBayes.predictions.conll.txt >> ../MSMExperiments_30April_pt2.txt

echo " textrazor.NaiveBayes_uritype_third" >> ../MSMExperiments_30April_pt2.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t textrazor_uritype_third.train.arff -T textrazor_uritype_third.test.arff -p 1,2 > textrazor_uritype_third.NaiveBayes.predictions.txt          
perl ../convertWekaPredictionsToCoNLL.pl textrazor_uritype_third.NaiveBayes.predictions.txt > textrazor_uritype_third.NaiveBayes.predictions.conll.txt           
perl ../conlleval.pl -r < textrazor_uritype_third.NaiveBayes.predictions.conll.txt >> ../MSMExperiments_30April_pt2.txt

echo " textrazor.IB1" >> ../MSMExperiments_30April_pt2.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t textrazor.train.arff -T textrazor.test.arff -p 1,2 > textrazor.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl textrazor.IB1.predictions.txt > textrazor.IB1.predictions.conll.txt
perl ../conlleval.pl -r < textrazor.IB1.predictions.conll.txt >> ../MSMExperiments_30April_pt2.txt

echo " textrazor.IB1_nerdtype"  >> ../MSMExperiments_30April_pt2.txt           
java -Xmx4g weka.classifiers.lazy.IB1 -t textrazor_nerdtype.train.arff -T textrazor_nerdtype.test.arff -p 1,2 > textrazor_nerdtype.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl textrazor_nerdtype.IB1.predictions.txt > textrazor_nerdtype.IB1.predictions.conll.txt
perl ../conlleval.pl -r < textrazor_nerdtype.IB1.predictions.conll.txt >> ../MSMExperiments_30April_pt2.txt

echo " textrazor.IB1_uritype" >> ../MSMExperiments_30April_pt2.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t textrazor_uritype.train.arff -T textrazor_uritype.test.arff -p 1,2 > textrazor_uritype.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  textrazor_uritype.IB1.predictions.txt >  textrazor_uritype.IB1.predictions.conll.txt
perl ../conlleval.pl -r <  textrazor_uritype.IB1.predictions.conll.txt >> ../MSMExperiments_30April_pt2.txt

echo " textrazor.IB1_uritype_first" >> ../MSMExperiments_30April_pt2.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t textrazor_uritype_first.train.arff -T textrazor_uritype_first.test.arff -p 1,2 > textrazor_uritype_first.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  textrazor_uritype_first.IB1.predictions.txt >  textrazor_uritype_first.IB1.predictions.conll.txt
perl ../conlleval.pl -r <  textrazor_uritype_first.IB1.predictions.conll.txt >> ../MSMExperiments_30April_pt2.txt

echo " textrazor.IB1_uritype_second" >> ../MSMExperiments_30April_pt2.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t textrazor_uritype_second.train.arff -T textrazor_uritype_second.test.arff -p 1,2 > textrazor_uritype_second.IB1.predictions.txt 
perl ../convertWekaPredictionsToCoNLL.pl textrazor_uritype_second.IB1.predictions.txt > textrazor_uritype_second.IB1.predictions.conll.txt
perl ../conlleval.pl -r < textrazor_uritype_second.IB1.predictions.conll.txt >> ../MSMExperiments_30April_pt2.txt


echo " textrazor.IB1_uritype_third" >> ../MSMExperiments_30April_pt2.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t textrazor_uritype_third.train.arff -T textrazor_uritype_third.test.arff -p 1,2 > textrazor_uritype_third.IB1.predictions.txt          
perl ../convertWekaPredictionsToCoNLL.pl textrazor_uritype_third.IB1.predictions.txt > textrazor_uritype_third.IB1.predictions.conll.txt           
perl ../conlleval.pl -r < textrazor_uritype_third.IB1.predictions.conll.txt >> ../MSMExperiments_30April_pt2.txt

###########
# Zemanta 
###########
echo " zemanta.NaiveBayes" >> ../MSMExperiments_30April_pt2.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t zemanta.train.arff -T zemanta.test.arff -p 1,2 > zemanta.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl zemanta.NaiveBayes.predictions.txt > zemanta.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r < zemanta.NaiveBayes.predictions.conll.txt >> ../MSMExperiments_30April_pt2.txt

echo " zemanta.NaiveBayes_nerdtype" >> ../MSMExperiments_30April_pt2.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t zemanta_nerdtype.train.arff -T zemanta_nerdtype.test.arff -p 1,2 > zemanta_nerdtype.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl zemanta_nerdtype.NaiveBayes.predictions.txt > zemanta_nerdtype.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r < zemanta_nerdtype.NaiveBayes.predictions.conll.txt >> ../MSMExperiments_30April_pt2.txt

echo " zemanta.NaiveBayes_uritype" >> ../MSMExperiments_30April_pt2.txt
java -Xmx4g weka.classifiers.bayes.NaiveBayes -t zemanta_uritype.train.arff -T zemanta_uritype.test.arff -p 1,2 > zemanta_uritype.NaiveBayes.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  zemanta_uritype.NaiveBayes.predictions.txt >  zemanta_uritype.NaiveBayes.predictions.conll.txt
perl ../conlleval.pl -r <  zemanta_uritype.NaiveBayes.predictions.conll.txt >> ../MSMExperiments_30April_pt2.txt

echo " zemanta.IB1" >> ../MSMExperiments_30April_pt2.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t zemanta.train.arff -T zemanta.test.arff -p 1,2 > zemanta.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl zemanta.IB1.predictions.txt > zemanta.IB1.predictions.conll.txt
perl ../conlleval.pl -r < zemanta.IB1.predictions.conll.txt >> ../MSMExperiments_30April_pt2.txt

echo " zemanta.IB1_nerdtype"  >> ../MSMExperiments_30April_pt2.txt           
java -Xmx4g weka.classifiers.lazy.IB1 -t zemanta_nerdtype.train.arff -T zemanta_nerdtype.test.arff -p 1,2 > zemanta_nerdtype.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl zemanta_nerdtype.IB1.predictions.txt > zemanta_nerdtype.IB1.predictions.conll.txt
perl ../conlleval.pl -r < zemanta_nerdtype.IB1.predictions.conll.txt >> ../MSMExperiments_30April_pt2.txt

echo " zemanta.IB1_uritype" >> ../MSMExperiments_30April_pt2.txt
java -Xmx4g weka.classifiers.lazy.IB1 -t zemanta_uritype.train.arff -T zemanta_uritype.test.arff -p 1,2 > zemanta_uritype.IB1.predictions.txt
perl ../convertWekaPredictionsToCoNLL.pl  zemanta_uritype.IB1.predictions.txt >  zemanta_uritype.IB1.predictions.conll.txt
perl ../conlleval.pl -r <  zemanta_uritype.IB1.predictions.conll.txt >> ../MSMExperiments_30April_pt2.txt


