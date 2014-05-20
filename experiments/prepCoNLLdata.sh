### CoNLL data prep

cat alchemyapi.train.csv alchemyapi.test.csv > alchemyapi.full_for_arff_header.csv
cat lupedia.train.csv lupedia.test.csv > lupedia.full_for_arff_header.csv 
cat opencalais.train.csv opencalais.test.csv > opencalais.full_for_arff_header.csv 
cat alchemyapi_nerdtype.test.csv alchemyapi_nerdtype.train.csv > alchemyapi_nerdtype.full_for_arff_header.csv
cat alchemyapi_uritype.test.csv alchemyapi_uritype.train.csv > alchemyapi_uritype.full_for_arff_header.csv
cat alchemyapi_uritype_first.test.csv alchemyapi_uritype_first.train.csv > alchemyapi_uritype_first.full_for_arff_header.csv
cat datatxt.test.csv datatxt.train.csv > datatxt.full_for_arff_header.csv 
cat datatxt_nerdtype.test.csv datatxt_nerdtype.train.csv > datatxt_nerdtype.full_for_arff_header.csv
cat datatxt_uritype.test.csv datatxt_uritype.train.csv > datatxt_uritype.full_for_arff_header.csv
cat datatxt_uritype_first.test.csv datatxt_uritype_first.train.csv > datatxt_uritype_first.full_for_arff_header.csv
cat datatxt_uritype_second.test.csv datatxt_uritype_second.train.csv > datatxt_uritype_second.full_for_arff_header.csv
cat datatxt_uritype_third.test.csv datatxt_uritype_third.train.csv > datatxt_uritype_third.full_for_arff_header.csv
cat dbspotlight.test.csv dbspotlight.train.csv > dbspotlight.full_for_arff_header.csv
cat dbspotlight_nerdtype.test.csv dbspotlight_nerdtype.train.csv > dbspotlight_nerdtype.full_for_arff_header.csv
cat dbspotlight_uritype.test.csv dbspotlight_uritype.train.csv >  dbspotlight_uritype.full_for_arff_header.csv
cat dbspotlight_uritype_first.test.csv dbspotlight_uritype_first.train.csv > dbspotlight_uritype_first.full_for_arff_header.csv
cat dbspotlight_uritype_second.test.csv dbspotlight_uritype_second.train.csv > dbspotlight_uritype_second.full_for_arff_header.csv
cat dbspotlight_uritype_third.test.csv dbspotlight_uritype_third.train.csv > dbspotlight_uritype_third.full_for_arff_header.csv
cat lupedia.test.csv lupedia.train.csv > lupedia.full_for_arff_header.csv
cat lupedia_nerdtype.test.csv lupedia_nerdtype.train.csv > lupedia_nerdtype.full_for_arff_header.csv
cat lupedia_uritype.test.csv lupedia_uritype.train.csv > lupedia_uritype.full_for_arff_header.csv
cat lupedia_uritype_first.test.csv lupedia_uritype_first.train.csv > lupedia_uritype_first.full_for_arff_header.csv
cat lupedia_uritype_second.test.csv lupedia_uritype_second.train.csv > lupedia_uritype_second.full_for_arff_header.csv
cat lupedia_uritype_third.test.csv lupedia_uritype_third.train.csv > lupedia_uritype_third.full_for_arff_header.csv
cat opencalais.test.csv opencalais.train.csv > opencalais.full_for_arff_header.csv
cat opencalais_nerdtype.test.csv opencalais_nerdtype.train.csv > opencalais_nerdtype.full_for_arff_header.csv
cat opencalais_uritype.test.csv opencalais_uritype.train.csv > opencalais_uritype.full_for_arff_header.csv 
cat opencalais_uritype_first.test.csv opencalais_uritype_first.train.csv > opencalais_uritype_first.full_for_arff_header.csv
cat textrazor.test.csv textrazor.train.csv > textrazor.full_for_arff_header.csv
cat textrazor_nerdtype.test.csv textrazor_nerdtype.train.csv > textrazor_nerdtype.full_for_arff_header.csv
cat textrazor_uritype.test.csv textrazor_uritype.train.csv > textrazor_uritype.full_for_arff_header.csv
cat textrazor_uritype_first.test.csv textrazor_uritype_first.train.csv > textrazor_uritype_first.full_for_arff_header.csv
cat textrazor_uritype_second.test.csv textrazor_uritype_second.train.csv > textrazor_uritype_second.full_for_arff_header.csv
cat textrazor_uritype_third.test.csv textrazor_uritype_third.train.csv > textrazor_uritype_third.full_for_arff_header.csv
cat zemanta.test.csv zemanta.train.csv > zemanta.full_for_arff_header.csv
cat zemanta_nerdtype.test.csv zemanta_nerdtype.train.csv > zemanta_nerdtype.full_for_arff_header.csv
cat zemanta_uritype.test.csv zemanta_uritype.train.csv > zemanta_uritype.full_for_arff_header.csv

