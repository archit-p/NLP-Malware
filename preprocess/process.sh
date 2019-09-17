#!/bin/sh
N=3


python3 process.py -f ../DataSet/Benign/ -x b
python3 process.py -f ../DataSet/Malware/ -x m

mkdir ../DataSet/test/

cp ../DataSet/Benign/b_Gmail.pcap ../DataSet/test/
cp ../DataSet/Benign/b_BitTorrent.pcap ../DataSet/test/
cp ../DataSet/Benign/b_MySQL.pcap ../DataSet/test/
cp ../DataSet/Malware/m_Zeus.pcap ../DataSet/test/

python3 pcap-to-ngrams.py -f ../DataSet/test/ -n $N

echo "ngram,test\n" > ../DataSet/test/test.csv
cat ../DataSet/test/*ngram.csv >> ../DataSet/test/test.csv
