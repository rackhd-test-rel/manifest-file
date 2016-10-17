repos=(on-core on-http on-tftp on-dhcp-proxy on-syslog on-skupack on-tasks on-taskgraph )
branch=$1


echo {
echo -e "\t \"build-name\": \"onrack-devel\","
echo -e "\t \"build-requirements\": \","
echo -e "\t \"downstream-jobs\": [],"
echo -e "\t \"repositories\": ["


for k in ${repos[@]} ;do
#    rm ${k} -rf
#    git clone https://github.com/RackHD/${k}.git
    cd ${k}
    hash=$(git rev-parse HEAD)
    echo -e  "\t{"
    echo -e "\t\t\"branch\": \"$branch\","
    echo -e "\t\t\"commit-id\": \"$hash\","
    echo -e "\t\t\"repository\": \"https://github.com/RackHD/$k.git\" "
    echo -e "\t},"
    cd ..
done

echo -e "\t]"
echo }