### 

export CLASSPATH=/Applications/weka-3-6-10/weka.jar

## Generate the complete header for Weka: 
java weka.core.converters.CSVLoader alchemyapi.full_for_arff_header.csv > alchemyapi.full_for_arff_header.arff 
java weka.core.converters.CSVLoader opencalais.full_for_arff_header.csv > opencalais.full_for_arff_header.arff
java weka.core.converters.CSVLoader datatxt_uritype_third.full_for_arff_header.csv > datatxt_uritype_third.full_for_arff_header.arff
java weka.core.converters.CSVLoader datatxt_uritype_second.full_for_arff_header.csv > datatxt_uritype_second.full_for_arff_header.arff
java weka.core.converters.CSVLoader datatxt_uritype_first.full_for_arff_header.csv > datatxt_uritype_first.full_for_arff_header.arff
java weka.core.converters.CSVLoader datatxt_uritype.full_for_arff_header.csv > datatxt_uritype.full_for_arff_header.arff
java weka.core.converters.CSVLoader datatxt_nerdtype.full_for_arff_header.csv > datatxt_nerdtype.full_for_arff_header.arff
java weka.core.converters.CSVLoader datatxt.full_for_arff_header.csv > datatxt.full_for_arff_header.arff
java weka.core.converters.CSVLoader alchemyapi_uritype_first.full_for_arff_header.csv > alchemyapi_uritype_first.full_for_arff_header.arff
java weka.core.converters.CSVLoader alchemyapi_uritype.full_for_arff_header.csv > alchemyapi_uritype.full_for_arff_header.arff
java weka.core.converters.CSVLoader alchemyapi_nerdtype.full_for_arff_header.csv > alchemyapi_nerdtype.full_for_arff_header.arff
java weka.core.converters.CSVLoader dbspotlight_uritype_third.full_for_arff_header.csv > dbspotlight_uritype_third.full_for_arff_header.arff
java weka.core.converters.CSVLoader dbspotlight_uritype_second.full_for_arff_header.csv > dbspotlight_uritype_second.full_for_arff_header.arff
java weka.core.converters.CSVLoader dbspotlight_uritype_first.full_for_arff_header.csv > dbspotlight_uritype_first.full_for_arff_header.arff
java weka.core.converters.CSVLoader dbspotlight_uritype.full_for_arff_header.csv > dbspotlight_uritype.full_for_arff_header.arff
java weka.core.converters.CSVLoader dbspotlight_nerdtype.full_for_arff_header.csv > dbspotlight_nerdtype.full_for_arff_header.arff
java weka.core.converters.CSVLoader dbspotlight.full_for_arff_header.csv > dbspotlight.full_for_arff_header.arff
java weka.core.converters.CSVLoader lupedia_uritype_third.full_for_arff_header.csv > lupedia_uritype_third.full_for_arff_header.arff
java weka.core.converters.CSVLoader lupedia_uritype_second.full_for_arff_header.csv > lupedia_uritype_second.full_for_arff_header.arff
java weka.core.converters.CSVLoader lupedia_uritype_first.full_for_arff_header.csv > lupedia_uritype_first.full_for_arff_header.arff
java weka.core.converters.CSVLoader lupedia_nerdtype.full_for_arff_header.csv > lupedia_nerdtype.full_for_arff_header.arff
java weka.core.converters.CSVLoader lupedia.full_for_arff_header.csv > lupedia.full_for_arff_header.arff
java weka.core.converters.CSVLoader lupedia_uritype.full_for_arff_header.csv > lupedia_uritype.full_for_arff_header.arff
java weka.core.converters.CSVLoader zemanta_uritype.full_for_arff_header.csv > zemanta_uritype.full_for_arff_header.arff
java weka.core.converters.CSVLoader zemanta_nerdtype.full_for_arff_header.csv > zemanta_nerdtype.full_for_arff_header.arff
java weka.core.converters.CSVLoader zemanta.full_for_arff_header.csv > zemanta.full_for_arff_header.arff
java weka.core.converters.CSVLoader textrazor_uritype_third.full_for_arff_header.csv > textrazor_uritype_third.full_for_arff_header.arff
java weka.core.converters.CSVLoader textrazor_uritype_second.full_for_arff_header.csv > textrazor_uritype_second.full_for_arff_header.arff
java weka.core.converters.CSVLoader textrazor_uritype_first.full_for_arff_header.csv > textrazor_uritype_first.full_for_arff_header.arff
java weka.core.converters.CSVLoader textrazor_uritype.full_for_arff_header.csv > textrazor_uritype.full_for_arff_header.arff
java weka.core.converters.CSVLoader textrazor_nerdtype.full_for_arff_header.csv > textrazor_nerdtype.full_for_arff_header.arff
java weka.core.converters.CSVLoader textrazor.full_for_arff_header.csv > textrazor.full_for_arff_header.arff
java weka.core.converters.CSVLoader opencalais_uritype_first.full_for_arff_header.csv > opencalais_uritype_first.full_for_arff_header.arff
java weka.core.converters.CSVLoader opencalais_uritype.full_for_arff_header.csv > opencalais_uritype.full_for_arff_header.arff
java weka.core.converters.CSVLoader opencalais_nerdtype.full_for_arff_header.csv > opencalais_nerdtype.full_for_arff_header.arff
java weka.core.converters.CSVLoader opencalais.full_for_arff_header.csv > opencalais.full_for_arff_header.arff
 
 
## get header from full arff file: 
head -n8 < lupedia_uritype_third.full_for_arff_header.arff > lupedia_uritype_third.arff_header.txt
head -n8 < lupedia_uritype_second.full_for_arff_header.arff > lupedia_uritype_second.arff_header.txt
head -n8 < lupedia_uritype_first.full_for_arff_header.arff > lupedia_uritype_first.arff_header.txt
head -n8 < lupedia.full_for_arff_header.arff > lupedia.arff_header.txt
head -n8 < lupedia_nerdtype.full_for_arff_header.arff >  lupedia_nerdtype.arff_header.txt
head -n8 < zemanta_uritype.full_for_arff_header.arff > zemanta_uritype.arff_header.txt
head -n8 < zemanta_nerdtype.full_for_arff_header.arff > zemanta_nerdtype.arff_header.txt
head -n8 < zemanta.full_for_arff_header.arff > zemanta.arff_header.txt
head -n8 < textrazor_uritype_third.full_for_arff_header.arff > textrazor_uritype_third.arff_header.txt
head -n8 < textrazor_uritype_second.full_for_arff_header.arff > textrazor_uritype_second.arff_header.txt
head -n8 < textrazor_uritype_first.full_for_arff_header.arff > textrazor_uritype_first.arff_header.txt
head -n8 < textrazor.full_for_arff_header.arff > textrazor.arff_header.txt
head -n8 < textrazor_nerdtype.full_for_arff_header.arff > textrazor_nerdtype.arff_header.txt
head -n8 < textrazor_uritype.full_for_arff_header.arff > textrazor_uritype.arff_header.txt
head -n8 < opencalais_uritype_first.full_for_arff_header.arff > opencalais_uritype_first.arff_header.txt
head -n8 < opencalais_uritype.full_for_arff_header.arff >  opencalais_uritype.arff_header.txt
head -n8 < opencalais_nerdtype.full_for_arff_header.arff > opencalais_nerdtype.arff_header.txt
head -n8 < opencalais.full_for_arff_header.arff >  opencalais.arff_header.txt
head -n8 < alchemyapi.full_for_arff_header.arff > alchemyapi.arff_header.txt
head -n8 < opencalais.full_for_arff_header.arff > opencalais.arff_header.txt
head -n8 < datatxt.full_for_arff_header.arff > datatxt.arff_header.txt
head -n8 < datatxt_uritype_third.full_for_arff_header.arff > datatxt_uritype_third.arff_header.txt
head -n8 < datatxt_uritype_second.full_for_arff_header.arff > datatxt_uritype_second.arff_header.txt
head -n8 < datatxt_uritype_first.full_for_arff_header.arff > datatxt_uritype_first.arff_header.txt
head -n8 < alchemyapi_uritype_first.full_for_arff_header.arff > alchemyapi_uritype_first.arff_header.txt
head -n8 < datatxt_uritype.full_for_arff_header.arff > datatxt_uritype.arff_header.txt
head -n8 < datatxt_nerdtype.full_for_arff_header.arff > datatxt_nerdtype.arff_header.txt
head -n8 < alchemyapi_uritype.full_for_arff_header.arff > alchemyapi_uritype.arff_header.txt
head -n8 < alchemyapi_nerdtype.full_for_arff_header.arff > alchemyapi_nerdtype.arff_header.txt
head -n8 < dbspotlight_uritype_third.full_for_arff_header.arff > dbspotlight_uritype_third.arff_header.txt
head -n8 < dbspotlight_uritype_second.full_for_arff_header.arff > dbspotlight_uritype_second.arff_header.txt
head -n8 < dbspotlight_uritype.full_for_arff_header.arff > dbspotlight_uritype.arff_header.txt
head -n8 < dbspotlight_nerdtype.full_for_arff_header.arff > dbspotlight_nerdtype.arff_header.txt
head -n8 < dbspotlight.full_for_arff_header.arff > dbspotlight.arff_header.txt
head -n8 < dbspotlight_uritype_first.full_for_arff_header.arff > dbspotlight_uritype_first.arff_header.txt

