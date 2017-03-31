cat hosts.txt| tr '\n' ',' > hosts1.txt

{ printf "nodegroups:\n nodes: L@" ; cat hosts1.txt ; } > /etc/salt/master.d/nodegroups.conf

rm out out1 hosts_with_good_ips

salt -N nodes cmd.run 'cat /home/ip' > out

# cat out|grep -B 1 '1.1.1.1' > out1

cat out| sed 's/minion1/minion1.intuit.net/g'|sed 's/minion2/minion2.intuit.net/g' > out1
# sed -e 's/minion2/minion2.intuit.net/g' out1 > out2

cat out1 |grep -B 1 '1.1.1.1'| grep intuit.net|sed 's/://g' >> hosts_with_good_ips
cat out1 |grep -B 1 '2.2.2.2'| grep intuit.net|sed 's/://g' >> hosts_with_good_ips
