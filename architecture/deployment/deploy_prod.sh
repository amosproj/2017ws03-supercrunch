#!bin/bash
set -e
tar -zcvf amos-ws18-proj3.tar.gz repo/ #TODO change cd to repo
wget "https://www.dropbox.com/s/4t137xjyadtsgci/AMOS_EC2_KEY.pem"
echo password | sudo -S chmod 400 AMOS_EC2_KEY.pem
scp -i AMOS_EC2_KEY.pem -o BatchMode=yes -o StrictHostKeyChecking=no amos-ws18-proj3.tar.gz ubuntu@18.216.122.218:/home/ubuntu
rm amos-ws18-proj3.tar.gz
ssh -i AMOS_EC2_KEY.pem -o BatchMode=yes -o StrictHostKeyChecking=no ubuntu@18.216.122.218 "sudo systemctl stop pretrendr.service; sudo rm /home/ubuntu/pretrendr/backend/pretrendr-0.1.0.jar; sudo rm -rf /home/ubuntu/pretrendr/backend/amos-ws18-proj3; sudo rm -rf /home/ubuntu/pretrendr/backend/src; sudo rm -rf /home/ubuntu/pretrendr/backend/amos-ws18-proj3; sudo mv /home/ubuntu/amos-ws18-proj3.tar.gz /home/ubuntu/pretrendr/backend; cd /home/ubuntu/pretrendr/backend; sudo tar -xvzf amos-ws18-proj3.tar.gz; sudo rm /home/ubuntu/pretrendr/backend/amos-ws18-proj3.tar.gz; sudo rm -rf /home/ubuntu/pretrendr/backend/log; cd /home/ubuntu/pretrendr/backend/amos-ws18-proj3/backendRestDraft; sudo rm -rf /home/ubuntu/pretrendr/backend/.db; sudo mvn clean install; sudo mv /home/ubuntu/pretrendr/backend/amos-ws18-proj3/backendRestDraft/target/pretrendr-0.1.0.jar /home/ubuntu/pretrendr/backend; sudo mv /home/ubuntu/pretrendr/backend/amos-ws18-proj3/backendRestDraft/src /home/ubuntu/pretrendr/backend/; sudo systemctl start pretrendr.service"
sudo rm AMOS_EC2_KEY.pem
echo "Production: Pretrendr (Backend) deployed"