#generate arff files from the test and training files without header (data starts at line 8) 
java weka.core.converters.CSVLoader alchemyapi.test.csv | sed -n '8,$p' > alchemyapi.test.tmp.arff
java weka.core.converters.CSVLoader alchemyapi.train.csv | sed -n '8,$p' >alchemyapi.train.tmp.arff
java weka.core.converters.CSVLoader opencalais.test.csv | sed -n '8,$p' > opencalais.test.tmp.arff
java weka.core.converters.CSVLoader opencalais.train.csv | sed -n '8,$p' > opencalais.train.tmp.arff

java weka.core.converters.CSVLoader alchemyapi_nerdtype.train.csv| sed -n '8,$p' > alchemyapi_nerdtype.train.tmp.arff
java weka.core.converters.CSVLoader alchemyapi_uritype.train.csv| sed -n '8,$p' > alchemyapi_uritype.train.tmp.arff
java weka.core.converters.CSVLoader alchemyapi_uritype_first.train.csv| sed -n '8,$p' > alchemyapi_uritype_first.train.tmp.arff 
java weka.core.converters.CSVLoader datatxt.train.csv| sed -n '8,$p' > datatxt.train.tmp.arff
java weka.core.converters.CSVLoader datatxt_nerdtype.train.csv| sed -n '8,$p' > datatxt_nerdtype.train.tmp.arff
java weka.core.converters.CSVLoader datatxt_uritype.train.csv| sed -n '8,$p' > datatxt_uritype.train.tmp.arff
java weka.core.converters.CSVLoader datatxt_uritype_first.train.csv| sed -n '8,$p' > datatxt_uritype_first.train.tmp.arff
java weka.core.converters.CSVLoader datatxt_uritype_second.train.csv| sed -n '8,$p' > datatxt_uritype_second.train.tmp.arff
java weka.core.converters.CSVLoader datatxt_uritype_third.train.csv| sed -n '8,$p' > datatxt_uritype_third.train.tmp.arff
java weka.core.converters.CSVLoader dbspotlight.train.csv| sed -n '8,$p' > dbspotlight.train.tmp.arff
java weka.core.converters.CSVLoader dbspotlight_nerdtype.train.csv| sed -n '8,$p' > dbspotlight_nerdtype.train.tmp.arff
java weka.core.converters.CSVLoader dbspotlight_uritype.train.csv| sed -n '8,$p' > dbspotlight_uritype.train.tmp.arff
java weka.core.converters.CSVLoader dbspotlight_uritype_first.train.csv| sed -n '8,$p' > dbspotlight_uritype_first.train.tmp.arff
java weka.core.converters.CSVLoader dbspotlight_uritype_second.train.csv| sed -n '8,$p' > dbspotlight_uritype_second.train.tmp.arff
java weka.core.converters.CSVLoader dbspotlight_uritype_third.train.csv| sed -n '8,$p' > dbspotlight_uritype_third.train.tmp.arff
java weka.core.converters.CSVLoader lupedia.train.csv| sed -n '8,$p' > lupedia.train.tmp.arff
java weka.core.converters.CSVLoader lupedia_nerdtype.train.csv| sed -n '8,$p' > lupedia_nerdtype.train.tmp.arff
java weka.core.converters.CSVLoader lupedia_uritype.train.csv| sed -n '8,$p' > lupedia_uritype.train.tmp.arff
java weka.core.converters.CSVLoader lupedia_uritype_first.train.csv| sed -n '8,$p' > lupedia_uritype_first.train.tmp.arff
java weka.core.converters.CSVLoader lupedia_uritype_second.train.csv| sed -n '8,$p' > lupedia_uritype_second.train.tmp.arff
java weka.core.converters.CSVLoader lupedia_uritype_third.train.csv| sed -n '8,$p' > lupedia_uritype_third.train.tmp.arff
java weka.core.converters.CSVLoader opencalais_nerdtype.train.csv| sed -n '8,$p' > opencalais_nerdtype.train.tmp.arff
java weka.core.converters.CSVLoader opencalais_uritype.train.csv| sed -n '8,$p' > opencalais_uritype.train.tmp.arff
java weka.core.converters.CSVLoader opencalais_uritype_first.train.csv| sed -n '8,$p' > opencalais_uritype_first.train.tmp.arff
java weka.core.converters.CSVLoader textrazor.train.csv| sed -n '8,$p' > textrazor.train.tmp.arff
java weka.core.converters.CSVLoader textrazor_nerdtype.train.csv| sed -n '8,$p' > textrazor_nerdtype.train.tmp.arff
java weka.core.converters.CSVLoader textrazor_uritype.train.csv| sed -n '8,$p' >  textrazor_uritype.train.tmp.arff
java weka.core.converters.CSVLoader textrazor_uritype_first.train.csv| sed -n '8,$p' > textrazor_uritype_first.train.tmp.arff
java weka.core.converters.CSVLoader textrazor_uritype_second.train.csv| sed -n '8,$p' > textrazor_uritype_second.train.tmp.arff
java weka.core.converters.CSVLoader textrazor_uritype_third.train.csv| sed -n '8,$p' > textrazor_uritype_third.train.tmp.arff
java weka.core.converters.CSVLoader zemanta.train.csv| sed -n '8,$p' > zemanta.train.tmp.arff
java weka.core.converters.CSVLoader zemanta_nerdtype.train.csv| sed -n '8,$p' > zemanta_nerdtype.train.tmp.arff
java weka.core.converters.CSVLoader zemanta_uritype.train.csv| sed -n '8,$p' > zemanta_uritype.train.tmp.arff
java weka.core.converters.CSVLoader alchemyapi_nerdtype.test.csv | sed -n '8,$p' > alchemyapi_nerdtype.test.tmp.arff
java weka.core.converters.CSVLoader alchemyapi_uritype.test.csv | sed -n '8,$p' > alchemyapi_uritype.test.tmp.arff
java weka.core.converters.CSVLoader alchemyapi_uritype_first.test.csv | sed -n '8,$p' > alchemyapi_uritype_first.test.tmp.arff
java weka.core.converters.CSVLoader datatxt.test.csv | sed -n '8,$p' > datatxt.test.tmp.arff
java weka.core.converters.CSVLoader datatxt_nerdtype.test.csv | sed -n '8,$p' > datatxt_nerdtype.test.tmp.arff
java weka.core.converters.CSVLoader datatxt_uritype.test.csv | sed -n '8,$p' > datatxt_uritype.test.tmp.arff
java weka.core.converters.CSVLoader datatxt_uritype_first.test.csv | sed -n '8,$p' > datatxt_uritype_first.test.tmp.arff
java weka.core.converters.CSVLoader datatxt_uritype_second.test.csv | sed -n '8,$p' > datatxt_uritype_second.test.tmp.arff
java weka.core.converters.CSVLoader datatxt_uritype_third.test.csv | sed -n '8,$p' > datatxt_uritype_third.test.tmp.arff
java weka.core.converters.CSVLoader dbpedia_uritype_first.test.csv | sed -n '8,$p' > dbpedia_uritype_first.test.tmp.arff
java weka.core.converters.CSVLoader dbpedia_uritype_second.test.csv | sed -n '8,$p' > dbpedia_uritype_second.test.tmp.arff
java weka.core.converters.CSVLoader dbpedia_uritype_third.test.csv | sed -n '8,$p' > dbpedia_uritype_third.test.tmp.arff
java weka.core.converters.CSVLoader dbspotlight.test.csv | sed -n '8,$p' > dbspotlight.test.tmp.arff
java weka.core.converters.CSVLoader dbspotlight_nerdtype.test.csv | sed -n '8,$p' > dbspotlight_nerdtype.test.tmp.arff
java weka.core.converters.CSVLoader dbspotlight_uritype.test.csv | sed -n '8,$p' > dbspotlight_uritype.test.tmp.arff
java weka.core.converters.CSVLoader dbspotlight_uritype_first.test.csv | sed -n '8,$p' > dbspotlight_uritype_first.test.tmp.arff
java weka.core.converters.CSVLoader dbspotlight_uritype_second.test.csv | sed -n '8,$p' > dbspotlight_uritype_second.test.tmp.arff
java weka.core.converters.CSVLoader dbspotlight_uritype_third.test.csv | sed -n '8,$p' > dbspotlight_uritype_third.test.tmp.arff
java weka.core.converters.CSVLoader lupedia.test.csv | sed -n '8,$p' > lupedia.test.tmp.arff
java weka.core.converters.CSVLoader lupedia_nerdtype.test.csv | sed -n '8,$p' > lupedia_nerdtype.test.tmp.arff
java weka.core.converters.CSVLoader lupedia_uritype.test.csv | sed -n '8,$p' > lupedia_uritype.test.tmp.arff
java weka.core.converters.CSVLoader lupedia_uritype_first.test.csv | sed -n '8,$p' > lupedia_uritype_first.test.tmp.arff
java weka.core.converters.CSVLoader lupedia_uritype_second.test.csv | sed -n '8,$p' > lupedia_uritype_second.test.tmp.arff
java weka.core.converters.CSVLoader lupedia_uritype_third.test.csv | sed -n '8,$p' > lupedia_uritype_third.test.tmp.arff
java weka.core.converters.CSVLoader opencalais.test.csv | sed -n '8,$p' > opencalais.test.tmp.arff
java weka.core.converters.CSVLoader opencalais_nerdtype.test.csv | sed -n '8,$p' > opencalais_nerdtype.test.tmp.arff
java weka.core.converters.CSVLoader opencalais_uritype.test.csv | sed -n '8,$p' > opencalais_uritype.test.tmp.arff
java weka.core.converters.CSVLoader opencalais_uritype_first.test.csv | sed -n '8,$p' > opencalais_uritype_first.test.tmp.arff
java weka.core.converters.CSVLoader textrazor.test.csv | sed -n '8,$p' > textrazor.test.tmp.arff
java weka.core.converters.CSVLoader textrazor_nerdtype.test.csv | sed -n '8,$p' > textrazor_nerdtype.test.tmp.arff
java weka.core.converters.CSVLoader textrazor_uritype.test.csv | sed -n '8,$p' > textrazor_uritype.test.tmp.arff
java weka.core.converters.CSVLoader textrazor_uritype_first.test.csv | sed -n '8,$p' > textrazor_uritype_first.test.tmp.arff
java weka.core.converters.CSVLoader textrazor_uritype_second.test.csv | sed -n '8,$p' > textrazor_uritype_second.test.tmp.arff
java weka.core.converters.CSVLoader textrazor_uritype_third.test.csv | sed -n '8,$p' > textrazor_uritype_third.test.tmp.arff
java weka.core.converters.CSVLoader zemanta.test.csv | sed -n '8,$p' > zemanta.test.tmp.arff
java weka.core.converters.CSVLoader zemanta_nerdtype.test.csv | sed -n '8,$p' > zemanta_nerdtype.test.tmp.arff
java weka.core.converters.CSVLoader zemanta_uritype.test.csv | sed -n '8,$p' > zemanta_uritype.test.tmp.arff


# Copy the header from the full arff file over to the test file. 
cat  alchemyapi.arff_header.txt alchemyapi.test.tmp.arff > alchemyapi.test.arff
cat  alchemyapi.arff_header.txt alchemyapi.train.tmp.arff > alchemyapi.train.arff
cat opencalais.arff_header.txt opencalais.test.tmp.arff > opencalais.test.arff
cat opencalais.arff_header.txt opencalais.train.tmp.arff > opencalais.train.arff

cat alchemyapi_nerdtype.arff_header.txt alchemyapi_nerdtype.train.tmp.arff > alchemyapi_nerdtype.train.arff
cat alchemyapi_nerdtype.arff_header.txt alchemyapi_nerdtype.test.tmp.arff > alchemyapi_nerdtype.test.arff

cat alchemyapi_uritype.arff_header.txt alchemyapi_uritype.train.tmp.arff > alchemyapi_uritype.train.arff
cat alchemyapi_uritype.arff_header.txt alchemyapi_uritype.test.tmp.arff > alchemyapi_uritype.test.arff

cat alchemyapi_uritype_first.arff_header.txt alchemyapi_uritype_first.test.tmp.arff > alchemyapi_uritype_first.test.arff
cat alchemyapi_uritype_first.arff_header.txt alchemyapi_uritype_first.train.tmp.arff > alchemyapi_uritype_first.train.arff

cat datatxt.arff_header.txt datatxt.test.tmp.arff > datatxt.test.arff
cat datatxt.arff_header.txt datatxt.train.tmp.arff > datatxt.train.arff

cat datatxt_nerdtype.arff_header.txt datatxt_nerdtype.test.tmp.arff > datatxt_nerdtype.test.arff
cat datatxt_nerdtype.arff_header.txt datatxt_nerdtype.train.tmp.arff > datatxt_nerdtype.train.arff

cat datatxt_uritype.arff_header.txt datatxt_uritype.test.tmp.arff > datatxt_uritype.test.arff
cat datatxt_uritype.arff_header.txt datatxt_uritype.train.tmp.arff > datatxt_uritype.train.arff

cat datatxt_uritype_first.arff_header.txt datatxt_uritype_first.test.tmp.arff > datatxt_uritype_first.test.arff
cat datatxt_uritype_first.arff_header.txt datatxt_uritype_first.train.tmp.arff > datatxt_uritype_first.train.arff

cat datatxt_uritype_second.arff_header.txt datatxt_uritype_second.test.tmp.arff > datatxt_uritype_second.test.arff
cat datatxt_uritype_second.arff_header.txt datatxt_uritype_second.train.tmp.arff > datatxt_uritype_second.train.arff

cat datatxt_uritype_third.arff_header.txt datatxt_uritype_third.test.tmp.arff > datatxt_uritype_third.test.arff
cat datatxt_uritype_third.arff_header.txt datatxt_uritype_third.train.tmp.arff > datatxt_uritype_third.train.arff

cat dbspotlight.arff_header.txt dbspotlight.test.tmp.arff > dbspotlight.test.arff
cat dbspotlight.arff_header.txt dbspotlight.train.tmp.arff > dbspotlight.train.arff

cat dbspotlight_nerdtype.arff_header.txt dbspotlight_nerdtype.test.tmp.arff > dbspotlight_nerdtype.test.arff
cat dbspotlight_nerdtype.arff_header.txt dbspotlight_nerdtype.train.tmp.arff > dbspotlight_nerdtype.train.arff
 
cat dbspotlight_uritype.arff_header.txt dbspotlight_uritype.test.tmp.arff > dbspotlight_uritype.test.arff
cat dbspotlight_uritype.arff_header.txt dbspotlight_uritype.train.tmp.arff > dbspotlight_uritype.train.arff

cat dbspotlight_uritype_first.arff_header.txt dbspotlight_uritype_first.test.tmp.arff > dbspotlight_uritype_first.test.arff
cat dbspotlight_uritype_first.arff_header.txt dbspotlight_uritype_first.train.tmp.arff > dbspotlight_uritype_first.train.arff

cat dbspotlight_uritype_second.arff_header.txt  dbspotlight_uritype_second.test.tmp.arff >  dbspotlight_uritype_second.test.arff
cat dbspotlight_uritype_second.arff_header.txt  dbspotlight_uritype_second.train.tmp.arff >  dbspotlight_uritype_second.train.arff

cat dbspotlight_uritype_third.arff_header.txt dbspotlight_uritype_third.test.tmp.arff > dbspotlight_uritype_third.test.arff
cat dbspotlight_uritype_third.arff_header.txt dbspotlight_uritype_third.train.tmp.arff > dbspotlight_uritype_third.train.arff

cat lupedia.arff_header.txt lupedia.test.tmp.arff > lupedia.test.arff
cat lupedia.arff_header.txt lupedia.train.tmp.arff > lupedia.train.arff

cat lupedia_nerdtype.arff_header.txt lupedia_nerdtype.test.tmp.arff > lupedia_nerdtype.test.arff
cat lupedia_nerdtype.arff_header.txt lupedia_nerdtype.train.tmp.arff > lupedia_nerdtype.train.arff

cat lupedia_uritype_first.arff_header.txt lupedia_uritype_first.test.tmp.arff > lupedia_uritype_first.test.arff
cat lupedia_uritype_first.arff_header.txt lupedia_uritype_first.train.tmp.arff >lupedia_uritype_first.train.arff


cat lupedia_uritype_second.arff_header.txt lupedia_uritype_second.test.tmp.arff > lupedia_uritype_second.test.arff
cat lupedia_uritype_second.arff_header.txt lupedia_uritype_second.train.tmp.arff >lupedia_uritype_second.train.arff

cat lupedia_uritype_third.arff_header.txt lupedia_uritype_third.test.tmp.arff > lupedia_uritype_third.test.arff
cat lupedia_uritype_third.arff_header.txt lupedia_uritype_third.train.tmp.arff > lupedia_uritype_third.train.arff

cat opencalais_nerdtype.arff_header.txt opencalais_nerdtype.test.tmp.arff > opencalais_nerdtype.test.arff
cat opencalais_nerdtype.arff_header.txt opencalais_nerdtype.train.tmp.arff > opencalais_nerdtype.train.arff

cat opencalais_uritype_first.arff_header.txt opencalais_uritype_first.test.tmp.arff > opencalais_uritype_first.test.arff
cat opencalais_uritype_first.arff_header.txt opencalais_uritype_first.train.tmp.arff > opencalais_uritype_first.train.arff

cat textrazor.arff_header.txt  textrazor.test.tmp.arff >  textrazor.test.arff
cat textrazor.arff_header.txt  textrazor.train.tmp.arff >  textrazor.train.arff

cat textrazor_uritype_first.arff_header.txt textrazor_uritype_first.test.tmp.arff > textrazor_uritype_first.test.arff
cat textrazor_uritype_first.arff_header.txt textrazor_uritype_first.train.tmp.arff >textrazor_uritype_first.train.arff

cat textrazor_uritype_second.arff_header.txt textrazor_uritype_second.test.tmp.arff > textrazor_uritype_second.test.arff
cat textrazor_uritype_second.arff_header.txt textrazor_uritype_second.train.tmp.arff > textrazor_uritype_second.train.arff

cat textrazor_uritype_third.arff_header.txt textrazor_uritype_third.test.tmp.arff > textrazor_uritype_third.test.arff
cat textrazor_uritype_third.arff_header.txt textrazor_uritype_third.train.tmp.arff > textrazor_uritype_third.train.arff

cat textrazor_uritype.arff_header.txt textrazor_uritype.test.tmp.arff > textrazor_uritype.test.arff
cat textrazor_uritype.arff_header.txt textrazor_uritype.train.tmp.arff >textrazor_uritype.train.arff

cat textrazor_nerdtype.arff_header.txt textrazor_nerdtype.test.tmp.arff > textrazor_nerdtype.test.arff
cat textrazor_nerdtype.arff_header.txt textrazor_nerdtype.train.tmp.arff >textrazor_nerdtype.train.arff


cat zemanta.arff_header.txt zemanta.test.tmp.arff > zemanta.test.arff
cat zemanta.arff_header.txt zemanta.train.tmp.arff > zemanta.train.arff

cat zemanta_nerdtype.arff_header.txt zemanta_nerdtype.test.tmp.arff > zemanta_nerdtype.test.arff
cat zemanta_nerdtype.arff_header.txt zemanta_nerdtype.train.tmp.arff > zemanta_nerdtype.train.arff

cat zemanta_uritype.arff_header.txt zemanta_uritype.test.tmp.arff > zemanta_uritype.test.arff
cat zemanta_uritype.arff_header.txt zemanta_uritype.train.tmp.arff > zemanta_uritype.train.arff


 